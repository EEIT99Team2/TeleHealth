package register.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import register.model.MemberBean;
import register.model.RegisterService;
import util.GlobalService;
import util.SystemUtils;

@Controller
public class MemberDataController {
	
	@Autowired
	private RegisterService registerService =null;
	
	@RequestMapping(
			path={"/Members02.controller"},
			method={RequestMethod.GET, RequestMethod.POST}
	)
	public String method(		
			String memName,
			String memHeight,
			String memWeight,
			String bloodType,
			String medicine,
			String medicalHistory,
			String phone, 
			String cellphone,
			String address,
			HttpSession session,
			Model model,
			@RequestParam(value="fileout" ,required = false) MultipartFile file
			) throws IOException, SQLException, ParseException {
		// 接收資料
				Map<String, String> errorMsg = new HashMap<>();
				model.addAttribute("MsgMap", errorMsg); 
				
				if(memName==null|| memName.trim().length()==0) {
					errorMsg.put("errormemName", "姓名欄位不能空白");
				}else if(memName!=null && memName.trim().length()>1&& memName.trim().length()<8) {
					if(memName.matches("[\\u4e00-\\u9fa5]+")) {
						System.out.println("姓名欄位格式正確");
					}else {
						errorMsg.put("errormemName", "姓名欄位必須為中文");
					}
				}else {
					errorMsg.put("errormemName", "姓名欄位格式錯誤");
				}
				
				if(bloodType ==null|| bloodType.trim().length()==0) {
					errorMsg.put("errorBloodType", "血型欄位不能空白");
				}
				
				
				if(memHeight == null|| memHeight.trim().length()==0) {
					errorMsg.put("errorMemHeight", "身高欄位不能空白");
				}
										
				double dHeight = -1;
				if(memHeight!=null && memHeight.trim().length()>1 && memHeight.trim().length()<=6) {								
					 
					try {
						dHeight = Double.parseDouble(memHeight.trim());
					}catch(NumberFormatException e) {
						errorMsg.put("errorMemHeight", "身高欄位必須為數值");
					}
				}else {
					errorMsg.put("errorMemHeight", "身高欄位格式錯誤");
				}
				
				if(memWeight ==null|| memWeight.trim().length()==0) {
					errorMsg.put("errorMemWeight", "體重欄位不能空白");
				}
				double dWeight = -1;
				if(memWeight!=null && memWeight.trim().length()>1 && memWeight.trim().length()<=6) {
					try {
						dWeight = Double.parseDouble(memWeight.trim());
					}catch(NumberFormatException e) {
						errorMsg.put("errorMemWeight", "體重欄位必須為數值");
					}
				}else {
					errorMsg.put("errorMemWeight", "體重欄位格式錯誤");
				}
				
				if(bloodType ==null|| bloodType.trim().length()==0) {
					errorMsg.put("errorBloodType", "血型欄位不能空白");
				}
				System.out.println("bloodType="+bloodType);
				
				if(address ==null|| address.trim().length()==0) {
					errorMsg.put("errorAddr", "地址欄位不能空白");
				}
				
				if(phone ==null|| phone.trim().length()==0) {
					errorMsg.put("errorPhone", "電話欄位不能空白");
				}else if(phone!=null ) {
					if(phone.matches("0\\d{1,2}-(\\d{6,8})")) {
						System.out.println("電話欄位格式正確");
					}else {
						errorMsg.put("errorPhone", "電話欄位格式錯誤");
					}		
				}		
															
				if(cellphone ==null|| cellphone.trim().length()==0) {
					errorMsg.put("errorCellphone", "行動電話欄位不能空白");
				}else if(cellphone!=null&& cellphone.trim().length()>10) {
					if(cellphone.matches("[0-9]{4}\\-[0-9]{3}\\-[0-9]{3}")) {
						System.out.println("行動電話欄位格式正確");
					}else {
						errorMsg.put("errorCellphone", "行動電話欄位格式錯誤");
					}
				}
				
				
				
				if(medicine ==null|| medicine.trim().length()==0) {
					errorMsg.put("errorMedicine", "藥物過敏欄位不能空白");
				}	
				if(medicalHistory ==null|| medicalHistory.trim().length()==0) {
					errorMsg.put("errorMedicalHistory", "過去病史欄位不能空白");
				}	
				
				Blob photo = null;
				String fileName = null;
				InputStream in = null;
				if(file != null && !file.isEmpty()) {
					fileName = file.getOriginalFilename();
					String extension = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length()).toLowerCase();
					if(!extension.equals("jpg") && !extension.equals("jpeg") &&
							!extension.equals("gif") && !extension.equals("bmp") && !extension.equals("png") &&
							!extension.equals("tif") && !extension.equals("tiff") && !extension.equals("wmf")) {
						errorMsg.put("errorPhoto", "照片必須為圖片檔!");	
					} else {
						fileName = GlobalService.adjustFileName(fileName, GlobalService.IMAGE_FILENAME_LENGTH);
						in = file.getInputStream();
						photo = SystemUtils.fileToBlob(in, file.getSize());
					}
				}				
				
				if (errorMsg != null && !errorMsg.isEmpty()) {
					return "memberdata.error";
				}else {

					MemberBean member = (MemberBean)session.getAttribute("LoginOK");
					if(member==null) {
						System.out.println("沒抓到session");
						return "login.error";
					}else {
						
					
					member.setMemName(memName);
					member.setMemHeight(Double.parseDouble(memHeight));
					member.setMemWeight(Double.parseDouble(memWeight));
					member.setBloodType(bloodType);
					member.setAddress(address);
					member.setMedicalHistory(medicalHistory);
					member.setMedicine(medicine);
					member.setCellphone(cellphone);
					member.setPhone(phone);
					member.setPhoto(photo);
					member.setFileName(fileName);
					member.setModifiyTime(new Timestamp(System.currentTimeMillis()));
					
					member = registerService.Update(member);
					}
					if(member != null) {
						return "register.success";
					}else {
						return "login.error";
					}
				}		
	}
}
