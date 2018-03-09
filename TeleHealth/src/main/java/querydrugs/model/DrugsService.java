package querydrugs.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import querydrugs.model.dao.DrugsDAOHibernate;

@Service
public class DrugsService {
	@Autowired
	private DrugsDAOHibernate drugsDAO;
	
	public List<DrugBean> queryDrugs(String chineseName, String englishName, String manu, 
				String marks, String color, String shape, String formulation) {
		return drugsDAO.selectByCondition(chineseName, englishName, manu, marks, color, shape, formulation);
	}
}
