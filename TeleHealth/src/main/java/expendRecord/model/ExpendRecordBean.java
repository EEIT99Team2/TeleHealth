package expendRecord.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="expendRecords")
public class ExpendRecordBean {
	private String memberId;
	private	Integer record;
	private	java.util.Date modifytime;
	private String advisoryMomentId;
	@Id
	@GenericGenerator(name="generator",strategy="guid")
	@GeneratedValue(generator="generator")
	private String id;
		
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
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

}
