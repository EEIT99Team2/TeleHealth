package takeoffrecords.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import takeoffrecords.model.dao.TakeoffDAO;

@Service
public class TakeoffService {
	
	@Autowired
	private TakeoffDAO takeoffDao;
	
	public TakeoffBean select(int id) {
		TakeoffBean result = null;
		if(id!=0) {
			result = takeoffDao.select(id);
		}
		return result;
		}
	
	public List<TakeoffBean> select() {
		return takeoffDao.select();
	}

	public TakeoffBean insert(TakeoffBean bean) {
		TakeoffBean result = null;
		int id =1;
		if(bean!=null) {
			TakeoffBean temp =
					takeoffDao.select(id);
			if(temp==null) {
				result=takeoffDao.insert(bean);
				return result;
			}
		}
		return result;
	}

	public TakeoffBean update(String id) {
		TakeoffBean result = null;
		
		return result;
	}

	public boolean delete(int id) {
		boolean result = false;

		return result;
	}
}
