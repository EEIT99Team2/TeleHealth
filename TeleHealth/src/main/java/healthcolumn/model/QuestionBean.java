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
	private String QAtype; 
	private String advisorycode;
	private String Content;
	private Date createDate;
	private int forColumn;
	private int forQuestion;
	@Override
	public String toString() {
		return "QuestionBean [Id=" + Id + ", memberId=" + memberId + ", empId=" + empId + ", QAtype=" + QAtype
				+ ", advisorycode=" + advisorycode + ", Content=" + Content + ", createDate=" + createDate
				+ ", forColumn=" + forColumn + ", forQuestion=" + forQuestion + "]";
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
	public int getForColumn() {
		return forColumn;
	}
	public void setForColumn(int forColumn) {
		this.forColumn = forColumn;
	}
	public int getForQuestion() {
		return forQuestion;
	}
	public void setForQuestion(int forQuestion) {
		this.forQuestion = forQuestion;
	}
	
	

	
	
	
	
}
