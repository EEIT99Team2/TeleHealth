package takeoffrecords.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import takeoffrecords.model.TakeoffService;

@Controller
public class TakeoffController {
	
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
}
