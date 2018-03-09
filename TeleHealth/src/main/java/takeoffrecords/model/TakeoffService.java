package takeoffrecords.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import takeoffrecords.model.dao.TakeoffDAO;

@Service
public class TakeoffService {
	
	@Autowired
	private TakeoffDAO takeoffDao;
	
	public boolean takeoffApplication(String MomentId,String EmpId,String TakeoffItem,String TakeoffReason) {
		
		java.util.Date createTime=new Date();
		TakeoffBean tbean = new TakeoffBean();
		tbean.setAdvisoryMomentId(MomentId);
		tbean.setEmpId(EmpId);
		tbean.setApplicationType(TakeoffItem);
		tbean.setApplicationTime(createTime);
		tbean.setApplicationReason(TakeoffReason);
		boolean result=this.insert(tbean);
		return result;
		
	}
	
	//透過班表id搜尋申請假單紀錄
	public TakeoffBean select(String MomentId) {
		TakeoffBean result = null;
		if(MomentId!=null && MomentId.trim().length()!=0) {
			result = takeoffDao.select(MomentId);
		}
		return result;
		}
	
	public List<TakeoffBean> select() {
		return takeoffDao.select();
	}

	public boolean insert(TakeoffBean bean) {
		boolean result = false;
		if(bean!=null) {
				result=takeoffDao.insert(bean);
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
