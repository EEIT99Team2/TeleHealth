package healthpassport.model;

import java.util.List;

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
	String minBloodPressure = "BloodPressureDiastole";
	String maxBloodPressure = "BloodPressureSystole";
	String Heartbeat = "Heartbeat";

	public BloodPressureBean insert(BloodPressureBean bean, String gender, Integer age) {
		// client血壓值
		Integer cminBP = bean.getMinBloodPressure();
		Integer cmaxBP = bean.getMaxBloodPressure();
		Integer cIHB = bean.getHeartBeat();
		Integer newHB = new Integer(cIHB);
		Double HB = newHB.doubleValue();
		DataAnalysisBean Diastole = null;
		DataAnalysisBean Systole = null;
		DataAnalysisBean HeartBeat = null;
		String DiastoleResult=null;//舒張壓結果
		String SystoleResult=null;//收縮壓結果
		String HeartBeatResult = null;
		if (age < 15) {
			if(cminBP<30) {
				DiastoleResult="低於正常值";
			}else if(cminBP>59){
				DiastoleResult="高於正常值";
			}else {
				DiastoleResult="正常";
			}
			if(cmaxBP<70) {
				SystoleResult="低於正常值";
			}else if(cmaxBP>100) {
				SystoleResult="高於正常值";
			}else {
				SystoleResult="正常";
			}
			if (HB < 50) {
				HeartBeatResult = "太慢";
			} else if (HB > 110) {
				HeartBeatResult = "超快";
			} else {
				HeartBeatResult ="正常標準值";
			}
		} else if (age >= 15) {
			Diastole = dataAnalysisDao.selectGroupId(minBloodPressure, gender, age);
			Systole = dataAnalysisDao.selectGroupId(maxBloodPressure, gender, age);
			HeartBeat = dataAnalysisDao.Up18HBandBS(Heartbeat, gender, age, HB);
			Double minSystole = Systole.getMinvalue();
			Double maxSystole = Systole.getMaxvalue();
			// 收縮壓
			SystoleResult = Systole.getResult();
			if (cmaxBP < minSystole) {
				SystoleResult = "偏低";
			} else if (cmaxBP > maxSystole) {
				SystoleResult = "偏高";
			}
			// 舒張壓
			Double minDiastole = Diastole.getMinvalue();
			Double maxDiastole = Diastole.getMaxvalue();
			DiastoleResult = Diastole.getResult();
			if (cminBP < minDiastole) {
				DiastoleResult = "偏低";
			} else if (cminBP > maxDiastole) {
				DiastoleResult = "偏高";
			}
			// 心跳值
			if (HB < 50) {
				HeartBeatResult = "太慢";
			} else if (HB > 110) {
				HeartBeatResult = "超快";
			} else {
				HeartBeatResult = HeartBeat.getResult();
			}
		}
		bean.getMinBloodPressure();
		bean.getMaxBloodPressure();
		bean.getHeartBeat();
		bean.setResult("收縮壓:" + SystoleResult + "," + "舒張壓:" + DiastoleResult + "," + "脈搏:" + HeartBeatResult);
		bean.setCreateTime(new java.util.Date());
		BloodPressureBean result = bloodPressureDao.insert(bean);
		return result;
	}

	public List<BloodPressureBean> selectMemberid(String memberid) {
		List<BloodPressureBean> result = bloodPressureDao.selectMemberId(memberid);
		return result;
	}

	public BloodPressureBean newOne(String memberid) {
		BloodPressureBean result = bloodPressureDao.topOneData(memberid);
		return result;
	}

	// 7
	public List<BloodPressureBean> selectMemberidseven(String memberid) {
		List<BloodPressureBean> result = bloodPressureDao.sevenData(memberid);
		return result;
	}

	// 30
	public List<BloodPressureBean> selectMemberidthirty(String memberid) {
		List<BloodPressureBean> result = bloodPressureDao.thirtyData(memberid);
		return result;
	}

	// 180
	public List<BloodPressureBean> selectMemberidthreemon(String memberid) {
		List<BloodPressureBean> result = bloodPressureDao.thrmonthData(memberid);
		return result;
	}

}
