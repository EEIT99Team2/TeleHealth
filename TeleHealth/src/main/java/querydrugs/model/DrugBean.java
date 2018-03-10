package querydrugs.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="drugList")
public class DrugBean {
	@Id
	private String licenseNum;
	private String effectiveDate;
	private String issueDate;
	private String clearanceNum;
	private String chineseName;
	private String englishName;
	private String symptom;
	private String formulation;
	private String packs;
	private String category;
	private String regulatoryLevel;
	private String ingredients;
	private String applicatorName;
	private String manuName;
	private String country;
	private String usage;
	private String shape;
	private String color;
	private String marks;
	private String pic;
	public String getLicenseNum() {
		return licenseNum;
	}
	public void setLicenseNum(String licenseNum) {
		this.licenseNum = licenseNum;
	}
	public String getEffectiveDate() {
		return effectiveDate;
	}
	public void setEffectiveDate(String effectiveDate) {
		this.effectiveDate = effectiveDate;
	}
	public String getIssueDate() {
		return issueDate;
	}
	public void setIssueDate(String issueDate) {
		this.issueDate = issueDate;
	}
	public String getClearanceNum() {
		return clearanceNum;
	}
	public void setClearanceNum(String clearanceNum) {
		this.clearanceNum = clearanceNum;
	}
	public String getChineseName() {
		return chineseName;
	}
	public void setChineseName(String chineseName) {
		this.chineseName = chineseName;
	}
	public String getEnglishName() {
		return englishName;
	}
	public void setEnglishName(String englishName) {
		this.englishName = englishName;
	}
	public String getSymptom() {
		return symptom;
	}
	public void setSymptom(String symptom) {
		this.symptom = symptom;
	}
	public String getFormulation() {
		return formulation;
	}
	public void setFormulation(String formulation) {
		this.formulation = formulation;
	}
	public String getPacks() {
		return packs;
	}
	public void setPacks(String packs) {
		this.packs = packs;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getRegulatoryLevel() {
		return regulatoryLevel;
	}
	public void setRegulatoryLevel(String regulatoryLevel) {
		this.regulatoryLevel = regulatoryLevel;
	}
	public String getIngredients() {
		return ingredients;
	}
	public void setIngredients(String ingredients) {
		this.ingredients = ingredients;
	}
	public String getApplicatorName() {
		return applicatorName;
	}
	public void setApplicatorName(String applicatorName) {
		this.applicatorName = applicatorName;
	}
	public String getManuName() {
		return manuName;
	}
	public void setManuName(String manuName) {
		this.manuName = manuName;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getUsage() {
		return usage;
	}
	public void setUsage(String usage) {
		this.usage = usage;
	}
	public String getShape() {
		return shape;
	}
	public void setShape(String shape) {
		this.shape = shape;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getMarks() {
		return marks;
	}
	public void setMarks(String marks) {
		this.marks = marks;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	
	@Override
	public String toString() {
		return "DrugBean [licenseNum=" + licenseNum + ", chineseName=" + chineseName + ", englishName=" + englishName
				+ "]";
	}
	
}
