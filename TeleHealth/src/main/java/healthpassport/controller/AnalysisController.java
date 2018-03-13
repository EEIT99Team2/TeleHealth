package healthpassport.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import healthpassport.model.BMIBean;
import healthpassport.model.BMIService;
import healthpassport.model.BloodPressureBean;
import healthpassport.model.BloodPressureService;
import healthpassport.model.BloodSugarBean;
import healthpassport.model.BloodSugarService;

@Controller
public class AnalysisController {
	@Autowired
	private BMIService bmiService;
	@Autowired
	private BloodPressureService bloodPressureService; 
	@Autowired
	private BloodSugarService BloodSugarService ;
	
	private String memid ="B0041CB5-09F1-4E5B-8D57-1F0406019143";
	private Integer age = 19;
	private String gender = "M";
	//BMI
	@RequestMapping(
			path= {"/healthpassport/querybmi.controller"},
			method= {RequestMethod.GET,RequestMethod.POST},
			produces="text/plain;charset=UTF-8")	
//	String gender,String age
	public @ResponseBody String queryBMI(String memberid,
			String height, String weight,String bmi, Model model) {
		try {
			Double heightResult = Double.parseDouble(height);
			Double weightResult = Double.parseDouble(weight);
			Double bmiResult = Double.parseDouble(bmi);
			
			BMIBean bean = new BMIBean();
			bean.setMemberid(memid);

			bean.setBmi(bmiResult);
			bean.setHeight(heightResult);
			bean.setWeight(weightResult);

			BMIBean result = bmiService.insert(bean,gender,age);
			String bresult = result.getResult();
			model.addAttribute("bmiresult",bresult);
			System.out.println(bresult);
			return bresult;
		} catch (NumberFormatException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@RequestMapping(
			path= {"/healthpassport/bmirecords.controller"},
			method= {RequestMethod.GET,RequestMethod.POST},
			produces="application/json;charset=UTF-8")
	public @ResponseBody String bmiRecords(String memberid) {
		LinkedList<HashMap<String, String>> datafinal = new LinkedList<HashMap<String, String>>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<BMIBean> result = bmiService.selectMemberid(memberid);
		System.out.println(memberid);
		for(int i=0 ; i<result.size() ; i++) {
			HashMap<String, String> dataOne = new HashMap<String, String>();
			String height = result.get(i).getHeight().toString();
			String weight = result.get(i).getWeight().toString();
			String bmi = result.get(i).getBmi().toString();
			String bmiResult = result.get(i).getResult();
			String createTime =sdf.format(result.get(i).getCreateTime());
			dataOne.put("height", height);
			dataOne.put("weight", weight);
			dataOne.put("bmi", bmi);
			dataOne.put("bmiResult", bmiResult);
			dataOne.put("createTime", createTime);
			datafinal.add(dataOne);
		}
		HashMap<String,LinkedList<HashMap<String,String>>> datas = new HashMap<String,LinkedList<HashMap<String,String>>>();
		datas.put("data", datafinal);
		String data = new Gson().toJson(datas);
		System.out.println("JSON=" + data);
		return data;
	}
	
	

	//血壓
	@RequestMapping(
			path= {"/healthpassport/queryBloodPressure.controller"},
			method= {RequestMethod.GET,RequestMethod.POST},
			produces="application/json;charset=UTF-8")	
	public @ResponseBody String queryBloodPressure(String diastole,String systole,String heartBeat,
			String systoleData,String diastoleData,String heartBeatData,Model model) {
//		String gender,String age
		try {
			//client傳進值
			Integer SystoleD = Integer.parseInt(systoleData);
			Integer diastoleD = Integer.parseInt(diastoleData);
			Integer heartBeatD = Integer.parseInt(heartBeatData);
//			Integer Age =Integer.parseInt(age);
//			String gender = ?
			String d = diastole;
			String s = systole;
			String h = heartBeat;
			BloodPressureBean bean = new BloodPressureBean();
			bean.setMemberid(memid);
			bean.setMaxBloodPressure(SystoleD);
			bean.setMinBloodPressure(diastoleD);
			bean.setHeartBeat(heartBeatD);
			BloodPressureBean bpresult = bloodPressureService.insert(bean,gender,age,d,s,h);
			String result = bpresult.getResult();
			System.out.println(result);
			return result;
//			return "bloodPressure";
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}	

	@RequestMapping(
			path= {"/healthpassport/queryBloodSugar.controller"},
			method= {RequestMethod.GET,RequestMethod.POST},
			produces="application/json;charset=UTF-8"
			)
	public @ResponseBody String queryBloodSugar(String bloodsugar,Model model) {
		//clinet端值
		try {
			Integer bSugar = Integer.parseInt(bloodsugar);
			
			BloodSugarBean bean= new BloodSugarBean();
			bean.setMemberId(memid);
			bean.setBloodSugar(bSugar);
			BloodSugarBean result = BloodSugarService.insert(bean,gender,age);
			return null;
//		return "bloodSugar";
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
}
