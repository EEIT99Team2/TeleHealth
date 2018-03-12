package advisorymoment.controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import advisorymoment.model.AdvisoryMomentService;

@Controller
public class AdvisoryMomemtController {
	@Autowired
	private AdvisoryMomentService advisoryMomentService;

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
	
	
	@RequestMapping(path = { "/AdvisoryMomemt/memberCancelRes.controller" }, method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String memberCancelRes(String MomentId,String VideoCode,String UserId) {
		String ReturnResult="預約取消失敗";
		boolean DeleteResult=false;
		boolean Refund=false;
		if(MomentId!=null && MomentId.trim().length()!=0 && VideoCode!=null && VideoCode.trim().length()!=0) {
			DeleteResult = advisoryMomentService.deleteMemReserve(VideoCode, MomentId);
			//還錢
			Refund =advisoryMomentService.updateMemPoint(UserId);
		}
		if(DeleteResult && Refund) {
			ReturnResult="預約取消成功";
		}
		return ReturnResult;
	}
	
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
	
	
	@RequestMapping(path = { "/AdvisoryMomemt/ManagerEdit.controller" }, method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public @ResponseBody String ManagerEdit() {
		LinkedList<HashMap<String, String>> datafinal = new LinkedList<HashMap<String, String>>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<Object[]> result = advisoryMomentService.selectAll();
		for (int i = 0; i < result.size(); i++) {
			HashMap<String, String> dataOne = new HashMap<String, String>();
			String calendar = sdf.format(result.get(i)[0]);
			String status = result.get(i)[1].toString();
			String advisoryCode = result.get(i)[2].toString();
			String empId = result.get(i)[3].toString();
			String empName = result.get(i)[4].toString();
			dataOne.put("title", advisoryCode + "\r\n" + empName + "醫生");
			dataOne.put("start", calendar);
			dataOne.put("empId", empId);
			if (status.equals("E")) {
				dataOne.put("backgroundColor", "#0080ff");
				dataOne.put("borderColor", "black");
				dataOne.put("editable", "true");
			} else if (status.equals("F")) {
				dataOne.put("backgroundColor", "#ea0000");
				dataOne.put("borderColor", "black");
			}
			datafinal.add(dataOne);
		}
		String data = new Gson().toJson(datafinal);
		System.out.println("JSON=" + data);
		return data;
	}
}
