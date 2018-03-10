package healthcolumn.model.Dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import healthcolumn.model.HealthColumnBean;

@Service
@Transactional
public class HealthService {
	@Autowired
	 private HealthColumnDAO healthColumnDAO;
	//選取頁面
	public List<HealthColumnBean> loadpage(String advisoryCode) {
		List<HealthColumnBean> list = healthColumnDAO.selectbycode(advisoryCode);	
		return list;	
	}
	//選取文章
	public List<Object[]> loadtitle(String title) {
		List<Object[]> list = healthColumnDAO.selectbytitle(title);	
		return list;	
	}
	//選取醫生文章
	public List<HealthColumnBean> doctorpublish(String empId)
	{
		List<HealthColumnBean> Doccontext = healthColumnDAO.select(empId);
		return Doccontext;		
	}
	//選取熱門文章
	public List<HealthColumnBean> hotcontext() {
		List<HealthColumnBean> Hotcontext = healthColumnDAO.selectTop();
		return Hotcontext;		
	};
	//選出輪播牆
	public List<HealthColumnBean> hotcontextimg() {
		List<HealthColumnBean> Hotcontextimg = healthColumnDAO.selectimg();
		return Hotcontextimg;		
	};
	//刪除文章
	public  boolean delete(String columnId) {
		 boolean deleetecon = healthColumnDAO.delete(columnId);
		return deleetecon;
	}
	//新增文章
	public boolean insert(HealthColumnBean bean) {
		HealthColumnBean Insertcontext = healthColumnDAO.insert(bean);
		if(Insertcontext!=null) {
			return true;
		}
		return false;
	}
	//點擊率
	public void count(String title) {
		healthColumnDAO.count(title);
	}
	//更新文章
	public boolean updatecontent(String title,String content,String fileName) {
		healthColumnDAO.update(title, content, fileName);
		return true;
	}
	
}
