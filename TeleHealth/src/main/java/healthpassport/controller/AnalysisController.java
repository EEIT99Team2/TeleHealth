package healthpassport.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AnalysisController {

	@RequestMapping(
			path= {"/healthpassport/querybmi.controller"},
			method= {RequestMethod.GET,RequestMethod.POST},
			produces="application/json;charset=UTF-8")	
	public @ResponseBody String queryBMI(String height, String weight, String bmi, Model model) {
		try {
			Double heightResult = Double.parseDouble(height);
			Double weightResult = Double.parseDouble(weight);
			Double bmiResult = Double.parseDouble(bmi);
		} catch (NumberFormatException e) {
			e.printStackTrace();
			return null;
		}
		
		
		
		return "";
	}
	
}
