package register.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;

import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.ParseException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import register.model.MemberBean;
import register.model.RegisterService;
import util.GlobalService;
import util.PwdGmail;
import util.SendActiveEmailThread;
import util.SystemUtils;

@Controller
public class RegisterController {

	@Autowired
	private RegisterService registerService = null;

	@RequestMapping(path = { "/checkaccount.controller" }, method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public @ResponseBody String checkAccount(String account) {
		String accountIn = null;
		if (account != null && account.trim().length() > 0) {
			accountIn = account;
		}
		if (registerService.selectByAccount(accountIn) == null) {
			return new Gson().toJson("此帳號可以使用!");
		}
		return new Gson().toJson("此帳號已被註冊，請重新輸入!");
	}

	@RequestMapping(path = { "/checkPassword.controller" }, method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public @ResponseBody String checkPassword(String oldpwd, String memberId) {
		MemberBean beans = registerService.selectById(memberId);
		String Password = beans.getPwd();
		String OldPassword = null;
		if (oldpwd != null && oldpwd.trim().length() > 0) {
			OldPassword = GlobalService.getMD5Endocing(GlobalService.encryptString(oldpwd));
		}
		if (Password.equals(OldPassword)) {
			return new Gson().toJson("此密碼正確!");
		} else {
			return new Gson().toJson("密碼不正確!");
		}
	}

	@RequestMapping(path = { "/register.controller" }, method = { RequestMethod.GET, RequestMethod.POST })
	public String register(String account, String memName, String phone1, String phone, String cellphone, String gender,
			String birth, String year, String month, String day, String memHeight, String memWeight, String bloodType,
			String address, String pwd, String medicine, String medicalHistory, String pwdCheck, Model model,
			@RequestParam(value = "file1", required = false) MultipartFile file)
			throws IOException, SQLException, ParseException {

		// 接收資料
		Map<String, String> errorMsg = new HashMap<>();
		model.addAttribute("MsgMap", errorMsg);

		// 轉換資料
		if (account == null || account.trim().length() == 0) {
			errorMsg.put("errorAccount", "帳號欄位不能空白");
		}

		if (account != null && account.trim().length() > 0) {
			if (account.matches("^\\w{1,63}@[a-zA-Z0-9]{2,63}\\.[a-zA-Z]{2,63}(\\.[a-zA-Z]{2,63})?$")) {
			} else {
				errorMsg.put("errorAccount", "帳號欄位格式錯誤，必須為信箱格式 ex:aaa@openhome.cc");
			}
		}

		if (memName == null || memName.trim().length() == 0) {
			errorMsg.put("errormemName", "姓名欄位不能空白");
		} else if (memName != null && memName.trim().length() > 1 && memName.trim().length() < 8) {
			if (memName.matches("[\\u4e00-\\u9fa5]+")) {
			} else {
				errorMsg.put("errormemName", "姓名欄位必須為中文");
			}
		} else {
			errorMsg.put("errormemName", "姓名欄位格式錯誤");
		}

		if (phone == null || phone.trim().length() == 0) {
			errorMsg.put("errorPhone", "電話欄位不能空白");
		} else if (phone != null) {
			if (phone.matches("0\\d{1,2}-(\\d{6,8})")) {
				System.out.println("電話欄位格式正確");
			} else {
				errorMsg.put("errorPhone", "電話欄位格式錯誤");
			}
		}

		if (cellphone == null || cellphone.trim().length() == 0) {
			errorMsg.put("errorCellphone", "行動電話欄位不能空白");
		} else if (cellphone != null && cellphone.trim().length() > 10) {
			if (cellphone.matches("[0-9]{4}\\-[0-9]{3}\\-[0-9]{3}")) {
			} else {
				errorMsg.put("errorCellphone", "行動電話欄位格式錯誤");
			}
		}

		if (gender == null || gender.trim().length() == 0) {
			errorMsg.put("errorGender", "性別欄位不能空白");
		}

		// 生日欄位必須是日期，並且符合YYYY-MM-DD的格式
		// 日期轉java.util.data型態
		java.util.Date b = null;
		birth = year + "-" + month + "-" + day;
		if (birth == null || birth.trim().length() == 0) {
			errorMsg.put("errorBirth", "生日欄位不能空白");
		} else if (birth != null && birth.trim().length() > 0) {
			try {
				java.text.SimpleDateFormat dFormat = new SimpleDateFormat("yyyy-MM-dd");
				dFormat.setLenient(false);
				b = dFormat.parse(birth);
			} catch (java.text.ParseException e) {
				errorMsg.put("errorBirth", "生日欄位必須是日期，並且符合YYYY-MM-DD的格式");
			}
		}

		if (memHeight == null || memHeight.trim().length() == 0) {
			errorMsg.put("errorMemHeight", "身高欄位不能空白");
		}

		double dHeight = -1;
		if (memHeight != null && memHeight.matches("([1-9]\\d{1,2}|\\d)([.]\\d{1,2})?")) {
			try {

				dHeight = Double.parseDouble(memHeight.trim());
				DecimalFormat df = new DecimalFormat("##.00");
				double Height = Double.parseDouble(df.format(dHeight));
			} catch (NumberFormatException e) {
				errorMsg.put("errorMemHeight", "身高欄位必須為數值");
			}
		} else {
			errorMsg.put("errorMemHeight", "身高欄位格式錯誤");
		}

		if (memWeight == null || memWeight.trim().length() == 0) {
			errorMsg.put("errorMemWeight", "體重欄位不能空白");
		}
		double dWeight = -1;
		if (memWeight != null && memWeight.matches("([1-9]\\d{1,2}|\\d)([.]\\d{1,2})?")) {
			try {
				dWeight = Double.parseDouble(memWeight.trim());
			} catch (NumberFormatException e) {
				errorMsg.put("errorMemWeight", "體重欄位必須為數值");
			}
		} else {
			errorMsg.put("errorMemWeight", "體重欄位格式錯誤");
		}

		if (bloodType == null || bloodType.trim().length() == 0) {
			errorMsg.put("errorBloodType", "血型欄位不能空白");
		}
		if (address == null || address.trim().length() == 0) {
			errorMsg.put("errorAddr", "地址欄位不能空白");
		}

		if (pwd == null || pwd.trim().length() == 0) {
			errorMsg.put("errorPwd", "密碼欄位不能空白");
		} else if (pwd != null && pwd.trim().length() > 1) {
			if (pwd.matches("^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$")) {
			} else {
				errorMsg.put("errorPwd", "密碼欄位格式錯誤");
			}
		}

		if (pwdCheck == null || pwdCheck.trim().length() == 0) {
			errorMsg.put("errorPwdCheck", "密碼確認欄位不能空白");
		} else if (pwdCheck != null && pwdCheck.trim().length() > 1) {
			if (pwdCheck.equals(pwd)) {
			} else {
				errorMsg.put("errorPwdCheck", "密碼確認必須跟密碼相同");
			}
		} else {
			errorMsg.put("errorPwd", "密碼欄位格式錯誤");
		}
		if (medicine == null || medicine.trim().length() == 0) {
			medicine = "無";
		}
		if (medicalHistory == null || medicalHistory.trim().length() == 0) {
			medicalHistory = "無";
		}

		Blob photo = null;
		String fileName = null;
		InputStream in = null;
		if (file != null && !file.isEmpty()) {
			fileName = file.getOriginalFilename();
			String extension = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length()).toLowerCase();
			if (!extension.equals("jpg") && !extension.equals("jpeg") && !extension.equals("gif")
					&& !extension.equals("bmp") && !extension.equals("png") && !extension.equals("tif")
					&& !extension.equals("tiff") && !extension.equals("wmf")) {
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

		if (registerService.selectByAccount(account) != null) {
			errorMsg.put("errorAccount", "此帳號已存在，請換新帳號");
		} else {
			pwd = GlobalService.getMD5Endocing(GlobalService.encryptString(pwd));
			MemberBean member = new MemberBean();
			member.setAccount(account);
			member.setMemName(memName);
			member.setPhone(phone);
			member.setCellphone(cellphone);
			member.setGender(gender);
			member.setBirth(b);
			member.setMemHeight(Double.parseDouble(memHeight));
			member.setMemWeight(Double.parseDouble(memWeight));
			member.setBloodType(bloodType);
			member.setAddress(address);
			member.setPwd(pwd);
			member.setMedicine(medicine);
			member.setMedicalHistory(medicalHistory);
			member.setPhoto(photo);
			member.setFileName(fileName);
			member.setRegisterTime(new Timestamp(System.currentTimeMillis()));
			member.setPoint(5);
			String status = "N";
			member.setStatus(status);
//			Integer a =5;
//			member.setPoint(a);

			MemberBean result = registerService.insert(member);

			// 注冊成功後,發送帳戶激活鏈接
			SendActiveEmailThread.GoMail(result.getAccount(), result.getMemberId());
			if (result != null) {
				return "register.success";
			}
		}
		return "register.error";
	}

}
