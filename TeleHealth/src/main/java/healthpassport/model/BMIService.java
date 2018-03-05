package healthpassport.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import healthpassport.dao.BMIDAO;

@Service
@Transactional
public class BMIService {
	@Autowired
	private BMIDAO bmiDao ; 
	
	public BMIBean insert(BMIBean bean) {
		bean.setMemberid("B0041CB5-09F1-4E5B-8D57-1F0406019143");
		bean.setResult("正常");
		bean.setCreateTime(new java.util.Date());
		BMIBean result = bmiDao.insert(bean);
		return result;
	}
}
