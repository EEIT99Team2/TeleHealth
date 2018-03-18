package healthpassport.model;

import java.util.List;

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
	String groupid ="BloodSugar";
	public BloodSugarBean insert(BloodSugarBean bean ,String gender,Integer age) {
		Integer cbSugar = bean.getBloodSugar();
		Double cbSugarDouble = Double.valueOf(cbSugar.toString());
		String bsresult;
		if(cbSugarDouble<70) {
			bsresult = "血糖低於正常值";
		}else if(cbSugarDouble>200) {
			bsresult ="血糖太高請盡快就醫";
		}else {
			DataAnalysisBean bSugarData = dataAnalysisDao.Up18HBandBS(groupid ,gender, age, cbSugarDouble);		
			bsresult= bSugarData.getResult();
		}
		bean.getMemberId();
		bean.getBloodSugar();
		bean.setResult(bsresult);
		bean.setCreateTime(new java.util.Date());
		BloodSugarBean result= bloodSugarDao.insert(bean);
		return result;
	}
	
	public List<BloodSugarBean> selectMemberid(String memberid) {
		List<BloodSugarBean> result = bloodSugarDao.selectMemberId(memberid);
		return result;
	}
	
	public BloodSugarBean newOne(String memberid) {
		BloodSugarBean result = bloodSugarDao.topOneData(memberid);
		return result;
	}
	//7
		public List<BloodSugarBean> selectMemberidseven(String memberid) {
			List<BloodSugarBean> result = bloodSugarDao.sevenData(memberid);
			return result;
		}
		//30
		public List<BloodSugarBean> selectMemberidthirty(String memberid) {
			List<BloodSugarBean> result = bloodSugarDao.thirtyData(memberid);
			return result;
		}
		//180
		public List<BloodSugarBean> selectMemberidthreemon(String memberid) {
			List<BloodSugarBean> result = bloodSugarDao.thrmonthData(memberid);
			return result;
		}
}
