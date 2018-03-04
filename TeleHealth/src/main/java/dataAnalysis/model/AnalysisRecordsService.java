package dataAnalysis.model;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dataAnalysis.model.dao.AnalysisRecordsDAO;



@Service
@Transactional
public class AnalysisRecordsService {
	@Autowired
	private AnalysisRecordsDAO analysisRecordsDao;
	
//讀取會員ID
	
	@Transactional(readOnly=true)
	public List<AnalysisRecordsBean> selectMemberRecords(String memberid){
		List<AnalysisRecordsBean> result =null; 
		if(memberid!=null && memberid.length()!=0) {
		List<AnalysisRecordsBean> temp = analysisRecordsDao.MemberRecordshistory(memberid);			
		if(temp!=null) {
			result = new ArrayList<AnalysisRecordsBean>();
			result.addAll(temp);
			}
		}
		return result;
	}
	
	public AnalysisRecordsBean insert(AnalysisRecordsBean bean) {
		AnalysisRecordsBean result =null;
		if(bean!=null){
			result = analysisRecordsDao.insert(bean);
		}
		return result;
}
//	
//	public NativeQuery selectOne() {
//		NativeQuery temp = analysisRecordsDao.selectOne();
//		return temp;
//	}
//	
	
	
	
	
	//比對資料
				
		public void datacompare() {		
			int result =0;
			int age = 56/10;
			int roundage =Math.round(age);
			int floorage = (int) Math.floor(age);
			if(roundage==floorage) {
			    result = floorage*10;
			}else {
				result = (floorage*10)+5; 
			}
		}
}
