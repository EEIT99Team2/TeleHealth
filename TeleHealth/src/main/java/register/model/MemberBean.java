package register.model;

import java.sql.Blob;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
@Entity
@Table(name="members")
public class MemberBean {
	@Id
	@GenericGenerator(name = "generator", strategy = "guid")
	@GeneratedValue(generator = "generator")
	private String memberId;
	private String account;
	private String memName;
	private String phone;
	private String cellphone;
	private String gender;
	private java.util.Date birth;
	private Double memHeight;
	private Double memWeight;
	private String bloodType;
	private String address;
	private String pwd;
	private String medicine;
	private Integer cancelCount;
	private Blob photo;
	private Integer point;
	private Integer expendRecord; 
	private String medicalHistory;
	private String fileName;
	private Timestamp registerTime;
	private Timestamp modifiyTime;
	private String status;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Timestamp getModifiyTime() {
		return modifiyTime;
	}

	public void setModifiyTime(Timestamp modifiyTime) {
		this.modifiyTime = modifiyTime;
	}

	@Override
	public String toString() {
		return "MemberBean [memberId=" + memberId + ", account=" + account + ", memName=" + memName + ", phone=" + phone
				+ ", cellphone=" + cellphone + ", gender=" + gender + ", birth=" + birth + ", memHeight=" + memHeight
				+ ", memWeight=" + memWeight + ", bloodType=" + bloodType + ", address=" + address + ", pwd=" + pwd
				+ ", medicine=" + medicine + ", cancelCount=" + cancelCount + ", photo=" + photo + ", point=" + point
				+ ", expendRecord=" + expendRecord + ", medicalHistory=" + medicalHistory + ", fileName=" + fileName
				+ ", registerTime=" + registerTime + ", modifiyTime=" + modifiyTime + "]";
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCellphone() {
		return cellphone;
	}

	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public java.util.Date getBirth() {
		return birth;
	}

	public void setBirth(java.util.Date birth) {
		this.birth = birth;
	}

	public Double getMemHeight() {
		return memHeight;
	}

	public void setMemHeight(Double memHeight) {
		this.memHeight = memHeight;
	}

	public Double getMemWeight() {
		return memWeight;
	}

	public void setMemWeight(Double memWeight) {
		this.memWeight = memWeight;
	}

	public String getBloodType() {
		return bloodType;
	}

	public void setBloodType(String bloodType) {
		this.bloodType = bloodType;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getMedicine() {
		return medicine;
	}

	public void setMedicine(String medicine) {
		this.medicine = medicine;
	}

	public Integer getCancelCount() {
		return cancelCount;
	}

	public void setCancelCount(Integer cancelCount) {
		this.cancelCount = cancelCount;
	}

	public Blob getPhoto() {
		return photo;
	}

	public void setPhoto(Blob photo) {
		this.photo = photo;
	}

	public Integer getPoint() {
		return point;
	}

	public void setPoint(Integer point) {
		this.point = point;
	}

	public Integer getExpendRecord() {
		return expendRecord;
	}

	public void setExpendRecord(Integer expendRecord) {
		this.expendRecord = expendRecord;
	}

	public String getMedicalHistory() {
		return medicalHistory;
	}

	public void setMedicalHistory(String medicalHistory) {
		this.medicalHistory = medicalHistory;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public Timestamp getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(Timestamp registerTime) {
		this.registerTime = registerTime;
	}

}
	
