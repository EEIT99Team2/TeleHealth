package takeoffrecords.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import advisorymoment.model.AdvisoryMomentService;
import employees.model.dao.EmployeesDAO;
import takeoffrecords.model.TakeoffService;
import util.SendMail;

@Controller
public class TakeoffController {
	@Autowired
	private AdvisoryMomentService advisoryMomentService;
	
	@Autowired
	private EmployeesDAO employeesDAO;
	
	@Autowired
	private TakeoffService takeoffService;
	
	//員工申請假單
	@RequestMapping(path= {"/AdvisoryMoment/takeoff.controller"},method={RequestMethod.GET,RequestMethod.POST},produces= {"text/plain;charset=UTF-8"})
	public @ResponseBody String takeoffCheck(String MomentId,String EmpId,String TakeoffItem,String TakeoffReason) {
		String result = null;
		System.out.println(MomentId+";"+EmpId+";"+TakeoffItem+";"+TakeoffReason);
		if(TakeoffItem!=null && TakeoffItem.trim().length()!=0 &&TakeoffReason!=null && TakeoffReason.trim().length()!=0 ) {
			boolean insertResult= takeoffService.takeoffApplication(MomentId, EmpId, TakeoffItem, TakeoffReason);
			if(insertResult) {
				result = "您的請假申請已送出並審核中";
			}
		}else {
			result = "申請失敗，請確認是否正確輸入資料";
		}
		return result;
	}
	
	//後臺查看假單
	@RequestMapping(path= {"/AdvisoryMoment/takeoffData.controller"},method={RequestMethod.GET,RequestMethod.POST},produces= {"application/json;charset=UTF-8"})
	public @ResponseBody String takeoffData() {		
			String result= takeoffService.selectAll();
		return result;
	}
	
	//後臺審核假單
	@RequestMapping(path= {"/AdvisoryMoment/approveTakeoff.controller"},method={RequestMethod.GET,RequestMethod.POST},produces= {"text/plain;charset=UTF-8"})
	public @ResponseBody String approveTakeoff(String takeoffId,String empId,String empName,String MomentId,String calendar,String videoCode,String apResult,String reason) {
		boolean upResult= false;
		String finalResult = "回覆失敗";
		if(takeoffId!=null &&takeoffId.trim().length()!=0 && empId!=null &&empId.trim().length()!=0 && MomentId!=null &&MomentId.trim().length()!=0 && apResult!=null &&apResult.trim().length()!=0 && reason!=null &&reason.trim().length()!=0) {			
			//回覆請假申請
			upResult= takeoffService.updateApproved(takeoffId, apResult, reason);
		}
		if(upResult) {
			//核准且已有預約
			if(apResult.equals("Y") && !videoCode.equals("null")) {
				String account = takeoffService.selectMemAcc(videoCode);
				//刪除預約記錄(無預約則回傳false)
				advisoryMomentService.deleteMemReserve(videoCode, MomentId);
				//修改此項班表狀態
				advisoryMomentService.updateMoment(MomentId);
				//新增申請人請假次數
				employeesDAO.addTakeoffCount(empId);
				//寄信								
				SendMail.send(account,"牽伴遠端照護系統-重要通知","親愛的會員您好，\r\n本平台員工"+empName+"由於個人因素，無法如期與您在預約時段("+calendar.substring(0, 16)+")相會，\r\n因此我們已取消了您的預約，我們至上深深的歉意。\r\n除了退還您預約時所扣除的點數外，我們將給予您額外2個點數作為補償");
				//還錢
				takeoffService.updateMemPoint(account);
			//核准但沒預約
			}else if(apResult.equals("Y") && videoCode.equals("null")) {
				//修改此項班表狀態
				advisoryMomentService.updateMoment(MomentId);
				//新增申請人請假次數
				employeesDAO.addTakeoffCount(empId);
			}
			finalResult="已回覆申請人";
		}		
		return finalResult;
	}
	
}
