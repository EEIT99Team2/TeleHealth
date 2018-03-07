package healthpassport.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="dataanalysis")
public class DataAnalysisBean {
	@Id
	private String groupId;
	private String gender;
	private Integer minAge;
	private Integer maxAge;
	private Double minvalue;
	private Double maxvalue;
	private String result;	
	
	@Override
	public String toString() {
		return "DataAnalysisBean [groupId=" + groupId + ", gender=" + gender + ", minAge=" + minAge + ", maxAge="
				+ maxAge + ", minvalue=" + minvalue + ", maxvalue=" + maxvalue + ", result=" + result + "]";
	}
	public String getGroupId() {
		return groupId;
	}
	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getMinAge() {
		return minAge;
	}
	public void setMinAge(int minAge) {
		this.minAge = minAge;
	}
	public int getMaxAge() {
		return maxAge;
	}
	public void setMaxAge(int maxAge) {
		this.maxAge = maxAge;
	}
	public double getMinvalue() {
		return minvalue;
	}
	public void setMinvalue(double minvalue) {
		this.minvalue = minvalue;
	}
	public double getMaxvalue() {
		return maxvalue;
	}
	public void setMaxvalue(double maxvalue) {
		this.maxvalue = maxvalue;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	
		
}
