package healthpassport.model;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import healthpassport.model.dao.DataAnalysisDAO;



@Service
@Transactional
public class DataAnalysisService {
	@Autowired
	private DataAnalysisDAO dataanalysisDao;
	
	
//	@Transactional(readOnly=true)
	public List<DataAnalysisBean> selectDataAll() {
		List<DataAnalysisBean> result = dataanalysisDao.selectDataAll();
		return result;
	}
//血壓,舒張壓
	public DataAnalysisBean selectGroupId(String groupid,String gender,Integer age) {
		DataAnalysisBean dataAnalysis = dataanalysisDao.selectGroupId(groupid, gender, age);
		return  dataAnalysis;
	}
	public DataAnalysisBean selectdataBs(String gender) {
		DataAnalysisBean dataanaly = dataanalysisDao.BSdata(gender);
		return dataanaly;
	}
	 
}
