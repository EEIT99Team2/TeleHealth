package register.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import register.model.dao.TestDAO;

@Service
@Transactional
public class TestService {
	@Autowired
	private TestDAO testDao;
	
	public TestBean login(Integer id) {
		TestBean bean = testDao.select(id);
		return bean;
	}
}
