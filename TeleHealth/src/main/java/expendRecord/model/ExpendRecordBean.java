package expendRecord.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="expendRecords")
public class ExpendRecordBean {
	@Id
	private String memberId;
	private	Integer record;
	private	java.util.Date modifytime;
	private String advisoryMomentId;
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public Integer getRecord() {
		return record;
	}
	public void setRecord(Integer record) {
		this.record = record;
	}
	public java.util.Date getModifytime() {
		return modifytime;
	}
	public void setModifytime(java.util.Date modifytime) {
		this.modifytime = modifytime;
	}
	
	public String getAdvisoryMomentId() {
		return advisoryMomentId;
	}
	public void setAdvisoryMomentId(String advisoryMomentId) {
		this.advisoryMomentId = advisoryMomentId;
	}
	@Override
	public String toString() {
		return "ExpendRecordBean [memberId=" + memberId + ", record=" + record + ", modifytime=" + modifytime
				+ ", advisoryMomentId=" + advisoryMomentId + "]";
	}
	
	
}
