package healthpassport.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import healthpassport.model.BMIBean;
import healthpassport.model.BMIService;
import healthpassport.model.BloodPressureRecordsBean;
import healthpassport.model.DataAnalysisBean;
import healthpassport.model.dao.DataAnalysisDAO;

@Controller
public class AnalysisController {
	@Autowired
	private BMIService bmiService;
	
	@RequestMapping(
			path= {"/healthpassport/querybmi.controller"},
			method= {RequestMethod.GET,RequestMethod.POST},
			produces="application/json;charset=UTF-8")	
	public @ResponseBody String queryBMI(String memberid,String gender,String age,String height, String weight, String bmi, Model model) {
		try {
			Double heightResult = Double.parseDouble(height);
			Double weightResult = Double.parseDouble(weight);
			Double bmiResult = Double.parseDouble(bmi);
			
			BMIBean bean = new BMIBean();
			bean.setMemberid(memberid);
			String Gender = gender;
			Integer Age =Integer.parseInt(age);
			bean.setBmi(bmiResult);
			bean.setHeight(heightResult);
			bean.setWeight(weightResult);
			bmiService.insert(bean,Gender,Age);
			return null;
		} catch (NumberFormatException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@RequestMapping(
			path= {"/healthpassport/queryBloodPressure.controller"},
			method= {RequestMethod.GET,RequestMethod.POST},
			produces="application/json;charset=UTF-8")	
	public @ResponseBody String bloodPressure(String Diastole,String Systole,String heartBeat,String Age,String Gender,String SystoleData,String diastoleData,String heartBeatData) {
		DataAnalysisDAO dataAnalysisDao=new DataAnalysisDAO();
		String result="";
		Integer age = Integer.parseInt(Age);
		//client傳進值
		Integer SD = Integer.parseInt(SystoleData);
		Integer DD = Integer.parseInt(diastoleData);
		Integer HD = Integer.parseInt(heartBeatData);
		BloodPressureRecordsBean bprBean = new BloodPressureRecordsBean(); 
		//DB傳進資料
		DataAnalysisBean Diastolebean= dataAnalysisDao.selectGroupId(Diastole, Gender, age);
		DataAnalysisBean Systolebean= dataAnalysisDao.selectGroupId(Systole, Gender, age);
		DataAnalysisBean heartBeatbean= dataAnalysisDao.selectGroupId(heartBeat, Gender, age);
		
		Double DiaMin= Diastolebean.getMinvalue();
		Double DiaMax= Diastolebean.getMaxvalue();
		String DResult=Diastolebean.getResult();	
		if(DResult ==null || DResult.trim().length()==0 &&DD<DiaMin) {
			DResult="過低";
			bprBean.setResult(DResult);
		}else if(DResult ==null || DResult.trim().length()==0 && DD>DiaMin) {
			DResult="過高";
			bprBean.setResult(DResult);
		}		
		
		Double SysMin = Systolebean.getMinvalue();
		Double SysMax = Systolebean.getMaxvalue();
		String SResult=Systolebean.getResult();
		if(SResult ==null || SResult.trim().length()==0 &&SD<SysMin) {
			SResult="過低";
			bprBean.setResult(SResult);
		}else if(SResult ==null || SResult.trim().length()==0 && SD>SysMax) {
			SResult="過高";
			bprBean.setResult(SResult);
		}		
		
		
		String hResult=heartBeatbean.getResult();
		Double HBMin = heartBeatbean.getMinvalue();
		Double HBMax = heartBeatbean.getMaxvalue();
		if(hResult ==null || hResult.trim().length()==0 &&HD<HBMin) {
			hResult="過低";
			bprBean.setResult(hResult);
		}else if(hResult ==null || hResult.trim().length()==0 && HD>HBMax) {
			hResult="過高";
			bprBean.setResult(hResult);
		}
		
		return result;
	}	
	
}
