package advisory.model;

import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import advisory.model.dao.AdvisoryDAO;

@Service
@Transactional
public class AdvisoryService {
	@Autowired
	private AdvisoryDAO advisoryDao;
	
	public AdvisoryBean select(String videoCode) {
		AdvisoryBean result=null;
		if(videoCode!=null&&videoCode.trim().length()!=0) {
			result = advisoryDao.select(videoCode);
		}
		return result;
	};
	

	public AdvisoryBean insert(AdvisoryBean bean) {
		AdvisoryBean result =null;
		if (bean != null) {
			result = advisoryDao.insert(bean);			
		}
		return result;
	};
}
