package advisory.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import advisory.model.AdvisoryBean;
import advisory.model.AdvisoryService;
import advisorymoment.model.AdvisoryMomentBean;
import advisorymoment.model.AdvisoryMomentService;

@Controller
public class AdvisoryController {
	@Autowired
	private AdvisoryService advisoryService;
	@Autowired
	private AdvisoryMomentService advisoryMomentService;
	
	@RequestMapping(path= {"/Advisory/ReserveCheck.controller"},method= {RequestMethod.POST},produces="text/plain;charset=UTF-8")
	public @ResponseBody String ReserveCheck(String advisoryTime,String reserveItem,String reserveEmp,String empId,String UserId,String MomentId) throws ParseException {
		String result=null;
		SimpleDateFormat sdfForReserve = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		SimpleDateFormat sdfForCreate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date reserveDate=sdfForReserve.parse(advisoryTime);
		java.util.Date createTime=new Date();
		String sendTime ="";
		char[] codeData=new char[5];
		int codeSelect;
		int code;
		String videoCode=null;
		for(int i =0;i<codeData.length;i++) {
			codeSelect=(int)(Math.random()*9+1);
			if(codeSelect<=3) {
				code=(int)(Math.random()*10+48);
			}else if(codeSelect>3&&codeSelect<=6) {
				code=(int)(Math.random()*26+65);
			}else {
				code=(int)(Math.random()*26+97);
			}		
			codeData[i]=(char)code;
		}
		
		
		if(advisoryTime==null || advisoryTime.trim().length()==0 || reserveItem==null || reserveItem.trim().length()==0 || reserveEmp==null || reserveEmp.trim().length()==0 || empId==null || empId.trim().length()==0 || UserId==null || UserId.trim().length()==0) {
			result="您的預約失敗";
		}else {
			//新增預約紀錄(table:Advisory)
			videoCode=String.valueOf(codeData, 0, 5);
			AdvisoryBean advisorybean = new AdvisoryBean();
			advisorybean.setVideoCode(videoCode);
			advisorybean.setMemberId(UserId);
			advisorybean.setEmpId(empId);
			advisorybean.setAdvisoryTime(reserveDate);
			advisorybean.setCreateTime(createTime);
			advisoryService.insert(advisorybean);
			//修改班表預約狀態(table:AdvisoryMoment)
			AdvisoryMomentBean advisoryMomentBean = new AdvisoryMomentBean();
			advisoryMomentBean.setId(MomentId);
			advisoryMomentBean.setReserveStatus("F");
			advisoryMomentBean.setVideoCode(videoCode);
			advisoryMomentService.updateByReserve(advisoryMomentBean);
			result="您的預約成功";			
			sendTime = sdfForCreate.format(createTime);
		}
	
		return result+","+videoCode+",,"+sendTime;
	}
}
