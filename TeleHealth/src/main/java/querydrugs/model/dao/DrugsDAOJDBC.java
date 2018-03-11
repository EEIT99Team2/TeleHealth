package querydrugs.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import querydrugs.model.DrugBean;

@Repository
public class DrugsDAOJDBC {
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public List<DrugBean> selectAll() {
		return this.getSession().createQuery(
				"from DrugBean", DrugBean.class).list();
	}
	
	public DrugBean selectById(String licenseNum) {
		return this.getSession().get(DrugBean.class, licenseNum);
	}
	
	public List<DrugBean> selectByCondition(String chineseName, String englishName, String manuName, 
			String marks, String color, String shape, String formulation) {
		String sql = "SELECT b.* FROM druglist b "
				+ "WHERE b.chineseName like :chineseName "
				+ "AND b.englishName like :englishName "
				+ "AND b.manuName like :manuName "
				+ "AND b.marks like :marks "
				+ "AND b.color like :color "
				+ "AND b.shape like :shape "
				+ "AND b.formulation like :formulation";
		System.out.println("DAO chineseName= " + chineseName + ",englishName=" +englishName + ",manuName="+manuName+",marks="
		+marks+",color="+color+",shape="+shape+",formulation="+formulation);        
		NativeQuery query = this.getSession().createNativeQuery(sql);
		query.addEntity(DrugBean.class);
		query.setParameter("chineseName", "%" + chineseName + "%" );
		query.setParameter("englishName", "%" + englishName+ "%");
		query.setParameter("manuName", "%" + manuName + "%");
		query.setParameter("marks", "%" + marks + "%");
		query.setParameter("color", "%" + color + "%");
		query.setParameter("shape", "%" + shape + "%");
		query.setParameter("formulation", "%" + formulation + "%");
		List<DrugBean> list = query.list();
		System.out.println("List = " + list);
		return list;
	}
	
	public DrugBean insert(DrugBean bean) {
		if(bean!=null) {
			DrugBean temp =
					this.getSession().get(DrugBean.class, bean.getLicenseNum());
			if(temp==null) {
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	}
	
	public DrugBean update(DrugBean bean) {
		DrugBean result = this.getSession().get(DrugBean.class, bean.getLicenseNum());
		if(result != null) {
			result.setApplicatorName(bean.getApplicatorName());
			result.setCategory(bean.getCategory());
			result.setChineseName(bean.getChineseName());
			result.setClearanceNum(bean.getClearanceNum());
			result.setColor(bean.getColor());
			result.setCountry(bean.getCountry());
			result.setEffectiveDate(bean.getEffectiveDate());
			result.setEnglishName(bean.getEnglishName());
			result.setFormulation(bean.getFormulation());
			result.setIngredients(bean.getIngredients());
			result.setIssueDate(bean.getIssueDate());
			result.setManuName(bean.getManuName());
			result.setMarks(bean.getMarks());
			result.setPacks(bean.getPacks());
			result.setRegulatoryLevel(bean.getRegulatoryLevel());
			result.setPic(bean.getPic());
			result.setShape(bean.getShape());
			result.setSymptom(bean.getSymptom());
			result.setUsage(bean.getUsage());
		}
		return result;
	}
	
	public boolean delete(String licenseNum) {
		DrugBean result = this.getSession().get(DrugBean.class, licenseNum);
		if(result!= null) {
			this.getSession().delete(result);
			return true;
		}
		return false;
	}
	
}
