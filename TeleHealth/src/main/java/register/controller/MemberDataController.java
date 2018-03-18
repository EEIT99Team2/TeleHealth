package register.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import register.model.dao.MemberDAOHibernate;
import util.GlobalService;
import util.SystemUtils;

@Controller
public class MemberDataController {

	@Autowired
	private RegisterService registerService = null;

	@Autowired
	private MemberDAOHibernate memberDAO = null;

	@RequestMapping(path = { "/Members02.controller" }, method = { RequestMethod.GET, RequestMethod.POST })
	public String method(String memName, String memHeight, String memWeight, String bloodType, String medicine,
			String medicalHistory, String phone, String cellphone, String address, HttpSession session, Model model,
			@RequestParam(value = "fileout", required = false) MultipartFile file)
			throws IOException, SQLException, ParseException {
		// 接收資料
		Map<String, String> errorMsg = new HashMap<>();
		model.addAttribute("MsgMap", errorMsg);

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

		if (bloodType == null || bloodType.trim().length() == 0) {
			errorMsg.put("errorBloodType", "血型欄位不能空白");
		}

		if (memHeight == null || memHeight.trim().length() == 0) {
			errorMsg.put("errorMemHeight", "身高欄位不能空白");
		}

		double dHeight = -1;
		if (memHeight != null && memHeight.trim().length() > 1 && memHeight.trim().length() <= 6) {
			try {
				dHeight = Double.parseDouble(memHeight.trim());
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
		if (memWeight != null && memWeight.trim().length() > 1 && memWeight.trim().length() <= 6) {
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

		if (phone == null || phone.trim().length() == 0) {
			errorMsg.put("errorPhone", "電話欄位不能空白");
		} else if (phone != null) {
			if (phone.matches("0\\d{1,2}-(\\d{6,8})")) {
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

		if (medicine == null || medicine.trim().length() == 0) {
			errorMsg.put("errorMedicine", "藥物過敏欄位不能空白");
		}
		if (medicalHistory == null || medicalHistory.trim().length() == 0) {
			errorMsg.put("errorMedicalHistory", "過去病史欄位不能空白");
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
			return "ModifyData.error";
		} else {

			MemberBean member = (MemberBean) session.getAttribute("LoginOK");
			if (member == null) {
				return "login.error";
			} else {

				member.setMemName(memName);
				member.setMemHeight(Double.parseDouble(memHeight));
				member.setMemWeight(Double.parseDouble(memWeight));
				member.setBloodType(bloodType);
				member.setAddress(address);
				member.setMedicalHistory(medicalHistory);
				member.setMedicine(medicine);
				member.setCellphone(cellphone);
				member.setPhone(phone);				
				if(fileName!=null && fileName.trim().length()!=0) {					
					member.setFileName(fileName);
					member.setPhoto(photo);
				}
				member.setModifiyTime(new Timestamp(System.currentTimeMillis()));
				member = registerService.Update(member);
			}
			if (member != null) {
				return "ModifyData.success";
			} else {
				return "ModifyData.error";
			}
		}
	}

	@RequestMapping(path = { "/checkPoint.controller" }, method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody String checkPoint(String memberId) {
		String point;
		if (memberId != null && memberId.trim().length() != 0) {
			MemberBean bean = registerService.selectById(memberId);
			point = String.valueOf(bean.getPoint());
		} else {
			point = "查詢時發生錯誤";
		}
		return point;
	}

	// 會員狀態
	@RequestMapping(path = { "/checkstatus.controller" }, method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody String checkStatus(String account) {
		if (account != null && account.trim().length() != 0) {
			MemberBean member = registerService.selectByAccount(account);
			if (member != null) {
				if (member.getStatus().equals("Y")) {
					member.setStatus("S");
					member = registerService.Update(member);
				} else if (member.getStatus().equals("S")) {
					member.setStatus("Y");
					registerService.Update(member);
				}
			}
		}
		return account;
	}

	// 丁丁
	@RequestMapping(path = { "/point.controller" }, method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public @ResponseBody String pointRecords(String memberid) {

		LinkedList<HashMap<String, String>> datafinal = new LinkedList<HashMap<String, String>>();
		List<Object[]> result = memberDAO.selectMemberId(memberid);
		for (int i = 0; i < result.size(); i++) {
			HashMap<String, String> dataOne = new HashMap<String, String>();
			String MerchantTradeDate = result.get(i)[1].toString();
			String TotalAmount = result.get(i)[2].toString();
			dataOne.put("TotalAmount", TotalAmount);
			dataOne.put("MerchantTradeDate", MerchantTradeDate);
			datafinal.add(dataOne);
		}
		HashMap<String, LinkedList<HashMap<String, String>>> datas = new HashMap<String, LinkedList<HashMap<String, String>>>();
		datas.put("data", datafinal);
		String data = new Gson().toJson(datas);
		return data;
	}

	// 會員管理
	@RequestMapping(path = { "/checkMembers.controller" }, method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public @ResponseBody String MgMembers() {
		LinkedList<HashMap<String, String>> datafinal = new LinkedList<HashMap<String, String>>();
		List<MemberBean> bean = memberDAO.selectAll();

		for (int i = 0; i < bean.size(); i++) {
			HashMap<String, String> dataOne = new HashMap<String, String>();
			String account = bean.get(i).getAccount().toString();
			String memName = bean.get(i).getMemName().toString();
			String registerTime = bean.get(i).getRegisterTime().toString().substring(0, 16);
			String gender = bean.get(i).getGender().toString();
			if (gender.equals("M")) {
				gender = "男";
			}
			if (gender.equals("F")) {
				gender = "女";
			}
			String phone = bean.get(i).getPhone().toString();
			String cellphone = bean.get(i).getCellphone().toString();
			String birth = bean.get(i).getBirth().toString().substring(0, 10);
			String address = bean.get(i).getAddress().toString();

			String status = bean.get(i).getStatus().toString();
			if (status.equals("N")) {
				status = "未開通";
			}
			if (status.equals("Y")) {
				status = "正常";
			}
			if (status.equals("S")) {
				status = "停權";
			}
			String medicine = bean.get(i).getMedicine() != null ? bean.get(i).getMedicine() : null;
			if (medicine == null) {
				medicine = "無";
			}

			String medicalHistory = bean.get(i).getMedicalHistory() != null ? bean.get(i).getMedicalHistory() : null;
			if (medicalHistory == null) {
				medicalHistory = "無";
			}
			dataOne.put("account", account);
			dataOne.put("memName", memName);
			dataOne.put("registerTime", registerTime);
			dataOne.put("gender", gender);
			dataOne.put("phone", phone);
			dataOne.put("cellphone", cellphone);
			dataOne.put("birth", birth);
			dataOne.put("address", address);
			dataOne.put("medicine", medicine);
			dataOne.put("medicalHistory", medicalHistory);
			dataOne.put("status", status);

			String management = "停權";
			dataOne.put("management", management);
			// dataOne.put("photo", photo);
			datafinal.add(dataOne);
		}
		HashMap<String, LinkedList<HashMap<String, String>>> datas = new HashMap<String, LinkedList<HashMap<String, String>>>();
		datas.put("data", datafinal);
		String data = new Gson().toJson(datas);
		return data;

	}

	@RequestMapping(path = { "/Advisorymember.controller" }, method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody String Advisorymember(String memberId) {
		MemberBean bean = memberDAO.selectById(memberId);
		return new Gson().toJson(bean);
	}

}
