package advisory.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import advisory.model.AdvisoryBean;
import advisory.model.AdvisoryService;
import advisorymoment.model.AdvisoryMomentBean;
import advisorymoment.model.AdvisoryMomentService;
import employees.model.EmployeesService;
import expendRecord.model.ExpendRecordBean;
import expendRecord.model.ExpendRecordService;
import register.model.LoginService;
import register.model.MemberBean;

@Controller
public class AdvisoryController {
	@Autowired
	private AdvisoryService advisoryService;
	@Autowired
	private AdvisoryMomentService advisoryMomentService;
	@Autowired
	private EmployeesService employeesService;
	@Autowired
	private LoginService loginService;	
	@Autowired
	private ExpendRecordService expendRecordService;
	//會員預約成功，新增預約記錄
	@RequestMapping(path= {"/Advisory/reserveCheck.controller"},method= {RequestMethod.POST},produces="text/plain;charset=UTF-8")
	public @ResponseBody String reserveCheck(String advisoryTime,String reserveItem,String reserveEmp,String empId,String UserId,String MomentId) throws ParseException {
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
			advisorybean.setStatus("N");
			advisoryService.insert(advisorybean);
			//修改班表預約狀態(table:AdvisoryMoment)
			AdvisoryMomentBean advisoryMomentBean = new AdvisoryMomentBean();
			advisoryMomentBean.setId(MomentId);
			advisoryMomentBean.setReserveStatus("F");
			advisoryMomentBean.setVideoCode(videoCode);
			advisoryMomentService.updateByReserve(advisoryMomentBean);
			result="您的預約成功";			
			sendTime = sdfForCreate.format(createTime);
			//會員給錢			
			advisoryService.updateMemPoint(UserId);
			//新增會員消費紀錄
			ExpendRecordBean bean =new ExpendRecordBean();
			bean.setMemberId(UserId);
			bean.setModifytime(new Date());
			bean.setRecord(5);
			bean.setAdvisoryMomentId(MomentId);
			expendRecordService.insert(bean);
			//增加員工預約點擊數
			employeesService.addResCount(empId);		
		}
		return result+","+videoCode+",,"+sendTime;
	}
	
	//會員查看預約記錄
	@RequestMapping(path= {"/Advisory/memberReserve.controller"},method= {RequestMethod.GET,RequestMethod.POST},produces="application/json;charset=UTF-8")
	public @ResponseBody String memberReserve(String memberId){
		String result=null;
		if(memberId!=null && memberId.trim().length()!=0) {
			result=advisoryService.selectByMemId(memberId);
		}
		return result;
	}
	
	//員工查看預約記錄
	@RequestMapping(path= {"/Advisory/empreserve.controller"},method= {RequestMethod.GET,RequestMethod.POST},produces="application/json;charset=UTF-8")
	public @ResponseBody String empReserve(String empId){
		String result=null;
		if(empId!=null && empId.trim().length()!=0) {
			result=advisoryService.selectByEmpId(empId.trim());
		}
		return result;
	}
	
	//員工更新諮詢內容
	@RequestMapping(
			path= {"/advisorycontent.controller"},
			method= {RequestMethod.GET,RequestMethod.POST},
			produces="application/json;charset=UTF-8"
	)
	public @ResponseBody String doctorinsert(String videoCode, String descrip){
		AdvisoryBean data = advisoryService.updateAdvisoryContent(videoCode, descrip);
		if(data != null) {
			return new Gson().toJson("insert.success");
		}else {
			return new Gson().toJson("insert.error");
		}
	}
	
	//員工修改視訊諮詢內容前，先呼叫controller取出原內容
	@RequestMapping(
			path= {"/selectadvisory.controller"},
			method= {RequestMethod.GET,RequestMethod.POST},
			produces="application/json;charset=UTF-8"
	)
	public @ResponseBody String advisorySelectByCode(String videoCode){
		AdvisoryBean bean =null;
		if(videoCode!=null && videoCode.trim().length()>0) {
			bean = advisoryService.select(videoCode.trim());
		}
		if(bean != null) {
			Map<String, AdvisoryBean> data = new HashMap<>();
			data.put("data", bean);
			return new Gson().toJson(data);
		}else {
			return new Gson().toJson("insert.error");
		}
	}
	
	
	//開始進行視訊
	@RequestMapping(path= {"/Advisory/startadvisory.controller"}, method = {RequestMethod.GET,RequestMethod.POST})
	public String startAdvisory(String videoCode, String reserveItem, Model model, HttpSession session) {
		String videoCodeIn = null;
		String reserveItemIn = null;
		Map<String, String> errorMsg = new HashMap<>();
		model.addAttribute("advisoryError", errorMsg); 
		if(videoCode!=null && videoCode.trim().length()>0) {
			videoCodeIn = videoCode.trim();
		} else {
			errorMsg.put("videoCodeError", "此視訊代號錯誤，請重新確認，或向管理員洽詢!");
		}
		if(videoCode!=null && videoCode.trim().length()>0) {
			videoCodeIn = videoCode.trim();
		}
		if(reserveItem!=null && reserveItem.trim().length()>0) {
			reserveItemIn = reserveItem.trim();
		}
		AdvisoryBean checkBean = advisoryService.select(videoCode);
		if(checkBean!=null && checkBean.getStatus().equals("N")) {
			MemberBean talkMember = loginService.selectById(checkBean.getMemberId());
			if(session.getAttribute("reserveItem")!=null) {
				session.removeAttribute("reserveItem");
			}
			if(session.getAttribute("videoCode")!=null) {
				session.removeAttribute("videoCode");
			}
			if(session.getAttribute("advisory")!=null) {
				session.removeAttribute("advisory");
			}
			if(session.getAttribute("talkMember") != null) {
				session.removeAttribute("talkMember");
			}
			session.setAttribute("reserveItem", reserveItemIn);
			session.setAttribute("videoCode", videoCodeIn);
			session.setAttribute("advisory", checkBean);
			session.setAttribute("talkMember", talkMember);
			
			if(session.getAttribute("empLoginOK") != null) {
				return "empadvisory.success";
			} else {
				return "advisory.success";
			}
		}
		errorMsg.put("videoCodeError", "此視訊代號錯誤，請重新確認，或向管理員洽詢!");
		if(session.getAttribute("empLoginOK") != null) {
			return "empadvisory.error";
		} else {
			return "advisory.error";
		}
	}
	
	//開始進行視訊
		@RequestMapping(path= {"/Advisory/setsatisfy.controller"}, method = {RequestMethod.GET,RequestMethod.POST})
		public @ResponseBody String setSatisfy(String videoCode, String satisfy, Model model, HttpSession session) {
			Integer satisfyValue = null;
			if(videoCode != null && videoCode.trim().length()>0) {
				if(satisfy != null && satisfy.trim().length()>0) {
					try {
						satisfyValue = Integer.parseInt(satisfy);
					} catch(Exception e) {
						System.out.println("評分非數字");
					}
					if(satisfyValue < 1) {
						satisfyValue = 5;
					}
					if(advisoryService.updateSatisfy(videoCode, satisfyValue) != null) {
						return "success";
					}
				}
			}
			return "error";
		}
}
