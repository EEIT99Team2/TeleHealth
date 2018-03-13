package healthpassport.model;

import java.util.List;

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

	public BMIBean insert(BMIBean bean,String gender,Integer age) {
		bean.getMemberid();
		Double bmi = bean.getBmi();
		DataAnalysisBean lowData = null;
		DataAnalysisBean upData = null;
		if (gender.equals("M")) {
			if (age < 18) {
				lowData = dataAnalysisDao.bmiLow17(gender, age);
			} else {
				upData = dataAnalysisDao.bmiUp18(gender, age, bmi);
			}
		} else {
			if (age < 18) {
				lowData = dataAnalysisDao.bmiLow17(gender, age);
			} else {
				upData = dataAnalysisDao.bmiUp18(gender, age, bmi);
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
	
	public List<BMIBean> selectMemberid(String memberid) {
		List<BMIBean> result = bmiDao.selectMemberId(memberid);
		return result;
	}
	
	public BMIBean newOne(String memberid) {
		BMIBean result = bmiDao.topOneData(memberid);
		return result;
	}
	
	
}
