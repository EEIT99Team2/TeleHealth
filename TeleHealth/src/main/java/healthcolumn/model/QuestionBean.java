package healthcolumn.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="question")
public class QuestionBean {
	@Id
	private int Id;
	private String memberId;
	private String empId;
	private String QAcolumnId;
	private String QAtype; 
	private String advisorycode;
	private String Content;
	private Date createDate;
	private Date modifyTime;	
	@Override
	public String toString() {
		return "QuestionBean [Id=" + Id + ", memberId=" + memberId + ", empId=" + empId + ", QAcolumnId=" + QAcolumnId
				+ ", QAtype=" + QAtype + ", advisorycode=" + advisorycode + ", Content=" + Content + ", createDate="
				+ createDate + ", modifyTime=" + modifyTime + "]";
	}
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
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
	public String getQAcolumnId() {
		return QAcolumnId;
	}
	public void setQAcolumnId(String qAcolumnId) {
		QAcolumnId = qAcolumnId;
	}
	public String getQAtype() {
		return QAtype;
	}
	public void setQAtype(String qAtype) {
		QAtype = qAtype;
	}
	public String getAdvisorycode() {
		return advisorycode;
	}
	public void setAdvisorycode(String advisorycode) {
		this.advisorycode = advisorycode;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getModifyTime() {
		return modifyTime;
	}
	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}
	
}	