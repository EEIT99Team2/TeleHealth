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
		String bmiresult = null;
		if(age<18) {
			DataAnalysisBean lowData = dataAnalysisDao.bmiLow17(gender, age);
			Double lowminval = lowData.getMinvalue();//15
			Double lowmaxval = lowData.getMaxvalue();//21
			bmiresult = lowData.getResult();
			if (bmi<lowminval) {
				bmiresult = "體重過輕";
			}else if(bmi>=(lowminval+7) && bmi<=(lowmaxval+7)){
				bmiresult = "過重";
			}else if(bmi>=(lowminval+17) && bmi<=(lowmaxval+17)) {
				bmiresult = "輕度肥胖";
			}else if(bmi>=(lowminval+21) && bmi<=(lowmaxval+21)) {
				bmiresult = "中度肥胖";
			}else if(bmi>=(lowminval+28) && bmi<=(lowmaxval+28)) {
				bmiresult = "重度肥胖";
			}else if(bmi>=50){
				bmiresult = "病態肥胖";
			}
		}else if(age>=18) {
			if(bmi>110) {
				bmiresult = "病態肥胖";
			}else {
				DataAnalysisBean upData = dataAnalysisDao.bmiUp18(gender, age, bmi);
				bmiresult = upData.getResult();				
			}
		}
		bean.getHeight();
		bean.getWeight();
		bean.getBmi();
		bean.setResult(bmiresult);
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
			//7
			public List<BMIBean> selectMemberidseven(String memberid) {
				List<BMIBean> result = bmiDao.sevenData(memberid);
				return result;
			}
			//30
			public List<BMIBean> selectMemberidthirty(String memberid) {
				List<BMIBean> result = bmiDao.thirtyData(memberid);
				return result;
			}
			//180
			public List<BMIBean> selectMemberidthreemon(String memberid) {
				List<BMIBean> result = bmiDao.thrmonthData(memberid);
				return result;
			}
	
}
