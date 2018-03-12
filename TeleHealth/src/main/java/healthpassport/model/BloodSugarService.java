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
	
	public BloodSugarBean insert(BloodSugarBean bean,String gender,Integer age) {
		Integer cbSugar = bean.getBloodSugar();
		Double cBSugar =Double.valueOf(cbSugar) ;
		//DB傳值
		DataAnalysisBean bSugarData = dataAnalysisDao.bloodSugarUp18(gender, age, cBSugar);
		Double DataMinBS = bSugarData.getMinvalue();
		Double DataMaxBS = bSugarData.getMaxvalue();
		String DataResult = bSugarData.getResult();
		if(DataResult ==null && cBSugar<DataMinBS) {
			DataResult = "血糖低於正常值";
			bean.setResult(DataResult);
		}else if(DataResult ==null && cBSugar>DataMaxBS){
			DataResult = "血糖已超越";
			bean.setResult(DataResult);
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
