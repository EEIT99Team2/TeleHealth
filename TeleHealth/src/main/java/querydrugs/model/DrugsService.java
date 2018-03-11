package querydrugs.model;

import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;

import querydrugs.model.dao.DrugsDAO;

@Service
public class DrugsService {
	@Autowired
	private DrugsDAO drugsDAO;
	
	@Transactional(readOnly=true)
	public String queryDrugs(String licenseNumIn, String chineseNameIn, String englishNameIn, String manuNameIn,
			String symptomIn, String marksIn, String colorIn, String shapeIn, String formulationIn) {
		List<DrugBean> result = drugsDAO.selectByCondition(licenseNumIn, chineseNameIn, englishNameIn, 
				manuNameIn, symptomIn, marksIn, colorIn, shapeIn, formulationIn);
		LinkedList<HashMap<String,String>> beans = new LinkedList<HashMap<String,String>>();
		Iterator iterators = result.iterator();
		String licenseNum = "licenseNum";
		String effectiveDate = "effectiveDate";
		String issueDate = "issueDate";
		String clearanceNum = "clearanceNum";
		String chineseName = "chineseName";
		String englishName ="englishName";
		String symptom = "symptom";
		String formulation = "formulation";
		String packs = "packs";
		String category = "category";
		String regulatoryLevel = "regulatoryLevel";
		String ingredients = "ingredients";
		String applicatorName = "applicatorName";
		String manuName = "manuName";
		String country = "country";
		String usage = "usage";
		String shape = "shape";
		String color = "color";
		String marks = "marks";
		String pic = "pic";
		
		while(iterators.hasNext()) {
			HashMap<String, String> bean = new HashMap<String, String>();
			DrugBean temp = (DrugBean)(iterators.next());
			bean.put(licenseNum, temp.getLicenseNum());
			bean.put(effectiveDate, temp.getEffectiveDate());
			bean.put(issueDate, temp.getIssueDate());
			bean.put(clearanceNum, temp.getClearanceNum());
			bean.put(chineseName, temp.getChineseName());
			bean.put(englishName, temp.getEnglishName());
			bean.put(symptom, temp.getSymptom());
			bean.put(formulation, temp.getFormulation());
			bean.put(packs, temp.getPacks());
			bean.put(category, temp.getCategory());
			bean.put(regulatoryLevel, temp.getRegulatoryLevel());
			bean.put(ingredients, temp.getIngredients());
			bean.put(applicatorName, temp.getApplicatorName());
			bean.put(manuName, temp.getManuName());
			bean.put(country, temp.getCountry());
			bean.put(usage, temp.getUsage());
			bean.put(shape, temp.getShape());
			bean.put(color, temp.getColor());
			bean.put(marks, temp.getMarks());
			bean.put(pic, temp.getPic());
			beans.add(bean);
		}
		HashMap<String,LinkedList<HashMap<String,String>>> datas = new HashMap<String,LinkedList<HashMap<String,String>>>();
		datas.put("data", beans);
		
		String data = new Gson().toJson(datas);
		return data;
	}
}
