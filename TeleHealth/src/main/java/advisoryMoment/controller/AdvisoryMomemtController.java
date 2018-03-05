package advisoryMoment.controller;


import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import advisoryMoment.model.AdvisoryMomentService;

@Controller
public class AdvisoryMomemtController {
	@Autowired
	private AdvisoryMomentService advisoryService;
	
//	@RequestMapping(path= {"/AdvisoryMomemt/UserCheck.controller"},method= {RequestMethod.POST},produces="text/html;charset=UTF-8")
//	public @ResponseBody String UserCheck(String userId) {
//		String result=null;
//		if(userId !=null && userId.trim().length()!=0) {
//			
//			System.out.println("Good!!!");
//			result="有了";			
//		}
//		return result;
//	}
	
	
	@RequestMapping(path= {"/AdvisoryMomemt/MemberSelectByCode.controller"},method= {RequestMethod.GET,RequestMethod.POST},produces="application/json;charset=UTF-8")	
	public @ResponseBody String MemberSelectByCode(String advisoryCode){
		LinkedList<HashMap<String,String>> datafinal = new LinkedList<HashMap<String,String>>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<Object[]> result = advisoryService.select(advisoryCode);
		for(int i = 0;i<result.size();i++) {
			HashMap<String,String>  dataOne = new HashMap<String,String>();
			String MomentId = result.get(i)[0].toString();
			String calendar =sdf.format(result.get(i)[1]);
			Date fiftymin = new Date(Timestamp.valueOf(result.get(i)[1].toString()).getTime()+900000);
			String endtime =sdf.format(fiftymin);
			String status = result.get(i)[2].toString();						
			String adCode = result.get(i)[3].toString();
			String empId = result.get(i)[4].toString();
			String empName = result.get(i)[5].toString();
			dataOne.put("title", adCode+"\r\n"+empName+"醫生");
			dataOne.put("start", calendar);
			dataOne.put("empId", empId);
			dataOne.put("end", endtime);
			dataOne.put("MomentId", MomentId);			
			if(status.equals("E")) {
				dataOne.put("backgroundColor", "#0080ff");
				dataOne.put("borderColor", "black");
			}else if(status.equals("F")) {
				dataOne.put("backgroundColor", "#ea0000");
				dataOne.put("borderColor", "black");
			}
			datafinal.add(dataOne);
		}		
		String data = new Gson().toJson(datafinal);
		System.out.println("JSON="+data);
		return data;
	}
	@RequestMapping(path= {"/AdvisoryMomemt/MemberSelectAll.controller"},method= {RequestMethod.GET,RequestMethod.POST},produces="application/json;charset=UTF-8")	
	public @ResponseBody String MemberSelectAll(){
		LinkedList<HashMap<String,String>> datafinal = new LinkedList<HashMap<String,String>>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<Object[]> result = advisoryService.selectAll();
		for(int i = 0;i<result.size();i++) {
			HashMap<String,String>  dataOne = new HashMap<String,String>();
			String MomentId = result.get(i)[0].toString();
			String calendar =sdf.format(result.get(i)[1]);
			//增加15分鐘
			Date fiftymin = new Date(Timestamp.valueOf(result.get(i)[1].toString()).getTime()+900000);
			String endtime =sdf.format(fiftymin);
			String status = result.get(i)[2].toString();						
			String advisoryCode = result.get(i)[3].toString();
			String empId = result.get(i)[4].toString();
			String empName = result.get(i)[5].toString();
			dataOne.put("title", advisoryCode+"\r\n"+empName+"醫生");
			dataOne.put("start", calendar);
			dataOne.put("empId", empId);
			dataOne.put("end", endtime);
			dataOne.put("MomentId", MomentId);
			if(status.equals("E")) {
				dataOne.put("backgroundColor", "#0080ff");
				dataOne.put("borderColor", "black");
			}else if(status.equals("F")) {
				dataOne.put("backgroundColor", "#ea0000");
				dataOne.put("borderColor", "black");				
			}
			datafinal.add(dataOne);
		}		
		String data = new Gson().toJson(datafinal);
		System.out.println("JSON="+data);
		return data;
	}
	
	@RequestMapping(path= {"/AdvisoryMomemt/ManagerEdit.controller"},method= {RequestMethod.GET,RequestMethod.POST},produces="application/json;charset=UTF-8")	
	public @ResponseBody String ManagerEdit(){
		LinkedList<HashMap<String,String>> datafinal = new LinkedList<HashMap<String,String>>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<Object[]> result = advisoryService.selectAll();
		for(int i = 0;i<result.size();i++) {
			HashMap<String,String>  dataOne = new HashMap<String,String>();
			String calendar =sdf.format(result.get(i)[0]);
			String status = result.get(i)[1].toString();						
			String advisoryCode = result.get(i)[2].toString();
			String empId = result.get(i)[3].toString();
			String empName = result.get(i)[4].toString();
			dataOne.put("title", advisoryCode+"\r\n"+empName+"醫生");
			dataOne.put("start", calendar);
			dataOne.put("empId", empId);
			if(status.equals("E")) {
				dataOne.put("backgroundColor", "#0080ff");
				dataOne.put("borderColor", "black");
				dataOne.put("editable", "true");
			}else if(status.equals("F")) {
				dataOne.put("backgroundColor", "#ea0000");
				dataOne.put("borderColor", "black");				
			}
			datafinal.add(dataOne);
		}		
		String data = new Gson().toJson(datafinal);
		System.out.println("JSON="+data);
		return data;
	}
}
