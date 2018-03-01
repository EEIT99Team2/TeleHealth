package register.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import register.model.MemberBean;
import register.model.RegisterService;
import util.FormToken;
import util.GlobalService;
import util.SystemUtils;

@Controller
public class RegisterController {

	@Autowired
	private RegisterService registerService =null;

//	@Autowired
//	private ApplicationContext context; 多國語系

	@RequestMapping(
			path={"/register.controller"},
			method={RequestMethod.GET, RequestMethod.POST}
	)
	@FormToken(save=true)
	public String method(
				String account, 
				String memName, 
				String phone, 
				String cellphone, 
				String gender, 
				String birth,
				String memHeight,
				String memWeight,
				String bloodType,
				String address,
				String pwd,
				String medicine,
				String medicalHistory,
				Model model,
				@RequestParam(value="file1" ,required = false) MultipartFile file
			) throws IOException, SQLException, ParseException {
		
		// 接收資料
		Map<String, String> errorMsg = new HashMap<>();
		model.addAttribute("MsgMap", errorMsg); 
		// 轉換資料
				if(account ==null|| account.trim().length()==0) {
					errorMsg.put("errorAccount", "帳號欄位不能空白");
				}
				if(memName==null|| memName.trim().length()==0) {
					errorMsg.put("errormemName", "姓名欄位不能空白");
				}	
				if(phone ==null|| phone.trim().length()==0) {
					errorMsg.put("errorPhone", "電話欄位不能空白");
				}	
				if(cellphone ==null|| cellphone.trim().length()==0) {
					errorMsg.put("errorCellphone", "行動電話欄位不能空白");
				} 
				if(gender ==null|| gender.trim().length()==0) {
					errorMsg.put("errorGender", "性別欄位不能空白");
				}
				
				if(birth == null || birth.trim().length() == 0){
					errorMsg.put("errorBirth", "生日欄位必須是日期，並且符合YYYY-MM-DD的格式");
				}
				if(memHeight == null|| memHeight.trim().length()==0) {
					errorMsg.put("errorMemHeight", "身高欄位不能空白");
				}	
				if(memWeight ==null|| memWeight.trim().length()==0) {
					errorMsg.put("errorMemWeight", "體重欄位不能空白");
				}	
				if(bloodType ==null|| bloodType.trim().length()==0) {
					errorMsg.put("errorBloodType", "血型欄位不能空白");
				}
				if(address ==null|| address.trim().length()==0) {
					errorMsg.put("errorAddr", "地址欄位不能空白");
				}
				if(pwd ==null||  pwd.trim().length()==0) {
					errorMsg.put("errorPwd", "密碼欄位不能空白");
				}
				if(medicine ==null|| medicine.trim().length()==0) {
					errorMsg.put("errorMedicine", "藥物過敏欄位不能空白");
				}	
				if(medicalHistory ==null|| medicalHistory.trim().length()==0) {
					errorMsg.put("errorMedicalHistory", "藥物過敏欄位不能空白");
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
					return "register.error";
				}
				//日期轉java.util.data型態
				DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				Date date = formatter.parse(birth);	
				
				if(registerService.selectByAccount(account) != null) {
					errorMsg.put("errorAccount", "此帳號已存在，請換新帳號");			
				}else {
					MemberBean bb = new MemberBean();
					bb.setAccount(account);
					bb.setMemName(memName);
					bb.setPhone(phone);
					bb.setCellphone(cellphone);
					bb.setGender(gender);
					bb.setBirth(date);
					bb.setMemHeight(Double.parseDouble(memHeight));
					bb.setMemWeight(Double.parseDouble(memWeight));
					bb.setBloodType(bloodType);
					bb.setAddress(address);
					bb.setPwd(pwd);
					bb.setMedicine(medicine);
					bb.setMedicalHistory(medicalHistory);
					bb.setPhoto(photo);
					bb.setFileName(fileName);
					bb.setRegisterTime(new Timestamp(System.currentTimeMillis()));
					
					MemberBean n = registerService.insert(bb);
					if(n!=null) {			
						return "register.success";
					}else {
						return "register.error";
					}
				}												
		return "register.error";
	}
}
