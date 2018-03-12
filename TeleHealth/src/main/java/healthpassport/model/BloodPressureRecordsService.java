package healthpassport.model;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import healthpassport.model.dao.BloodPressureRecordsDAO;
import healthpassport.model.dao.DataAnalysisDAO;

@Service
@Transactional
public class BloodPressureRecordsService {
	@Autowired
	private BloodPressureRecordsDAO bloodPressureRecordsDao;
	@Autowired
	private DataAnalysisDAO dataAnalysisDao;
	String minBloodPressure ="BloodPressureDiastole";
	String maxBloodPressure ="BloodPressureSystole";
	String gender = "F";
	Integer age = 66;
	public BloodPressureRecordsBean insert(BloodPressureRecordsBean bean) {
		bean.setMemberid("B0041CB5-09F1-4E5B-8D57-1F0406019143");
		//client血壓值
		Integer minTemp = bean.getMinBloodPressure();
		Integer maxTemp = bean.getMaxBloodPressure();
		
		DataAnalysisBean Diastole =null;
		DataAnalysisBean Systole =null;
		if(gender.equals("M")) {
			Diastole = dataAnalysisDao.selectGroupId(minBloodPressure, gender, age);
		}else {
			Systole = dataAnalysisDao.selectGroupId(maxBloodPressure, gender, age);
		}
		//DB舒張壓值
		Double minDiastoleValue = Diastole.getMinvalue();
		//DB收縮壓值
		Double maxSystoleValue = Systole.getMaxvalue();
//		比對判斷值
//		if()
		
		
		String diastoleResult = null;
		String systoleResult = null;

		
		
		bean.getMinBloodPressure();
		bean.getMaxBloodPressure();
		bean.getHeartBeat();
		bean.setResult("正常");
		
		bean.setCreateTime(new java.util.Date());
		BloodPressureRecordsBean result = bloodPressureRecordsDao.insert(bean);
		return result;
	}
}
