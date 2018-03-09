package healthpassport.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="BloodSugarRecords")
public class BloodSugarBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String memberId; 
	private Integer bloodSugar;
	private String result;
	private java.util.Date createTime;
	
	@Override
	public String toString() {
		return "BloodSugarBean [id=" + id + ", memberId=" + memberId + ", bloodSugar=" + bloodSugar + ", result="
				+ result + ", createTime=" + createTime + "]";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public Integer getBloodSugar() {
		return bloodSugar;
	}

	public void setBloodSugar(Integer bloodSugar) {
		this.bloodSugar = bloodSugar;
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
