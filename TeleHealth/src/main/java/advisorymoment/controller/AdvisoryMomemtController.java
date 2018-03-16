package advisorymoment.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import advisorymoment.model.AdvisoryMomentBean;
import advisorymoment.model.AdvisoryMomentService;
import employees.model.EmployeesBean;
import employees.model.dao.EmployeesDAO;
import expendRecord.model.ExpendRecordBean;
import expendRecord.model.ExpendRecordService;

@Controller
public class AdvisoryMomemtController {
	@Autowired
	private AdvisoryMomentService advisoryMomentService;
	@Autowired
	private EmployeesDAO employeesDAO;
	@Autowired
	private ExpendRecordService expendRecordService;
	
	//會員用代號搜尋
	@RequestMapping(path = { "/AdvisoryMomemt/memberSelectByCode.controller" }, method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public @ResponseBody String memberSelectByCode(String UserId, String advisoryCode) {
		String data=null;
		if(UserId!=null&&UserId.trim().length()!=0) {
			if(advisoryCode!=null && advisoryCode.trim().length()!=0) {
				data=advisoryMomentService.memberSelectByCode(UserId,advisoryCode);
			}else {
				data="類別代號有誤";				
			}
		}else {
			data="請登入或註冊為會員";
		}
		return data;
	}
	//會員進入查詢班表畫面
	@RequestMapping(path = { "/AdvisoryMomemt/memberSelectAll.controller" }, method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public @ResponseBody String memberSelectAll(String UserId) {
		String data="";
		if(UserId!=null&&UserId.trim().length()!=0) {
			data=advisoryMomentService.memberSelectAll(UserId);
		}else {
			data="請登入或註冊為會員";
		}		
		return data;
	}
	
	//會員取消預約
	@RequestMapping(path = { "/AdvisoryMomemt/memberCancelRes.controller" }, method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String memberCancelRes(String MomentId,String VideoCode,String UserId) {
		String ReturnResult="fail";
		boolean DeleteResult=false;
		boolean Refund=false;
		boolean expendRecord=false;
		if(MomentId!=null && MomentId.trim().length()!=0 && VideoCode!=null && VideoCode.trim().length()!=0) {
			DeleteResult = advisoryMomentService.deleteMemReserve(VideoCode, MomentId);
			//還錢
			Refund =advisoryMomentService.updateMemPoint(UserId);
			//更新消費紀錄
			ExpendRecordBean bean =new ExpendRecordBean();
			bean.setMemberId(UserId);
			bean.setAdvisoryMomentId(MomentId);
			expendRecord=expendRecordService.update(bean);
		}
		if(DeleteResult && Refund && expendRecord) {
			ReturnResult="success";
		}
		return ReturnResult;
	}
	//員工進入查詢班表畫面
	@RequestMapping(path = { "/AdvisoryMomemt/employeeSelectAll.controller" }, method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public @ResponseBody String employeeSelectAll(String EmpId) throws InterruptedException {
		String data="";
		if(EmpId!=null&&EmpId.trim().length()!=0) {
			data=advisoryMomentService.employeeSelectAll(EmpId);
		}else {
			data="您還未成為員工";
		}
		return data;
	}		
	
	@RequestMapping(path = { "/AdvisoryMomemt/employeeSelectById.controller" }, method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public @ResponseBody String employeeSelectById(String EmpId) {
		String data="";
		if(EmpId!=null&&EmpId.trim().length()!=0) {
			data=advisoryMomentService.employeeSelectById(EmpId);
		}else {
			data="未查詢到您的班表";
		}
		return data;
	}	
	
	//員工自行新增班表
	@RequestMapping(path = { "/AdvisoryMomemt/empAddMoment.controller" }, method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String empAddMoment(String empId,String account,String start) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String result=null;
		if(account!=null && account.trim().length()!=0 && start!=null && start.trim().length()!=0) {
			EmployeesBean empBean = employeesDAO.selectByAccount(account);
			if(empBean.getEmpId().equals(empId)) {			
				java.util.Date newCalendar = sdf.parse(start);
				AdvisoryMomentBean admBean = new AdvisoryMomentBean();
				admBean.setCalendar(newCalendar);
				admBean.setReserveStatus("E");
				admBean.setAdvisoryCode(empBean.getAdvisoryCode());
				admBean.setEmpId(empId);
				admBean.setStatus("Y");
				advisoryMomentService.insert(admBean);
				result="success";
			}
		}else {
			result="fail";
		}
		return result;
	}
}
