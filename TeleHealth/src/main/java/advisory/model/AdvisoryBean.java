package advisory.model;

import java.util.Arrays;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="Advisory")
public class AdvisoryBean {
	@Id
	private String videoCode;
	private String memberId;
	private String empId;
	private String descrip;
	private java.util.Date advisoryTime;
	private byte[] viedoRecord;
	private Integer satisfy;
	private java.util.Date createTime;
	private java.util.Date modifyTime;
	
	public String getVideoCode() {
		return videoCode;
	}
	public void setVideoCode(String videoCode) {
		this.videoCode = videoCode;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getDescrip() {
		return descrip;
	}
	public void setDescrip(String descrip) {
		this.descrip = descrip;
	}
	public java.util.Date getAdvisoryTime() {
		return advisoryTime;
	}
	public void setAdvisoryTime(java.util.Date advisoryTime) {
		this.advisoryTime = advisoryTime;
	}
	public byte[] getViedoRecord() {
		return viedoRecord;
	}
	public void setViedoRecord(byte[] viedoRecord) {
		this.viedoRecord = viedoRecord;
	}
	public Integer getSatisfy() {
		return satisfy;
	}
	public void setSatisfy(Integer satisfy) {
		this.satisfy = satisfy;
	}
	public java.util.Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(java.util.Date createTime) {
		this.createTime = createTime;
	}
	public java.util.Date getModifyTime() {
		return modifyTime;
	}
	public void setModifyTime(java.util.Date modifyTime) {
		this.modifyTime = modifyTime;
	}
	@Override
	public String toString() {
		return "AdvisoryBean [videoCode=" + videoCode + ", memberId=" + memberId + ", empId=" + empId + ", descrip="
				+ descrip + ", advisoryTime=" + advisoryTime + ", viedoRecord=" + Arrays.toString(viedoRecord)
				+ ", satisfy=" + satisfy + ", createTime=" + createTime + ", modifyTime=" + modifyTime + "]";
	}
}
