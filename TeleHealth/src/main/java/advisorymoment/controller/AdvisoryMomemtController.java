package advisorymoment.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import advisorymoment.model.AdvisoryMomentService;

@Controller
public class AdvisoryMomemtController {
	@Autowired
	private AdvisoryMomentService advisoryMomentService;

	@RequestMapping(path = { "/AdvisoryMomemt/memberSelectByCode.controller" }, method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public @ResponseBody String memberSelectByCode(String UserId, String advisoryCode) {
		LinkedList<HashMap<String, String>> datafinal = new LinkedList<HashMap<String, String>>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<Object[]> result = advisoryMomentService.select(advisoryCode);
		// 已預約時段
		List<Object[]> reserved = advisoryMomentService.selectByMemSelf(UserId);
		for (int i = 0; i < result.size(); i++) {
			HashMap<String, String> dataOne = new HashMap<String, String>();
			String MomentId = result.get(i)[0].toString();
			String calendar = sdf.format(result.get(i)[1]);
			Date fiftymin = new Date(Timestamp.valueOf(result.get(i)[1].toString()).getTime() + 900000);
			String endtime = sdf.format(fiftymin);
			String status = result.get(i)[2].toString();
			String adCode = result.get(i)[3].toString();
			String empId = result.get(i)[4].toString();
			String empName = result.get(i)[5].toString();
			String reservedId;
			dataOne.put("title", adCode + "\r\n" + empName + "醫生");
			dataOne.put("start", calendar);
			dataOne.put("empId", empId);
			dataOne.put("end", endtime);
			dataOne.put("MomentId", MomentId);
			if (status.equals("E")) {
				dataOne.put("backgroundColor", "#0080ff");
				dataOne.put("borderColor", "black");
				// 已有預約諮詢
			} else if (status.equals("F") && reserved.size() != 0) {
				for (int j = 0; j < reserved.size(); j++) {
					reservedId = reserved.get(j)[0].toString();
					if (reservedId.equals(MomentId)) {
						dataOne.put("backgroundColor", "#00db00");
						dataOne.put("borderColor", "black");
						break;
					} else {
						dataOne.put("backgroundColor", "#ea0000");
						dataOne.put("borderColor", "black");
					}
				}
			} else if (status.equals("F") && reserved.size() == 0) {
				dataOne.put("backgroundColor", "#ea0000");
				dataOne.put("borderColor", "black");
			}
			datafinal.add(dataOne);
		}
		String data = new Gson().toJson(datafinal);
		System.out.println("JSON=" + data);
		return data;
	}

	@RequestMapping(path = { "/AdvisoryMomemt/memberSelectAll.controller" }, method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public @ResponseBody String memberSelectAll(String UserId) {
		LinkedList<HashMap<String, String>> datafinal = new LinkedList<HashMap<String, String>>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<Object[]> result = advisoryMomentService.selectAll();
		// 已預約時段
		List<Object[]> reserved = advisoryMomentService.selectByMemSelf(UserId);
		String reservedId;
		for (int i = 0; i < result.size(); i++) {
			HashMap<String, String> dataOne = new HashMap<String, String>();
			String MomentId = result.get(i)[0].toString();
			String calendar = sdf.format(result.get(i)[1]);
			// 增加15分鐘
			Date fiftymin = new Date(Timestamp.valueOf(result.get(i)[1].toString()).getTime() + 900000);
			String endtime = sdf.format(fiftymin);
			String status = result.get(i)[2].toString();
			String advisoryCode = result.get(i)[3].toString();
			String empId = result.get(i)[4].toString();
			String empName = result.get(i)[5].toString();
			dataOne.put("title", advisoryCode + "\r\n" + empName + "醫生");
			dataOne.put("start", calendar);
			dataOne.put("empId", empId);
			dataOne.put("end", endtime);
			dataOne.put("MomentId", MomentId);
			if (status.equals("E")) {
				dataOne.put("backgroundColor", "#0080ff");
				dataOne.put("borderColor", "black");
				// 已有預約諮詢
			} else if (status.equals("F") && reserved.size() != 0) {
				for (int j = 0; j < reserved.size(); j++) {
					reservedId = reserved.get(j)[0].toString();
					if (reservedId.equals(MomentId)) {
						dataOne.put("backgroundColor", "#00db00");
						dataOne.put("borderColor", "black");
						break;
					} else {						
						dataOne.put("backgroundColor", "#ea0000");
						dataOne.put("borderColor", "black");
					}
				}
			} else if (status.equals("F") && reserved.size() == 0) {				
				dataOne.put("backgroundColor", "#ea0000");
				dataOne.put("borderColor", "black");
			}
			datafinal.add(dataOne);
		}
		String data = new Gson().toJson(datafinal);
		System.out.println("JSON=" + data);
		return data;
	}
	
	
	@RequestMapping(path = { "/AdvisoryMomemt/memberCancelRes.controller" }, method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public @ResponseBody String memberCancelRes(String UserId) {
		LinkedList<HashMap<String, String>> datafinal = new LinkedList<HashMap<String, String>>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<Object[]> result = advisoryMomentService.selectAll();
		// 已預約時段
		List<Object[]> reserved = advisoryMomentService.selectByMemSelf(UserId);
		String reservedId;
		for (int i = 0; i < result.size(); i++) {
			HashMap<String, String> dataOne = new HashMap<String, String>();
			String MomentId = result.get(i)[0].toString();
			String calendar = sdf.format(result.get(i)[1]);
			// 增加15分鐘
			Date fiftymin = new Date(Timestamp.valueOf(result.get(i)[1].toString()).getTime() + 900000);
			String endtime = sdf.format(fiftymin);
			String status = result.get(i)[2].toString();
			String advisoryCode = result.get(i)[3].toString();
			String empId = result.get(i)[4].toString();
			String empName = result.get(i)[5].toString();
			dataOne.put("title", advisoryCode + "\r\n" + empName + "醫生");
			dataOne.put("start", calendar);
			dataOne.put("empId", empId);
			dataOne.put("end", endtime);
			dataOne.put("MomentId", MomentId);
			if (status.equals("E")) {
				dataOne.put("backgroundColor", "#0080ff");
				dataOne.put("borderColor", "black");
				// 已有預約諮詢
			} else if (status.equals("F") && reserved.size() != 0) {
				for (int j = 0; j < reserved.size(); j++) {
					reservedId = reserved.get(j)[0].toString();
					if (reservedId.equals(MomentId)) {
						dataOne.put("backgroundColor", "#00db00");
						dataOne.put("borderColor", "black");
						break;
					} else {						
						dataOne.put("backgroundColor", "#ea0000");
						dataOne.put("borderColor", "black");
					}
				}
			} else if (status.equals("F") && reserved.size() == 0) {				
				dataOne.put("backgroundColor", "#ea0000");
				dataOne.put("borderColor", "black");
			}
			datafinal.add(dataOne);
		}
		String data = new Gson().toJson(datafinal);
		System.out.println("JSON=" + data);
		return data;
	}
	
	@RequestMapping(path = { "/AdvisoryMomemt/employeeSelectAll.controller" }, method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public @ResponseBody String employeeSelectAll(String EmpId) {
		LinkedList<HashMap<String, String>> datafinal = new LinkedList<HashMap<String, String>>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<Object[]> result = advisoryMomentService.selectAll();
		// 已預約時段
		List<Object[]> selfItem = advisoryMomentService.selectByEmpSelf(EmpId);
		String selfItemId;
		String selfResCode;		
		for (int i = 0; i < result.size(); i++) {
			HashMap<String, String> dataOne = new HashMap<String, String>();
			String MomentId = result.get(i)[0].toString();
			String calendar = sdf.format(result.get(i)[1]);
			// 增加15分鐘
			Date fiftymin = new Date(Timestamp.valueOf(result.get(i)[1].toString()).getTime() + 900000);
			String endtime = sdf.format(fiftymin);
			String status = result.get(i)[2].toString();
			String advisoryCode = result.get(i)[3].toString();
			String empId = result.get(i)[4].toString();
			String empName = result.get(i)[5].toString();
			String otherResCode;
			if(result.get(i)[6]==null) {
				otherResCode="null";
			}else {
				otherResCode=result.get(i)[6].toString();
			}
			dataOne.put("title", advisoryCode + "\r\n" + empName + "醫生");
			dataOne.put("start", calendar);
			dataOne.put("empId", empId);
			dataOne.put("end", endtime);
			dataOne.put("MomentId", MomentId);
	
				for (int j = 0; j < selfItem.size(); j++) {
					selfItemId = selfItem.get(j)[0].toString();
					//當自己負責的班表id equal到此項班表id
					if (selfItemId.equals(MomentId)) {
						if(selfItem.get(j)[6]==null) {
							selfResCode ="null";
							System.out.println("無人預約");
						}else {							
							selfResCode = selfItem.get(j)[6].toString();
						}
						//此項班表有預約
						if(!selfResCode.equals("null")) {							
							dataOne.put("backgroundColor", "#d26900");
							dataOne.put("borderColor", "black");
							dataOne.put("selfResCode", selfResCode);
						}else {
							dataOne.put("backgroundColor", "#0080ff");
							dataOne.put("borderColor", "black");
						}
						break;
					} else {
						if(!otherResCode.equals("null")) {
							dataOne.put("backgroundColor", "#ea0000");
							dataOne.put("borderColor", "black");
						}else {
							dataOne.put("backgroundColor", "#bebebe");
							dataOne.put("borderColor", "black");
						}
					}
				}
			
			datafinal.add(dataOne);
		}
		String data = new Gson().toJson(datafinal);
		System.out.println("JSON=" + data);
		return data;
	}		
	
	@RequestMapping(path = { "/AdvisoryMomemt/employeeSelectById.controller" }, method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public @ResponseBody String employeeSelectById(String EmpId) {
		LinkedList<HashMap<String, String>> datafinal = new LinkedList<HashMap<String, String>>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<Object[]> result = advisoryMomentService.selectAll();
		// 已預約時段
		List<Object[]> selfItem = advisoryMomentService.selectByEmpSelf(EmpId);
		String selfItemId;
		String selfResCode;		
		for (int i = 0; i < result.size(); i++) {
			HashMap<String, String> dataOne = new HashMap<String, String>();
			String MomentId = result.get(i)[0].toString();
			String calendar = sdf.format(result.get(i)[1]);
			// 增加15分鐘
			Date fiftymin = new Date(Timestamp.valueOf(result.get(i)[1].toString()).getTime() + 900000);
			String endtime = sdf.format(fiftymin);
			String status = result.get(i)[2].toString();
			String advisoryCode = result.get(i)[3].toString();
			String empId = result.get(i)[4].toString();
			String empName = result.get(i)[5].toString();
			String otherResCode;
			if(result.get(i)[6]==null) {
				otherResCode="null";
			}else {
				otherResCode=result.get(i)[6].toString();
			}
			dataOne.put("title", advisoryCode + "\r\n" + empName + "醫生");
			dataOne.put("start", calendar);
			dataOne.put("empId", empId);
			dataOne.put("end", endtime);
			dataOne.put("MomentId", MomentId);
	
				for (int j = 0; j < selfItem.size(); j++) {
					selfItemId = selfItem.get(j)[0].toString();
					//當自己負責的班表id equal到此項班表id
					if (selfItemId.equals(MomentId)) {
						if(selfItem.get(j)[6]==null) {
							selfResCode ="null";
							System.out.println("無人預約");
						}else {							
							selfResCode = selfItem.get(j)[6].toString();
						}
						//此項班表有預約
						if(!selfResCode.equals("null")) {							
							dataOne.put("backgroundColor", "#d26900");
							dataOne.put("borderColor", "black");
							dataOne.put("selfResCode", selfResCode);
						}else {
							dataOne.put("backgroundColor", "#0080ff");
							dataOne.put("borderColor", "black");
						}
						break;
					} else {
						if(!otherResCode.equals("null")) {
							dataOne.put("backgroundColor", "#ea0000");
							dataOne.put("borderColor", "black");
						}else {
							dataOne.put("backgroundColor", "#bebebe");
							dataOne.put("borderColor", "black");
						}
					}
				}
			
			datafinal.add(dataOne);
		}
		String data = new Gson().toJson(datafinal);
		System.out.println("JSON=" + data);
		return data;
	}	
	
	
	@RequestMapping(path = { "/AdvisoryMomemt/ManagerEdit.controller" }, method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public @ResponseBody String ManagerEdit() {
		LinkedList<HashMap<String, String>> datafinal = new LinkedList<HashMap<String, String>>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<Object[]> result = advisoryMomentService.selectAll();
		for (int i = 0; i < result.size(); i++) {
			HashMap<String, String> dataOne = new HashMap<String, String>();
			String calendar = sdf.format(result.get(i)[0]);
			String status = result.get(i)[1].toString();
			String advisoryCode = result.get(i)[2].toString();
			String empId = result.get(i)[3].toString();
			String empName = result.get(i)[4].toString();
			dataOne.put("title", advisoryCode + "\r\n" + empName + "醫生");
			dataOne.put("start", calendar);
			dataOne.put("empId", empId);
			if (status.equals("E")) {
				dataOne.put("backgroundColor", "#0080ff");
				dataOne.put("borderColor", "black");
				dataOne.put("editable", "true");
			} else if (status.equals("F")) {
				dataOne.put("backgroundColor", "#ea0000");
				dataOne.put("borderColor", "black");
			}
			datafinal.add(dataOne);
		}
		String data = new Gson().toJson(datafinal);
		System.out.println("JSON=" + data);
		return data;
	}
}
