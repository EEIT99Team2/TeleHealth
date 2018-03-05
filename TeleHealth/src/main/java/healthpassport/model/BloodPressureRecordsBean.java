package healthpassport.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="analysisRecords")
public class BloodPressureRecordsBean
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String memberid; 
	private Integer minBloodPressure;
	private Integer maxBloodPressure;
	private Integer heartBeat;
	private String result;
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
	
}
