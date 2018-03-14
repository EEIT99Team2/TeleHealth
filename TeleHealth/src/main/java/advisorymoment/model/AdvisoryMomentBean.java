package advisorymoment.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="advisoryMoment")
public class AdvisoryMomentBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GenericGenerator(name="generator",strategy="guid")
	@GeneratedValue(generator="generator")
	private String id;
	private java.util.Date calendar;
	private	String reserveStatus;
	private	String advisoryCode;
	private	String empId;
	private	String videoCode;
	private String status;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public java.util.Date getCalendar() {
		return calendar;
	}
	public void setCalendar(java.util.Date calendar) {
		this.calendar = calendar;
	}
	public String getReserveStatus() {
		return reserveStatus;
	}
	public void setReserveStatus(String reserveStatus) {
		this.reserveStatus = reserveStatus;
	}
	public String getAdvisoryCode() {
		return advisoryCode;
	}
	public void setAdvisoryCode(String advisoryCode) {
		this.advisoryCode = advisoryCode;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getVideoCode() {
		return videoCode;
	}
	public void setVideoCode(String videoCode) {
		this.videoCode = videoCode;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "AdvisoryMomentBean [id=" + id + ", calendar=" + calendar + ", reserveStatus=" + reserveStatus
				+ ", advisoryCode=" + advisoryCode + ", empId=" + empId + ", videoCode=" + videoCode + ", status="
				+ status + "]";
	}
	
		
}
