package advisorymoment.model;

import java.util.List;

import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import advisorymoment.dao.AdvisoryMomentDAO;
@Service
@Transactional
public class AdvisoryMomentService {
	@Autowired
	private AdvisoryMomentDAO advisoryMomentDAO;
	
	public AdvisoryMomentBean selectById(String id) {
		AdvisoryMomentBean result = null;
		if(id!=null && id.trim().length()!=0) {
			result = advisoryMomentDAO.selectById(id);
		}		
		return result;
	};
	
	public List<Object[]> select(String advisoryCode) {
		List<Object[]> result = null;
		if(advisoryCode!=null) {
			result = advisoryMomentDAO.select(advisoryCode);
			System.out.println("Service="+result);
		}		
		return result;
	};
	
	public List<Object[]> selectAll(){
		List<Object[]> result = advisoryMomentDAO.selectAll();
		return result;
	};
	
	//會員自己已預約的時段
	public List<Object[]> selectByMemSelf(String UserId) {			
			List<Object[]> data = null;
			if(UserId!=null&&UserId.trim().length()!=0) {
				data = advisoryMomentDAO.selectByMemSelf(UserId);
			}
			return data;
	};
	
	//諮詢人員自己負責的時段
		public List<Object[]> selectByEmpSelf(String EmpId) {			
				List<Object[]> data = null;
				if(EmpId!=null&&EmpId.trim().length()!=0) {
					data = advisoryMomentDAO.selectByEmpSelf(EmpId);
				}
				return data;
		};
	public AdvisoryMomentBean insert(AdvisoryMomentBean bean) {
		AdvisoryMomentBean result = null;
		if(bean!=null) {
			result = advisoryMomentDAO.insert(bean);			
		}
		return result;
	};
	//會員預約時用
	public AdvisoryMomentBean updateByReserve(AdvisoryMomentBean bean) {
		AdvisoryMomentBean result = null;
		if(bean!=null) {
			result = advisoryMomentDAO.updateByReserve(bean.getId(),bean.getReserveStatus(), bean.getVideoCode());
		}		
		return result;
	};
	//修改班表時用
	public AdvisoryMomentBean updateByEdit(AdvisoryMomentBean bean) {
		AdvisoryMomentBean result = null;
		if(bean!=null) {
			result = advisoryMomentDAO.updateByEdit(bean.getId(),bean.getCalendar(),bean.getReserveStatus(), bean.getAdvisoryCode(), bean.getEmpId(), bean.getVideoCode());
		}		
		return result;
	};
	
	public boolean delete(AdvisoryMomentBean bean) {
		boolean result = false;
		if(bean!=null) {
			result = advisoryMomentDAO.delete(bean.getId());
		}
		return result;
	}
}
