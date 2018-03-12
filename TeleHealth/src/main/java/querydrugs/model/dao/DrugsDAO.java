package querydrugs.model.dao;

import java.util.List;

import querydrugs.model.DrugBean;

public interface DrugsDAO {

	List<DrugBean> selectAll();

	DrugBean selectById(String licenseNum);

	List<DrugBean> selectByCondition(String licenseNum, String chineseName, String englishName, String manuName, String symptom, String marks,
			String color, String shape, String formulation);

	DrugBean insert(DrugBean bean);

	DrugBean update(DrugBean bean);

	boolean delete(String licenseNum);

}