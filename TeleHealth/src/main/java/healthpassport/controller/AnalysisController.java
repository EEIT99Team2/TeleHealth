package healthpassport.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import healthpassport.model.BMIBean;
import healthpassport.model.BMIService;

@Controller
public class AnalysisController {
	@Autowired
	private BMIService bmiService;
	
	
	//get String memberid,String gender,Integer age
	
	@RequestMapping(
			path= {"/healthpassport/querybmi.controller"},
			method= {RequestMethod.GET,RequestMethod.POST},
			produces="application/json;charset=UTF-8")	
	public @ResponseBody String queryBMI(String height, String weight, String bmi, Model model) {
		try {
			Double heightResult = Double.parseDouble(height);
			Double weightResult = Double.parseDouble(weight);
			Double bmiResult = Double.parseDouble(bmi);
			
			BMIBean bean = new BMIBean();
			bean.setBmi(bmiResult);
			bean.setHeight(heightResult);
			bean.setWeight(weightResult);
			bmiService.insert(bean);
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
	public @ResponseBody String bloodPressure(Integer Diastole,Integer Systole,Integer heartBeat) {
		return null;
	}	
	
}
