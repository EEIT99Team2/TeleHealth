package register.model.dao;

import java.sql.Blob;
import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
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
		List<MemberBean> list = this.getSession().createQuery(hql).setParameter(0, account).getResultList();
		return list;
	}
	
	public MemberBean selectById(String memberId) {
		MemberBean member = getSession().get(MemberBean.class, memberId);
		return member;
	}
	
	public List<MemberBean> selectAll() {
		return this.getSession().createQuery("from MemberBean", MemberBean.class).list();
	}

	public MemberBean insert(MemberBean bean) {

		if (bean != null) {
			this.getSession().save(bean);
			return bean;
		}
		return null;
	}

	public MemberBean update(MemberBean bean) {
		if (bean != null) {
			MemberBean updateMember = this.getSession().get(MemberBean.class, bean.getMemberId());
			System.out.println("DAO取出的資料庫會員舊密碼=" + updateMember.getPwd());
			if(updateMember != null) { 
				if(bean.getMemName() != null && bean.getMemName().trim().length() > 0) {
					updateMember.setMemName(bean.getMemName());
				}
				if(bean.getPwd() != null && bean.getPwd().trim().length() > 0) {
					System.out.println("Update Password="+bean.getPwd().toString());
					System.out.println("OLD Password="+ updateMember.getPwd());
					updateMember.setPwd(bean.getPwd());
					System.out.println("NEW Password="+ updateMember.getPwd());
				}
				if(bean.getMemHeight() != null && bean.getMemHeight()>0) {
					updateMember.setMemHeight(bean.getMemHeight());			
				}
				if(bean.getMemWeight() !=null && bean.getMemWeight()>0) {
					updateMember.setMemWeight(bean.getMemWeight());					
				}
				if(bean.getBloodType() !=null && bean.getBloodType().trim().length()>0) {
					updateMember.setBloodType(bean.getBloodType());					
				}
				if(bean.getAddress()!=null && bean.getAddress().trim().length()>0) {
					updateMember.setAddress(bean.getAddress());					
				}
				if(bean.getMedicalHistory()!=null && bean.getMedicalHistory().trim().length()>0) {
					updateMember.setMedicalHistory(bean.getMedicalHistory());					
				}
				if(bean.getMedicine()!=null && bean.getMedicine().trim().length()>0) {
					updateMember.setMedicine(bean.getMedicine());					
				}
				if(bean.getCellphone()!=null && bean.getCellphone().trim().length()>0) {
					updateMember.setCellphone(bean.getCellphone());					
				}
				if(bean.getPhone()!=null && bean.getPhone().trim().length()>0) {
					updateMember.setPhone(bean.getPhone());					
				}
				if(bean.getStatus() != null && bean.getStatus().trim().length() > 0) {
					updateMember.setStatus(bean.getStatus());
				}
				if (bean.getPhoto() != null && bean.getFileName() != null) {
					updateMember.setFileName(bean.getFileName());
					updateMember.setPhoto(bean.getPhoto());
				}
				updateMember.setModifiyTime(new Timestamp(System.currentTimeMillis()));
				
				return updateMember;
			}
		}
		return null;
	}

	public boolean delete(String account) {
		MemberBean result = this.getSession().get(MemberBean.class, account);
		if (result != null) {
			this.getSession().delete(result);
			return true;
		}
		return false;
	}

//	public boolean UdPwd(String NewPwd, String changeAccount) {
//		NativeQuery query = this.getSession().createNativeQuery("update members set pwd=? where account=? ");
//		query.setParameter(1, NewPwd);
//		query.setParameter(2, changeAccount);
//		int result = query.executeUpdate();
//		if (result == 1) {
//			return true;
//		} else {
//			return false;
//		}
//	}

	public boolean UpdateMemberData(String memName, String memHeight, String memWeight, String bloodType,
			String medicine, String medicalHistory, String phone, String cellphone, String address,
			String changeAccount) {
		NativeQuery query = this.getSession().createNativeQuery(
				"update members set memName=? phone=? cellphone=? birth=? memHeight=? memWeight=?\r\n"
						+ "bloodType=? medicine=? medicalHistory=? where account=? ");
		query.setParameter(1, memName);
		query.setParameter(2, changeAccount);
		int result = query.executeUpdate();
		if (result == 1) {
			return true;
		} else {
			return false;
		}
	}

//	public boolean update(String smemName, String phone, String cellphone, java.util.Date birth, double memHeight,
//			double memWeight, String bloodType, String address, String pwd, String medicine, Blob photo,
//			String fileName, String medicalHistory, String account) {
//		MemberBean result = this.getSession().get(MemberBean.class, account);
//		if (result != null) {
//			result.setMemName(memName);
//			result.setPhone(phone);
//			result.setCellphone(cellphone);
//			result.setBirth(birth);
//			result.setMemHeight(memHeight);
//			result.setMemWeight(memWeight);
//			result.setBloodType(bloodType);
//			result.setAddress(address);
//			result.setPwd(pwd);
//			result.setMedicine(medicine);
//			result.setPhoto(photo);
//			result.setFileName(fileName);
//			result.setMedicalHistory(medicalHistory);
//			return true;
//		}
//		return false;
//	}

}
