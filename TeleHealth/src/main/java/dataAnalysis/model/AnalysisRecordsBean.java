package dataAnalysis.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="analysisRecords")
public class AnalysisRecordsBean {
	@Id
	@GenericGenerator(name="generator",strategy="guid")
	@GeneratedValue(generator="generator")
	private String id;
	private String memberid;
	private String gender;
	private int age;
	private int minBloodPressure;
	private int maxBloodPressure;
	private int minBloodSugar;
	private int maxBloodSugar;
	private double height;
	private double weight;
	private int heartBeat;
	private String createTime;
	@Override
	public String toString() {
		return "AnalysisRecordsBean [id=" + id + ", memberid=" + memberid + ", gender=" + gender + ", age=" + age
				+ ", minBloodPressure=" + minBloodPressure + ", maxBloodPressure=" + maxBloodPressure
				+ ", minBloodSugar=" + minBloodSugar + ", maxBloodSugar=" + maxBloodSugar + ", height=" + height
				+ ", weight=" + weight + ", heartBeat=" + heartBeat + ", createTime=" + createTime + "]";
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getMinBloodPressure() {
		return minBloodPressure;
	}
	public void setMinBloodPressure(int minBloodPressure) {
		this.minBloodPressure = minBloodPressure;
	}
	public int getMaxBloodPressure() {
		return maxBloodPressure;
	}
	public void setMaxBloodPressure(int maxBloodPressure) {
		this.maxBloodPressure = maxBloodPressure;
	}
	public int getMinBloodSugar() {
		return minBloodSugar;
	}
	public void setMinBloodSugar(int minBloodSugar) {
		this.minBloodSugar = minBloodSugar;
	}
	public int getMaxBloodSugar() {
		return maxBloodSugar;
	}
	public void setMaxBloodSugar(int maxBloodSugar) {
		this.maxBloodSugar = maxBloodSugar;
	}
	public double getHeight() {
		return height;
	}
	public void setHeight(double height) {
		this.height = height;
	}
	public double getWeight() {
		return weight;
	}
	public void setWeight(double weight) {
		this.weight = weight;
	}
	public int getHeartBeat() {
		return heartBeat;
	}
	public void setHeartbeat(int heartBeat) {
		this.heartBeat = heartBeat;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	
	
}
