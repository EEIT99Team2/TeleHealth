package healthpassport.model;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import healthpassport.model.dao.BloodPressureDAO;
import healthpassport.model.dao.DataAnalysisDAO;

@Service
@Transactional
public class BloodPressureService {
	@Autowired
	private BloodPressureDAO bloodPressureDao;
	@Autowired
	private DataAnalysisDAO dataAnalysisDao;

	public BloodPressureBean insert(BloodPressureBean bean, String gender, Integer age, String Diastole, String Systole,
			String heartbeat) {
		// client端
		Integer cMaxBP = bean.getMaxBloodPressure();
		Integer cMinBP = bean.getMinBloodPressure();
		Integer cHb = bean.getHeartBeat();
		// DB傳進資料
		DataAnalysisBean Systolebean = dataAnalysisDao.selectGroupId(Systole, gender, age);
		DataAnalysisBean Diastolebean = dataAnalysisDao.selectGroupId(Diastole, gender, age);
		DataAnalysisBean heartBeatbean = dataAnalysisDao.selectGroupId(heartbeat, gender, age);
		// 收縮壓
		Double SysMin = Systolebean.getMinvalue();
		Double SysMax = Systolebean.getMaxvalue();
		String SResult = Systolebean.getResult();
		if (SResult != null && cMaxBP < SysMin) {
			SResult = "收縮壓過低";
		}else if(SResult != null && cMaxBP > SysMax) {
			SResult = "收縮壓過高";
		}
		// 舒張壓
		Double DiaMin = Diastolebean.getMinvalue();
		Double DiaMax = Diastolebean.getMaxvalue();
		String DResult = Diastolebean.getResult();
		if (DResult != null && cMinBP < DiaMin) {
			DResult = "舒張壓過低";
		} else if (DResult != null && cMinBP > DiaMax) {
			DResult = "舒張壓過高";
		}
		// 心跳值
		Double HBMin = heartBeatbean.getMinvalue();
		Double HBMax = heartBeatbean.getMaxvalue();
		String hResult = heartBeatbean.getResult();
		if (hResult != null && cHb < HBMin) {
			hResult = "心跳值過低";
		} else if (hResult != null && cHb > HBMax) {
			hResult = "心跳值過高";
		}
		String allResult =SResult+","+DResult+","+hResult;
		bean.getMemberid();
		bean.getMinBloodPressure();
		bean.getMaxBloodPressure();
		bean.getHeartBeat();
		bean.setResult(allResult);
		bean.setCreateTime(new java.util.Date());
		BloodPressureBean result = bloodPressureDao.insert(bean);
		return result;
	}
}
