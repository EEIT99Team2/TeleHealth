package advisory.model;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;

import advisory.model.dao.AdvisoryDAO;
import register.model.MemberBean;

@Service
@Transactional
public class AdvisoryService {
	@Autowired
	private AdvisoryDAO advisoryDao;
	
	public AdvisoryBean select(String videoCode) {
		AdvisoryBean result=null;
		if(videoCode!=null&&videoCode.trim().length()!=0) {
			result = advisoryDao.select(videoCode);
		}
		return result;
	};
	
	//透過會員id查詢
	public String selectByMemId(String memberId) {
		List<Object[]> result = advisoryDao.selectByMemId(memberId);		
		LinkedList<HashMap<String, String>> datafinal = new LinkedList<HashMap<String, String>>();
		String zhCareer = "醫生";
		if(result.size()!=0) {			
			for(int i =0;i<result.size();i++) {
				HashMap<String, String> dataOne = new HashMap<String, String>();
				dataOne.put("videoCode", result.get(i)[0].toString());
				dataOne.put("empId", result.get(i)[1].toString());
				if(result.get(i)[2]!=null) {
					dataOne.put("descrip", result.get(i)[2].toString());
				}else {
					dataOne.put("descrip", "null");
				}
				dataOne.put("advisoryTime", result.get(i)[3].toString());
				if(result.get(i)[4]!=null) {
					dataOne.put("videoRecord", result.get(i)[4].toString());
				}else {
					dataOne.put("videoRecord", "null");
				}
				if(result.get(i)[5]!=null) {
					dataOne.put("satisfy", result.get(i)[5].toString());
				}else {
					dataOne.put("satisfy", "null");
				}
				dataOne.put("createTime", result.get(i)[6].toString());
				if(result.get(i)[7]!=null) {
					dataOne.put("modifyTime", result.get(i)[7].toString());
				}else {
					dataOne.put("modifyTime", "null");
				}			
				dataOne.put("status", result.get(i)[8].toString());
				dataOne.put("empName", result.get(i)[9].toString());
				if(result.get(i)[10].toString().equals("Nutritionist")) {
					zhCareer = "營養師";
				}
				dataOne.put("career", zhCareer);
				dataOne.put("momentId", result.get(i)[11].toString());
				dataOne.put("reserveItem", result.get(i)[12].toString());
				datafinal.add(dataOne);
			}
		}
		String data = new Gson().toJson(datafinal);
		System.out.println("JSON=" + data);
		return data;
	};
	
	public AdvisoryBean insert(AdvisoryBean bean) {
		AdvisoryBean result =null;
		if (bean != null) {
			result = advisoryDao.insert(bean);			
		}
		return result;
	};
	
	//會員預約扣款
	public boolean updateMemPoint(String UserId) {
		boolean result =false;
		if(UserId!=null && UserId.trim().length()!=0) {
			int upResult= advisoryDao.updateMemPoint(UserId);
			if(upResult==1) {				
				result=true;
			}
		}		
		return result;
	}
	//新增紀錄
	public boolean updateadvisorydata(String memberId,String empId,String descrip,String videoCode)
	{
		int data = advisoryDao.insertadvisory(memberId, empId, descrip, videoCode);
		if (data!=0) {
			return true;
		}
		return false;
	}
}
