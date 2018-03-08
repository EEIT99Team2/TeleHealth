package healthcolumn.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="question")
public class QuestionBean {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int Id;
	private String memberId;
	private String empId;
	private String quetitle;
	private String QAtype; 
	private String advisorycode;
	private String Content;
	private Date createTime;
	private Date modifyTime;
	
	@Override
	public String toString() {
		return "QuestionBean [Id=" + Id + ", memberId=" + memberId + ", empId=" + empId + ", quetitle=" + quetitle
				+ ", QAtype=" + QAtype + ", advisorycode=" + advisorycode + ", Content=" + Content + ", createTime="
				+ createTime + ", modifyTime=" + modifyTime + "]";
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
	public String getQuetitle() {
		return quetitle;
	}
	public void setQuetitle(String quetitle) {
		this.quetitle = quetitle;
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
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getModifyTime() {
		return modifyTime;
	}
	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}
	
}