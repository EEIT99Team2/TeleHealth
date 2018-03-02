package advisoryMoment.model;

import java.util.List;

import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import advisoryMoment.dao.AdvisoryDAO;
@Service
@Transactional
public class AdvisoryService {
	@Autowired
	private AdvisoryDAO advisoryDAO;
	
	public AdvisoryMomentBean select(java.util.Date calendar, int timeInterval, String advisoryCode) {
		AdvisoryMomentBean result = null;
		if(calendar!=null && timeInterval!=0 && advisoryCode!=null) {
			result = advisoryDAO.select(calendar, timeInterval, advisoryCode);
		}		
		return result;
	};
	
	public List<Object[]> select(String advisoryCode) {
		List<Object[]> result = null;
		if(advisoryCode!=null) {
			result = advisoryDAO.select(advisoryCode);
			System.out.println("Service="+result);
		}		
		return result;
	};
	
	public List<Object[]> selectAll(){
		List<Object[]> result = advisoryDAO.selectAll();		
		return result;
	};

	public AdvisoryMomentBean insert(AdvisoryMomentBean bean) {
		AdvisoryMomentBean result = null;
		if(bean!=null) {
			result = advisoryDAO.insert(bean);			
		}
		return result;
	};

	public AdvisoryMomentBean update(AdvisoryMomentBean bean) {
		AdvisoryMomentBean result = null;
		if(bean!=null) {
			result = advisoryDAO.update(bean.getCalendar(), bean.getTimeInterval(), bean.getReserveStatus(), bean.getAdvisoryCode(), bean.getEmpId(), bean.getVideoCode());
		}		
		return result;
	};
	
	public boolean delete(AdvisoryMomentBean bean) {
		boolean result = false;
		if(bean!=null) {
			result = advisoryDAO.delete(bean.getCalendar(), bean.getTimeInterval(), bean.getAdvisoryCode());
		}
		return result;
	}
}
