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
		List<MemberBean> list = getSession().createQuery(hql).setParameter(0, account).getResultList();
		return list;
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
			updateMember.setMemName(bean.getMemName());
			updateMember.setMemHeight(bean.getMemHeight());
			updateMember.setMemWeight(bean.getMemWeight());
			updateMember.setBloodType(bean.getBloodType());
			updateMember.setAddress(bean.getAddress());
			updateMember.setMedicalHistory(bean.getMedicalHistory());
			updateMember.setMedicine(bean.getMedicine());
			updateMember.setCellphone(bean.getCellphone());
			updateMember.setPhone(bean.getPhone());
			if (bean.getFileName() != null) {
				updateMember.setFileName(bean.getFileName());
				updateMember.setPhoto(bean.getPhoto());
			} else {
				updateMember.setFileName(null);
				updateMember.setPhoto(null);
			}
			System.out.println("updateMember" + updateMember);
			updateMember.setModifiyTime(new Timestamp(System.currentTimeMillis()));
			return updateMember;
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

	public boolean UdPwd(String NewPwd, String changeAccount) {
		NativeQuery query = this.getSession().createNativeQuery("update members set pwd=? where account=? ");
		query.setParameter(1, NewPwd);
		query.setParameter(2, changeAccount);
		int result = query.executeUpdate();
		if (result == 1) {
			return true;
		} else {
			return false;
		}
	}

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

	public boolean update(String memName, String phone, String cellphone, java.util.Date birth, double memHeight,
			double memWeight, String bloodType, String address, String pwd, String medicine, Blob photo,
			String fileName, String medicalHistory, String account) {
		MemberBean result = this.getSession().get(MemberBean.class, account);
		if (result != null) {
			result.setMemName(memName);
			result.setPhone(phone);
			result.setCellphone(cellphone);
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
			return true;
		}
		return false;
	}

}
