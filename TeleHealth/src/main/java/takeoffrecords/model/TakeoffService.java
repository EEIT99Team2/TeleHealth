package takeoffrecords.model;

import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import org.hibernate.query.NativeQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;

import register.model.MemberBean;
import register.model.dao.MemberDAOHibernate;
import takeoffrecords.model.dao.TakeoffDAO;

@Service
@Transactional
public class TakeoffService {

	@Autowired
	private TakeoffDAO takeoffDao;

	@Autowired
	private MemberDAOHibernate memberDAO;
	
	public boolean takeoffApplication(String MomentId, String EmpId, String TakeoffItem, String TakeoffReason) {
		java.util.Date createTime = new Date();
		TakeoffBean tbean = new TakeoffBean();
		tbean.setAdvisoryMomentId(MomentId);
		tbean.setEmpId(EmpId);
		tbean.setApplicationType(TakeoffItem);
		tbean.setApplicationTime(createTime);
		tbean.setApplicationReason(TakeoffReason);
		boolean result = this.insert(tbean);
		return result;
	}

	//搜尋會員帳戶(註銷班表時用)
		public String selectMemAcc(String videoCode) {
			String result ="";
			if(videoCode!=null && videoCode.trim().length()!=0) {
				result=takeoffDao.selectMemAcc(videoCode);
			}
			return result;
		}
	
	// 透過班表id搜尋申請假單紀錄
	public TakeoffBean select(String MomentId) {
		TakeoffBean result = null;
		if (MomentId != null && MomentId.trim().length() != 0) {
			result = takeoffDao.select(MomentId);
		}
		return result;
	}
	
	// 後台管理顯示(index用)
	public String selectAll() {
		LinkedList<HashMap<String, String>> dataFinal = new LinkedList<HashMap<String, String>>();
		List<Object[]> takeoffData = takeoffDao.selectAll();
		String takeoffId, MomentId, empId, empName, career, apType, apTime, apReason, status, videoCode,reResult,reTime,reReason,momStatus,calendar;
		if (takeoffData.size() != 0) {
			for (int i = 0; i < takeoffData.size(); i++) {
				HashMap<String, String> dataOne = new HashMap<String, String>();
				takeoffId = takeoffData.get(i)[0].toString();
				MomentId = takeoffData.get(i)[1].toString();
				empId = takeoffData.get(i)[2].toString();
				empName = takeoffData.get(i)[3].toString();
				career = takeoffData.get(i)[4].toString();
				apType = takeoffData.get(i)[5].toString();
				apTime = takeoffData.get(i)[6].toString();
				apReason = takeoffData.get(i)[7].toString();
				if (takeoffData.get(i)[9] == null) {
					status = "未預約";
					videoCode = "null";
				} else {
					status = "已預約";
					videoCode = takeoffData.get(i)[9].toString();
				}
				//管理員是否回覆
				if (takeoffData.get(i)[10] == null) {
					reResult = "null";
					reTime = "null";
					reReason = "null";
				} else {
					reResult = takeoffData.get(i)[10].toString();
					reTime = takeoffData.get(i)[11].toString();
					reReason = takeoffData.get(i)[12].toString();
				}
				momStatus = takeoffData.get(i)[13].toString();
				calendar = takeoffData.get(i)[14].toString();
				dataOne.put("takeoffId", takeoffId);
				dataOne.put("MomentId", MomentId);
				dataOne.put("empId", empId);
				dataOne.put("empName", empName);
				dataOne.put("zhCareer", career);
				dataOne.put("apType", apType);
				dataOne.put("apTime", apTime);
				dataOne.put("apReason", apReason);
				dataOne.put("status", status);
				dataOne.put("videoCode", videoCode);
				dataOne.put("reResult", reResult);
				dataOne.put("reTime", reTime);
				dataOne.put("reReason", reReason);
				dataOne.put("momStatus", momStatus);
				dataOne.put("calendar", calendar);
				dataFinal.add(dataOne);				
			}
		}
		String data = new Gson().toJson(dataFinal);
		return data;
	}

	public boolean insert(TakeoffBean bean) {
		boolean result = false;
		if (bean != null) {
			result = takeoffDao.insert(bean);
		}
		return result;
	}
	
	//回覆請假申請
	public boolean updateApproved(String takeoffId,String apResult,String reason) {
		return takeoffDao.updateApproved(takeoffId, apResult, reason);
	}

	//退款
	public boolean updateMemPoint(String account) {
		boolean result =false;
		List<MemberBean> bean= memberDAO.selectByAccount(account);
		if(bean!=null && bean.size()!=0) {
			int upResult = takeoffDao.updateMemPoint(account);
			if(upResult==1) {				
				result =true;
			}
		}
		return result;
	}
	public boolean delete(String id) {	
		return takeoffDao.delete(id);
	}
}
