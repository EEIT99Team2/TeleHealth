package advisoryMoment.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="employees")
public class EmployeesBean {
	@Id
	@GenericGenerator(name="generator",strategy="guid")
	@GeneratedValue(generator="generator")
	private String   empId;
	private String	 account;
	private String	 pwd;
	private String	 empName;
	private String	 advisoryCode;
	private String	 email;
	private String	 empStatus;
	private String   takeOff;
	private	Integer	 reserveCount;
	private java.util.Date	 createTime;
	private java.util.Date	 modifiyTime;
	@Override
	public String toString() {
		return "EmployeesBean [empId=" + empId + ", account=" + account + ", pwd=" + pwd + ", empName=" + empName
				+ ", advisoryCode=" + advisoryCode + ", email=" + email + ", empStatus=" + empStatus + ", takeOff="
				+ takeOff + ", reserveCount=" + reserveCount + ", createTime=" + createTime + ", modifiyTime="
				+ modifiyTime + "]";
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getAdvisoryCode() {
		return advisoryCode;
	}
	public void setAdvisoryCode(String advisoryCode) {
		this.advisoryCode = advisoryCode;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmpStatus() {
		return empStatus;
	}
	public void setEmpStatus(String empStatus) {
		this.empStatus = empStatus;
	}
	public String getTakeOff() {
		return takeOff;
	}
	public void setTakeOff(String takeOff) {
		this.takeOff = takeOff;
	}
	public Integer getReserveCount() {
		return reserveCount;
	}
	public void setReserveCount(Integer reserveCount) {
		this.reserveCount = reserveCount;
	}
	public java.util.Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(java.util.Date createTime) {
		this.createTime = createTime;
	}
	public java.util.Date getModifiyTime() {
		return modifiyTime;
	}
	public void setModifiyTime(java.util.Date modifiyTime) {
		this.modifiyTime = modifiyTime;
	}
	
	
}
