package healthcolumn.model;

import java.util.*;

import javax.persistence.*;

import org.hibernate.annotations.GenericGenerator;



@Entity
@Table(name="healthColumn")
public class HealthColumnBean {
	@Id
	@GenericGenerator(name="generator",strategy="guid")
	@GeneratedValue(generator="generator")
	private String columnId;
	private String title;
	private String content;
	private java.util.Date createDate;
	private String  advisoryCode;
	@Transient
	private byte[] videoContent;
	private Integer clickCount;
	private String  empId;
	private String  fileName;
	
	@Override
	public String toString() {
		return "HealthColumnBean [columnId=" + columnId + ", title=" + title + ", content=" + content + ", createDate="
				+ createDate + ", advisoryCode=" + advisoryCode + ", videoContent=" + Arrays.toString(videoContent)
				+ ", clickCount=" + clickCount + ", empId=" + empId + ", fileName=" + fileName + "]";
	}
	public String getColumnId() {
		return columnId;
	}
	public void setColumnId(String columnId) {
		this.columnId = columnId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public java.util.Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(java.util.Date createDate) {
		this.createDate = createDate;
	}
	public String getAdvisoryCode() {
		return advisoryCode;
	}
	public void setAdvisoryCode(String advisoryCode) {
		this.advisoryCode = advisoryCode;
	}
	public byte[] getVideoContent() {
		return videoContent;
	}
	public void setVideoContent(byte[] videoContent) {
		this.videoContent = videoContent;
	}
	public Integer getClickCount() {
		return clickCount;
	}
	public void setClickCount(Integer clickCount) {
		this.clickCount = clickCount;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
}	
	
	
