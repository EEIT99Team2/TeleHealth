package querydrugs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import querydrugs.model.DrugsService;

@Controller
public class DrugsController {
	@Autowired
	private DrugsService drugsService;
	
	@RequestMapping(path="/querydrugs.controller", 
			method= {RequestMethod.GET, RequestMethod.POST},
			produces = "application/json;charset=UTF-8")
	public @ResponseBody String memberSelectByCode(String chineseName, String symptom,String englishName, String manuName, 
			String marks, String color, String shape, String formulation) {
		if(chineseName == null || chineseName.trim().length()==0) {
			chineseName = "";
		}
		if(englishName == null || englishName.trim().length()==0) {
			englishName = "";
		}
		if(manuName == null || manuName.trim().length()==0) {
			manuName = "";
		}
		if(symptom == null || symptom.trim().length()==0) {
			symptom = "";
		}
		if(marks == null || marks.equals("N") || marks.trim().equals("undefined")) {
			marks = "沒有";
		} else { 
			marks = "有";
		}
		if(color == null || color.trim().equals("undefined")) {
			color = "";
		}
		if(shape == null || shape.trim().equals("undefined")) {
			shape = "";
		}
		if(formulation == null || formulation.trim().equals("undefined")) {
			formulation = "";
		}
		
		return drugsService.queryDrugs(chineseName, englishName, manuName, symptom, marks, color, shape, formulation);
	}
}
