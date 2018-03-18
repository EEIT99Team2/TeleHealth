package querydrugs.model;

import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;

import querydrugs.model.dao.DrugsDAOHibernate;

@Service
public class DrugsService {
	@Autowired
	private DrugsDAOHibernate drugsDAO;
	
	private String licenseNum = "licenseNum";
	private String effectiveDate = "effectiveDate";
	private String issueDate = "issueDate";
	private String clearanceNum = "clearanceNum";
	private String chineseName = "chineseName";
	private String englishName ="englishName";
	private String symptom = "symptom";
	private String formulation = "formulation";
	private String packs = "packs";
	private String category = "category";
	private String regulatoryLevel = "regulatoryLevel";
	private String ingredients = "ingredients";
	private String applicatorName = "applicatorName";
	private String manuName = "manuName";
	private String country = "country";
	private String usage = "usage";
	private String shape = "shape";
	private String color = "color";
	private String marks = "marks";
	private String pic = "pic";
	
	
	@Transactional(readOnly=true)
	public String queryDrugs(String licenseNumIn, String chineseNameIn, String englishNameIn, String manuNameIn,
			String symptomIn, String marksIn, String colorIn, String shapeIn, String formulationIn) {
		List<DrugBean> result = drugsDAO.selectByCondition(licenseNumIn, chineseNameIn, englishNameIn, 
				manuNameIn, symptomIn, marksIn, colorIn, shapeIn, formulationIn);
		LinkedList<HashMap<String,String>> beans = new LinkedList<HashMap<String,String>>();
		Iterator iterators = result.iterator();
		
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
	
	@Transactional(readOnly=true)
	public String queryDrugById(String licenseNumIn) {
		DrugBean result = null;
		if(licenseNumIn!=null && licenseNumIn.trim().length()>0) {
			result = drugsDAO.selectById(licenseNumIn);
		}
		HashMap<String, String> temp = new HashMap<>();
		String data = null;
		if(result != null) {
			temp.put(licenseNum, result.getLicenseNum());
			temp.put(effectiveDate, result.getEffectiveDate());
			temp.put(issueDate, result.getIssueDate());
			temp.put(clearanceNum, result.getClearanceNum());
			temp.put(chineseName, result.getChineseName());
			temp.put(englishName, result.getEnglishName());
			temp.put(symptom, result.getSymptom());
			temp.put(formulation, result.getFormulation());
			temp.put(packs, result.getPacks());
			temp.put(category, result.getCategory());
			temp.put(regulatoryLevel, result.getRegulatoryLevel());
			temp.put(ingredients, result.getIngredients());
			temp.put(applicatorName, result.getApplicatorName());
			temp.put(manuName, result.getManuName());
			temp.put(country, result.getCountry());
			temp.put(usage, result.getUsage());
			temp.put(shape, result.getShape());
			temp.put(color, result.getColor());
			temp.put(marks, result.getMarks());
			temp.put(pic, result.getPic());
			data = new Gson().toJson(temp);
			return data;
		}
		return null;
	}
}
