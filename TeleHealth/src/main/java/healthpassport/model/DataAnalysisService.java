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
}
