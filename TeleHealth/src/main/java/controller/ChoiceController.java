package controller;


import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import advisoryMoment.model.AdvisoryMomentBean;
import advisoryMoment.model.AdvisoryService;

@Controller
public class ChoiceController {
	@Autowired
	private ApplicationContext context;
	@Autowired
	private AdvisoryService advisoryService;
	
	
//	public String memberUse1(AdvisoryBean bean,Model model,@RequestParam("date") String date,
//			@RequestParam("time") String time,@RequestParam("status") String status,@RequestParam("advisoryCode") String advisoryCode,
//			@RequestParam("Id") String Id,@RequestParam("videoCode") String videoCode) throws ParseException {
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		java.util.Date newdate = null;
//		newdate = sdf.parse(date);
//		int newtime =0;
//		newtime = Integer.parseInt(time);
//		AdvisoryBean result = advisoryService.select(newdate, newtime, advisoryCode);
//		model.addAttribute("select",result);
//		
//		return "test";
//	}
	@RequestMapping(path= {"/AdvisoryMomemt/Choice.controller"},method= {RequestMethod.GET,RequestMethod.POST},produces="application/json;charset=UTF-8")	
	public @ResponseBody String memberUse2(String advisoryCode){
		LinkedList<HashMap<String,String>> datafinal = new LinkedList<HashMap<String,String>>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<Object[]> result = advisoryService.select(advisoryCode);
		for(int i = 0;i<result.size();i++) {
			HashMap<String,String>  dataOne = new HashMap<String,String>();
			String calendar =sdf.format(result.get(i)[0]);
			String status = result.get(i)[1].toString();						
			String adCode = result.get(i)[2].toString();
			String empName = result.get(i)[3].toString();
			dataOne.put("title", adCode+"\r\n"+empName);
			dataOne.put("start", calendar);	
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
	@RequestMapping(path= {"/AdvisoryMomemt/selectAll.controller"},method= {RequestMethod.GET,RequestMethod.POST},produces="application/json;charset=UTF-8")	
	public @ResponseBody String memberUse3(){
		LinkedList<HashMap<String,String>> datafinal = new LinkedList<HashMap<String,String>>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<Object[]> result = advisoryService.selectAll();
		for(int i = 0;i<result.size();i++) {
			HashMap<String,String>  dataOne = new HashMap<String,String>();
			String calendar =sdf.format(result.get(i)[0]);
			String status = result.get(i)[1].toString();						
			String advisoryCode = result.get(i)[2].toString();
			String empName = result.get(i)[3].toString();
			dataOne.put("title", advisoryCode+"\r\n"+empName);
			dataOne.put("start", calendar);
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
