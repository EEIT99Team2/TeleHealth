package controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import model.analysisRecordsBean;
import model.analysisRecordsService;
import model.dataanalysisBean;
import model.dataanalysisService;
import spring.PrimitiveNumberEditor;

@Controller
@RequestMapping(path={"/page/userEnter.controller"})
public class dataanalysisRecordsController {
	@InitBinder
	public void initializer(WebDataBinder webDataBinder) {
		webDataBinder.registerCustomEditor(java.util.Date.class,
				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
		
		webDataBinder.registerCustomEditor(int.class,
				new PrimitiveNumberEditor(java.lang.Integer.class, true));
		
		webDataBinder.registerCustomEditor(double.class,
				new PrimitiveNumberEditor(java.lang.Double.class, true));
	}
	
	@Autowired
	private dataanalysisService dataanalysisservice=null;
	@Autowired
	private analysisRecordsService analysisRecordsservice=null;

//還沒取得登入的ID
	String memberid = "B0041CB5-09F1-4E5B-8D57-1F0406019143";
			
	@RequestMapping(method= {RequestMethod.GET,RequestMethod.POST})
	public String method(String button,analysisRecordsBean recordsbean,BindingResult bindingResult,
			Model model) {
			
		Map<String, String> errors = new HashMap<>();
		model.addAttribute("errors", errors);
		System.out.println("min="+recordsbean.getMinBloodPressure());
		System.out.println("max="+recordsbean.getMaxBloodPressure());
// 轉換資料
		if (bindingResult != null && bindingResult.hasErrors()) {
			if (bindingResult.getFieldErrorCount("minBloodPressure") != 0) {
				errors.put("minBP", "請輸入整數");
			}
			if (bindingResult.getFieldErrorCount("maxBloodPressure") != 0) {
				errors.put("maxBP", "請輸入整數");
			}
			if (bindingResult.getFieldErrorCount("minBloodSugar") != 0) {
				errors.put("minBS", "請輸入整數");
			}
			if (bindingResult.getFieldErrorCount("maxBloodSugar") != 0) {
				errors.put("maxBS", "請輸入整數");
			}
			if (bindingResult.getFieldErrorCount("height") != 0) {
				errors.put("height", "身高是數字");
			}
			if (bindingResult.getFieldErrorCount("weight") != 0) {
				errors.put("weight", "請輸入數字");
			}
			if (bindingResult.getFieldErrorCount("Heartbeat") != 0) {
				errors.put("Heartbeat", "請輸入整數");
			}
		}
		
//驗證資料
		if(recordsbean.getMinBloodPressure()==0||recordsbean.getMaxBloodPressure()==0) {
			errors.put("minBP","請輸入最小血壓");
			errors.put("maxBP","請輸入最大血壓");
		}
		
		if(recordsbean.getMinBloodSugar()==0) {
			errors.put("minBS","請輸入最小血糖");
		}
		if(recordsbean.getMaxBloodSugar()==0) {
			errors.put("maxBS","請輸入最大血糖");
		}
		if(recordsbean.getHeight()==0) {
			errors.put("height","請輸入身高");
		}
		if(recordsbean.getWeight()==0) {
			errors.put("weight","請輸入體重");
		}
		if(recordsbean.getHeartBeat()==0) {
			errors.put("Heartbeat","請輸入心跳值");
		}
		if("Insert".equals(button)) {
			if(recordsbean.getMinBloodPressure()==0) {
				errors.put("minBP", "錯誤");
			}
		}
		if(errors!=null && !errors.isEmpty()) {
			return "null";
		}
//呼叫model
//根據model執行結果呼叫view元件
			if("Data".equals(button)) {
				List<dataanalysisBean> result = dataanalysisservice.selectDataAll();
				model.addAttribute("SELECT", result);
				return "selectdata.table";				
			}
			else if("memberhistory".equals(button)) {
				List<analysisRecordsBean> result = analysisRecordsservice.selectMemberRecords(memberid);
				model.addAttribute("SelectRecords", result);
				return "selectRecords.table";
			}
			else if("Insert".equals(button)) {
				analysisRecordsBean result = analysisRecordsservice.insert(recordsbean);
				if(result==null)
				model.addAttribute("insert",result);
				return "null";
			}
			else {				
				return "null";
			}
	}
}
