package model;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.dao.dataanalysisDAO;

@Service
@Transactional
public class dataanalysisService {
	@Autowired
	private dataanalysisDAO dataanalysisDao;
	
	
//	@Transactional(readOnly=true)
	public List<dataanalysisBean> selectDataAll() {
		List<dataanalysisBean> result = dataanalysisDao.selectDataAll();
		return result;
	}
}
