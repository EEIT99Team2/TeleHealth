package healthpassport.model;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import healthpassport.model.dao.BloodSugarDAO;
import healthpassport.model.dao.DataAnalysisDAO;

@Service
@Transactional
public class BloodSugarService {
	@Autowired
	private BloodSugarDAO bloodSugarDao;
	@Autowired
	private DataAnalysisDAO dataAnalysisDao;
	
	public BloodSugarBean insert(BloodSugarBean bean ,String gender,Integer age) {
		Integer cbSugar = bean.getBloodSugar();
		Double cbSugarDouble = Double.valueOf(cbSugar.toString());
		//DB傳值
		DataAnalysisBean bSugarData = dataAnalysisDao.bloodSugarUp18(gender, age, cbSugarDouble);
		Double DataMinBS = bSugarData.getMinvalue();
		
		Double DataMaxBS = bSugarData.getMaxvalue();
		
		String DataResult = bSugarData.getResult();
		if(DataResult ==null && cbSugarDouble<DataMinBS) {
			DataResult = "血糖低於正常值";
		}else if(DataResult ==null && cbSugarDouble>DataMaxBS){
			DataResult = "血糖已超越";
		}else {
			bean.setResult(DataResult);
		}
		bean.getMemberId();
		bean.getBloodSugar();
		bean.setCreateTime(new java.util.Date());
		BloodSugarBean result= bloodSugarDao.insert(bean);
		return result;
	}
	
}
