package advisoryMoment.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="advisoryType")
public class AdvisoryTypeBean {
	@Id
	private String advisoryCode;
	private String advisoryName;
	private String codeType;
	@Override
	public String toString() {
		return "AdvisoryTypeBean [advisoryCode=" + advisoryCode + ", advisoryName=" + advisoryName + ", codeType="
				+ codeType + "]";
	}
	public String getAdvisoryCode() {
		return advisoryCode;
	}
	public void setAdvisoryCode(String advisoryCode) {
		this.advisoryCode = advisoryCode;
	}
	public String getAdvisoryName() {
		return advisoryName;
	}
	public void setAdvisoryName(String advisoryName) {
		this.advisoryName = advisoryName;
	}
	public String getCodeType() {
		return codeType;
	}
	public void setCodeType(String codeType) {
		this.codeType = codeType;
	}
	
}
