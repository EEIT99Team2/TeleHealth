package advisorymoment.model;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;

import advisorymoment.model.dao.AdvisoryMomentDAO;
@Service
@Transactional
public class AdvisoryMomentService {
	@Autowired
	private AdvisoryMomentDAO advisoryMomentDAO;
	
	//會員查詢預約諮詢的index
	public String memberSelectAll(String UserId) {
		LinkedList<HashMap<String, String>> datafinal = new LinkedList<HashMap<String, String>>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<Object[]> result = this.selectAll();
		// 已預約時段
		List<Object[]> reserved = this.selectByMemSelf(UserId);
		String reservedId;
		String VideoCode;
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
					VideoCode = reserved.get(j)[6].toString();
					if (reservedId.equals(MomentId)) {
						dataOne.put("backgroundColor", "#00db00");
						dataOne.put("borderColor", "black");
						dataOne.put("VideoCode", VideoCode);
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
		
	//會員利用類別查詢班表
	public String memberSelectByCode(String UserId, String advisoryCode) {
		LinkedList<HashMap<String, String>> datafinal = new LinkedList<HashMap<String, String>>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<Object[]> result = this.select(advisoryCode);
		// 已預約時段
		List<Object[]> reserved = this.selectByMemSelf(UserId);
		String reservedId;
		String VideoCode;
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
					VideoCode = reserved.get(j)[6].toString();
					if (reservedId.equals(MomentId)) {
						dataOne.put("backgroundColor", "#00db00");
						dataOne.put("borderColor", "black");
						dataOne.put("VideoCode", VideoCode);
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
	
	//員工查詢班表index
	public String employeeSelectAll(String EmpId) {
		LinkedList<HashMap<String, String>> datafinal = new LinkedList<HashMap<String, String>>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<Object[]> result = this.selectAll();
		// 已預約時段
		List<Object[]> selfItem = this.selectByEmpSelf(EmpId);
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
						if(!selfResCode.equals("null")&&status.equals("F")) {							
							dataOne.put("backgroundColor", "#d26900");
							dataOne.put("borderColor", "black");
							dataOne.put("selfResCode", selfResCode);
						}else {
							dataOne.put("backgroundColor", "#0080ff");
							dataOne.put("borderColor", "black");
						}
						break;
					} else {
						if(!otherResCode.equals("null")&&status.equals("F")) {
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
	
	//員工只顯示自己班表
	public String employeeSelectById(String EmpId) {
		LinkedList<HashMap<String, String>> datafinal = new LinkedList<HashMap<String, String>>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		// 員工負責諮詢班表
		List<Object[]> selfItem = this.selectByEmpSelf(EmpId);	
		for (int i = 0; i < selfItem.size(); i++) {
			HashMap<String, String> dataOne = new HashMap<String, String>();
			String MomentId = selfItem.get(i)[0].toString();
			String calendar = sdf.format(selfItem.get(i)[1]);
			// 增加15分鐘
			Date fiftymin = new Date(Timestamp.valueOf(selfItem.get(i)[1].toString()).getTime() + 900000);
			String endtime = sdf.format(fiftymin);
			String status = selfItem.get(i)[2].toString();
			String advisoryCode = selfItem.get(i)[3].toString();
			String empId = selfItem.get(i)[4].toString();
			String empName = selfItem.get(i)[5].toString();
			String VideoCode;
			if(selfItem.get(i)[6]==null) {
				VideoCode="null";
			}else {
				VideoCode=selfItem.get(i)[6].toString();
			}
			dataOne.put("title", advisoryCode + "\r\n" + empName + "醫生");
			dataOne.put("start", calendar);
			dataOne.put("empId", empId);
			dataOne.put("end", endtime);
			dataOne.put("MomentId", MomentId);
			if(status.equals("F")) {							
				dataOne.put("backgroundColor", "#d26900");
				dataOne.put("borderColor", "black");
				dataOne.put("selfResCode", VideoCode);
			}else {
				dataOne.put("backgroundColor", "#0080ff");
				dataOne.put("borderColor", "black");
				dataOne.put("selfResCode", VideoCode);

			}			
			datafinal.add(dataOne);
		}
		String data = new Gson().toJson(datafinal);
		System.out.println("JSON=" + data);
		return data;
	}
	
	public AdvisoryMomentBean selectById(String id) {
		AdvisoryMomentBean result = null;
		if(id!=null && id.trim().length()!=0) {
			result = advisoryMomentDAO.selectById(id);
		}		
		return result;
	};
	
	public List<Object[]> select(String AdvisoryCode) {
		List<Object[]> result = null;
		if(AdvisoryCode!=null) {
			result = advisoryMomentDAO.select(AdvisoryCode);
			System.out.println("Service="+result);
		}		
		return result;
	};
	
	public List<Object[]> selectAll(){
		List<Object[]> result = advisoryMomentDAO.selectAll();
		return result;
	};
	
	//會員自己已預約的時段
	public List<Object[]> selectByMemSelf(String UserId) {			
			List<Object[]> data = null;
			if(UserId!=null&&UserId.trim().length()!=0) {
				data = advisoryMomentDAO.selectByMemSelf(UserId);
			}
			return data;
	};
	
	//以視訊代碼搜尋(會員取消預約時用)
		public List<Object[]> selectByMemVCode(String VideoCode) {
			List<Object[]> result = null;
			if(VideoCode!=null && VideoCode.trim().length()!=0) {
				result = advisoryMomentDAO.selectByMemVCode(VideoCode);
			}
			return result;
		};
	
	//諮詢人員自己負責的時段
		public List<Object[]> selectByEmpSelf(String EmpId) {			
				List<Object[]> data = null;
				if(EmpId!=null&&EmpId.trim().length()!=0) {
					data = advisoryMomentDAO.selectByEmpSelf(EmpId);
				}
				return data;
		};
	public AdvisoryMomentBean insert(AdvisoryMomentBean bean) {
		AdvisoryMomentBean result = null;
		if(bean!=null) {
			result = advisoryMomentDAO.insert(bean);			
		}
		return result;
	};
	
	//會員預約時用
	public AdvisoryMomentBean updateByReserve(AdvisoryMomentBean bean) {
		AdvisoryMomentBean result = null;
		if(bean!=null) {
			result = advisoryMomentDAO.updateByReserve(bean.getId(),bean.getReserveStatus(), bean.getVideoCode());
		}		
		return result;
	};
	
	//取消預約，同時將班表改為未預約狀態
	public boolean updateByResCancel(String id) {
		boolean result = false;
		if(id!=null &&id.trim().length()!=0) {
			result = advisoryMomentDAO.updateByResCancel(id);
		}		
		return result;
	};
	
	//修改班表時用
	public AdvisoryMomentBean updateByEdit(AdvisoryMomentBean bean) {
		AdvisoryMomentBean result = null;
		if(bean!=null) {
			result = advisoryMomentDAO.updateByEdit(bean.getId(),bean.getCalendar(),bean.getReserveStatus(), bean.getAdvisoryCode(), bean.getEmpId(), bean.getVideoCode());
		}		
		return result;
	};
	
	//刪除會員預約紀錄(table:Advisory)
		public boolean deleteMemReserve(String VideoCode,String MomentId) {			
			boolean DeleteResult =false;
			boolean FinalResult =false;
			if (VideoCode != null&&VideoCode.trim().length()!=0) {
				List<Object[]> selectAD = this.selectByMemVCode(VideoCode);
				if(selectAD!=null && selectAD.size()!=0) {				
					DeleteResult =advisoryMomentDAO.deleteMemReserve(VideoCode);
					if(DeleteResult) {
						FinalResult=this.updateByResCancel(MomentId);
					}
				}
			}
			return FinalResult;
		}
	
	public boolean delete(AdvisoryMomentBean bean) {
		boolean result = false;
		if(bean!=null) {
			result = advisoryMomentDAO.delete(bean.getId());
		}
		return result;
	}
}
