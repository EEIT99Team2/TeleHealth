package advisorymoment.model;

import java.util.List;

import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import advisorymoment.dao.AdvisoryMomentDAO;
@Service
@Transactional
public class AdvisoryMomentService {
	@Autowired
	private AdvisoryMomentDAO advisoryDAO;
	
	public AdvisoryMomentBean selectById(String id) {
		AdvisoryMomentBean result = null;
		if(id!=null && id.trim().length()!=0) {
			result = advisoryDAO.selectById(id);
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
	//會員預約時用
	public AdvisoryMomentBean updateByReserve(AdvisoryMomentBean bean) {
		AdvisoryMomentBean result = null;
		if(bean!=null) {
			result = advisoryDAO.updateByReserve(bean.getId(),bean.getReserveStatus(), bean.getVideoCode());
		}		
		return result;
	};
	//修改班表時用
	public AdvisoryMomentBean updateByEdit(AdvisoryMomentBean bean) {
		AdvisoryMomentBean result = null;
		if(bean!=null) {
			result = advisoryDAO.updateByEdit(bean.getId(),bean.getCalendar(),bean.getReserveStatus(), bean.getAdvisoryCode(), bean.getEmpId(), bean.getVideoCode());
		}		
		return result;
	};
	
	public boolean delete(AdvisoryMomentBean bean) {
		boolean result = false;
		if(bean!=null) {
			result = advisoryDAO.delete(bean.getId());
		}
		return result;
	}
}
