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
	
	public BloodPressureBean insert(BloodPressureBean bean,
			String gender,Integer age,String Diastole,String Systole,String heartbeat) {
		//client端
		Integer cMaxBP = bean.getMaxBloodPressure();
		Integer cMinBP = bean.getMinBloodPressure();
		Integer cHb = bean.getHeartBeat();
		// DB傳進資料
		DataAnalysisBean Systolebean = dataAnalysisDao.selectGroupId(Systole, gender, age);
		DataAnalysisBean Diastolebean = dataAnalysisDao.selectGroupId(Diastole, gender, age);
		DataAnalysisBean heartBeatbean = dataAnalysisDao.selectGroupId(heartbeat, gender, age);
		//收縮壓
		Double SysMin = Systolebean.getMinvalue();
		Double SysMax = Systolebean.getMaxvalue();
		String SResult = Systolebean.getResult();
		if (SResult == null || SResult.trim().length() == 0 && cMaxBP < SysMin) {
			SResult = "過低";
			bean.setResult(SResult);
		} else if (SResult == null || SResult.trim().length() == 0 && cMaxBP > SysMax) {
			SResult = "過高";
			bean.setResult(SResult);
		}
		//舒張壓
		Double DiaMin = Diastolebean.getMinvalue();
		Double DiaMax = Diastolebean.getMaxvalue();
		String DResult = Diastolebean.getResult();
		if (DResult == null || DResult.trim().length() == 0 && cMinBP < DiaMin) {
			DResult = "過低";
			bean.setResult(DResult);
		} else if (DResult == null || DResult.trim().length() == 0 && cMinBP > DiaMax) {
			DResult = "過高";
			bean.setResult(DResult);
		}
		//心跳值
		Double HBMin = heartBeatbean.getMinvalue();
		Double HBMax = heartBeatbean.getMaxvalue();
		String hResult = heartBeatbean.getResult();
		if (hResult == null || hResult.trim().length() == 0 && cHb < HBMin) {
			hResult = "過低";
			bean.setResult(hResult);
		} else if (hResult == null || hResult.trim().length() == 0 && cHb > HBMax) {
			hResult = "過高";
			bean.setResult(hResult);
		}		
		bean.getMemberid();
		bean.getMinBloodPressure();
		bean.getMaxBloodPressure();
		bean.getHeartBeat();		
		bean.setCreateTime(new java.util.Date());
		BloodPressureBean result = bloodPressureDao.insert(bean);
		return result;
	}
}
