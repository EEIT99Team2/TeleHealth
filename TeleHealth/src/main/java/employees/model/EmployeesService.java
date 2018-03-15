package employees.model;

import java.util.List;

import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import employees.model.dao.EmployeesDAO;
import register.model.MemberBean;

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
	
	//增加員工請假次數
	public int addTakeoffCount(String empId){
		int result = 0;
		if(empId!=null && empId.trim().length()!=0){
			result=employeesDAO.addTakeoffCount(empId);
		}
		return result;
	}
	//驗證員工
	public EmployeesBean checkAccountEmp(String account,String MD5pwd) {
		EmployeesBean result = employeesDAO.selectByAccount(account);
		System.out.println(account+" " +MD5pwd);
		if (result.getAccount()!=null) {			
			if(MD5pwd!=null && MD5pwd.length()!=0) {			
				String temp = MD5pwd; //使用者輸入
				EmployeesBean Emp = result;
				String password = Emp.getPwd();				
				if(temp.equals(password)) {
					System.out.println(result);
					return Emp;
				}else {					
					return null;
				}
			}
		}
		return null;		
	}
	
	public EmployeesBean selectById(String empId) {
		if(empId != null && empId.trim().length() > 0) {
			return employeesDAO.selectById(empId);
		}
		return null;
	}
	
}
