package healthpassport.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="BloodPressureRecords")
public class BloodPressureBean
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String memberid; 
	private Integer minBloodPressure;
	private Integer maxBloodPressure;
	private Integer heartBeat;
	private String result;
	private java.util.Date createTime;
	
	@Override
	public String toString() {
		return "BloodPressureRecordsBean [id=" + id + ", memberid=" + memberid + ", minBloodPressure="
				+ minBloodPressure + ", maxBloodPressure=" + maxBloodPressure + ", heartBeat=" + heartBeat + ", result="
				+ result + ", createTime=" + createTime + "]";
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public Integer getMinBloodPressure() {
		return minBloodPressure;
	}
	public void setMinBloodPressure(Integer minBloodPressure) {
		this.minBloodPressure = minBloodPressure;
	}
	public Integer getMaxBloodPressure() {
		return maxBloodPressure;
	}
	public void setMaxBloodPressure(Integer maxBloodPressure) {
		this.maxBloodPressure = maxBloodPressure;
	}
	public Integer getHeartBeat() {
		return heartBeat;
	}
	public void setHeartBeat(Integer heartBeat) {
		this.heartBeat = heartBeat;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public java.util.Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(java.util.Date createTime) {
		this.createTime = createTime;
	}
	
}
