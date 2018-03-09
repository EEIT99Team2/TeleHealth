package employees.model;

import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import employees.model.dao.EmployeesDAO;

@Service
public class EmployeesService {
	@Autowired
	private EmployeesDAO employeesDAO;
	
	//增加員工預約次數
	public int addResCount(String empId){
		int result = 0;
		if(empId!=null && empId.trim().length()!=0){
			result=employeesDAO.addResCount(empId);
		}
		return result;
	}
}
