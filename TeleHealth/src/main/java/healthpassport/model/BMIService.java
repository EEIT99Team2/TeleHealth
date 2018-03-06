package healthpassport.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import healthpassport.model.dao.BMIDAO;
import healthpassport.model.dao.DataAnalysisDAO;

@Service
@Transactional
public class BMIService {
	@Autowired
	private BMIDAO bmiDao;
	@Autowired
	private DataAnalysisDAO dataAnalysisDao;

	private String gender = "M";
	private Integer age = 23;

	public BMIBean insert(BMIBean bean) {
		bean.setMemberid("B0041CB5-09F1-4E5B-8D57-1F0406019143");
		Double bmi = bean.getBmi();
		DataAnalysisBean lowData = null;
		DataAnalysisBean upData = null;
		if (gender.equals("M")) {
			if (age < 18) {
				lowData = dataAnalysisDao.bmiLow17(gender, age);
				System.out.println(lowData);
			} else {
				upData = dataAnalysisDao.bmiUp18(gender, age, bmi);
				System.out.println(upData);
			}
		} else {
			if (age < 18) {
				lowData = dataAnalysisDao.bmiLow17(gender, age);
				System.out.println(lowData);
			} else {
				upData = dataAnalysisDao.bmiUp18(gender, age, bmi);
				System.out.println(upData);
			}
		}
		String lowBmiResult = null;
		String upBmiResult = null;
		if (lowData != null) {
			lowBmiResult = lowData.getResult();
		}
		if (upData != null) {
			upBmiResult = upData.getResult();
		}
		bean.getHeight();
		bean.getWeight();
		bean.getBmi();
		if (lowBmiResult != null) {
			bean.setResult(lowBmiResult);
		} else if (upBmiResult != null) {
			bean.setResult(upBmiResult);
		}
		bean.setCreateTime(new java.util.Date());
		BMIBean result = bmiDao.insert(bean);
		return result;
	}
}
