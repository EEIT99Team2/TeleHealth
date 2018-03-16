package register.model.dao;

import java.sql.Blob;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import register.model.MemberBean;

@Repository
public class MemberDAOHibernate {
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public List<MemberBean> selectByAccount(String account) {
		String hql = "from MemberBean m WHERE m.account = ?";
		List<MemberBean> list = getSession().createQuery(hql).setParameter(0, account).getResultList();
		return list;
	}
	
	public List<MemberBean> selectAll() {
		return this.getSession().createQuery(
				"from MemberBean", MemberBean.class).list();
	}
	
	public MemberBean insert(MemberBean bean) {

			if(bean!=null) {
				this.getSession().save(bean);
				return bean;
			}
		
		return null;
	}
	
	public boolean delete(String account) {
		MemberBean result = this.getSession().get(MemberBean.class, account);
		if(result!=null) {
			this.getSession().delete(result);
			return true;
		}
		return false;
	}
			
	public boolean update(String memName,String phone,
            String cellphone,String gender,java.util.Date birth,
            double memHeight, double memWeight, String bloodType,
            String address,String pwd,String medicine,Blob photo,String fileName,String medicalHistory,int cancelCount,int point,int expendRecord,String account) {
		MemberBean result = this.getSession().get(MemberBean.class, account);
		if(result!=null) {
			result.setMemName(memName);
			result.setPhone(phone);
			result.setCellphone(cellphone);
			result.setGender(gender);
			result.setBirth(birth);
			result.setMemHeight(memHeight);
			result.setMemWeight(memWeight);
			result.setBloodType(bloodType);
			result.setAddress(address);
			result.setPwd(pwd);
			result.setMedicine(medicine);
			result.setPhoto(photo);
			result.setFileName(fileName);
			result.setMedicalHistory(medicalHistory);	
			result.setCancelCount(cancelCount);
			result.setPoint(point);
			result.setExpendRecord(expendRecord);
			return true;
		}
		return false;
	}
	
	
}
