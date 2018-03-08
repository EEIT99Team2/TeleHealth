package takeoffrecords.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="takeoffRecords")
public class TakeoffBean {
	@Id
	@GenericGenerator(name="generator",strategy="guid")
	@GeneratedValue(generator="generator")
	private String id;
	private String advisoryMomentId;
	private String empId;
	private java.util.Date applicationTime;
	private String applicationReason;
	private String rejectReason;
	private String approvedResult;
	private java.util.Date approvedTime;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAdvisoryMomentId() {
		return advisoryMomentId;
	}
	public void setAdvisoryMomentId(String advisoryMomentId) {
		this.advisoryMomentId = advisoryMomentId;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public java.util.Date getApplicationTime() {
		return applicationTime;
	}
	public void setApplicationTime(java.util.Date applicationTime) {
		this.applicationTime = applicationTime;
	}
	public String getApplicationReason() {
		return applicationReason;
	}
	public void setApplicationReason(String applicationReason) {
		this.applicationReason = applicationReason;
	}
	public String getRejectReason() {
		return rejectReason;
	}
	public void setRejectReason(String rejectReason) {
		this.rejectReason = rejectReason;
	}
	public String getApprovedResult() {
		return approvedResult;
	}
	public void setApprovedResult(String approvedResult) {
		this.approvedResult = approvedResult;
	}
	public java.util.Date getApprovedTime() {
		return approvedTime;
	}
	public void setApprovedTime(java.util.Date approvedTime) {
		this.approvedTime = approvedTime;
	}
	@Override
	public String toString() {
		return "TakeoffBean [id=" + id + ", advisoryMomentId=" + advisoryMomentId + ", empId=" + empId
				+ ", applicationTime=" + applicationTime + ", applicationReason=" + applicationReason
				+ ", rejectReason=" + rejectReason + ", approvedResult=" + approvedResult + ", approvedTime="
				+ approvedTime + "]";
	}

}
