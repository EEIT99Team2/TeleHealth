package healthcolumn.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import healthcolumn.model.QuestionBean;
import healthcolumn.model.Dao.QuestionService;

@Controller
public class Questioncontroller {
	@Autowired
	private QuestionService QuestionService;
	//po文回應
	@RequestMapping(path = { "/healthcolumn/QAcontent.controller" }, produces = "text/html;charset=UTF-8", method = {
			RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody String loadQAcontent(String title) {
		List<QuestionBean> loadpage = QuestionService.loadresponse(title);		
		Gson gson = new Gson();
		String data = gson.toJson(loadpage);		
		return data;
	}
	//員工文章
	@RequestMapping(path = { "/healthcolumn/QAEmpublish.controller" }, produces = "text/html;charset=UTF-8", method = {
			RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody String loadQAEmppublish(String empId) {
		List<QuestionBean> loadpage = QuestionService.loadEmp(empId);		
		Gson gson = new Gson();
		String data = gson.toJson(loadpage);		
		return data;
	}
	//會員文章
	@RequestMapping(path = { "/healthcolumn/QAMempublish.controller" }, produces = "text/html;charset=UTF-8", method = {
			RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody String loadQAMempublish(String memId) {
		List<QuestionBean> loadpage = QuestionService.loadMem(memId);
		Gson gson = new Gson();
		String data = gson.toJson(loadpage);		
		return data;
	}
	// 修改po文
	@RequestMapping(path = {
	"/healthcolumn/updatememQA.controller" }, produces = "text/html;charset=UTF-8", method = {
			RequestMethod.POST,RequestMethod.GET })
	public @ResponseBody String updatecontent(String contenttext,String questionId,Model model) {
		int columnIdemp=Integer.parseInt(questionId);		
		boolean update = QuestionService.updateQA(columnIdemp, contenttext);		
		if(update) {
			Gson gson = new Gson();
			String dataLoad = gson.toJson("ok");
			return dataLoad ;			
		}else {	
			Gson gson = new Gson();
			String dataLoad = gson.toJson("wrong");
			return dataLoad ;			
		}		
	}	
	// 刪除會員po文章
	@RequestMapping(path = {
	"/healthcolumn/deleteQAMem.controller" }, produces = "text/html;charset=UTF-8", method = {
			RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody String deleteMem(String Id,String memberId,Model model) {		
		int columnIdMem=Integer.parseInt(Id);		
		boolean delete = QuestionService.deleteMem(columnIdMem, memberId);
		Map<String, String> contenterrors = new HashMap<>();
		model.addAttribute("contenterrors", contenterrors);
		Map<String, String> contentOK = new HashMap<String, String>();
		model.addAttribute("contentOK", contentOK);
		if(delete) {
			contenterrors.put("contentok", "已刪除所選擇的文章!!");
			return  "deletecontentok";
		}else {
			contentOK.put("contenterror", "刪除失敗!!");
			return "deletecontenterror";
		}		
	}
	// 刪除員工文章
		@RequestMapping(path = {
		"/healthcolumn/deleteQAEmp.controller" }, produces = "text/html;charset=UTF-8", method = {
				RequestMethod.GET, RequestMethod.POST })
		public @ResponseBody String deleteEmp(String Id,String EmpId,Model model) {
			int columnIdemp=Integer.parseInt(Id);
			boolean delete = QuestionService.deleteEmp(columnIdemp, EmpId);
			Map<String, String> contenterrors = new HashMap<>();
			model.addAttribute("contenterrors", contenterrors);
			Map<String, String> contentOK = new HashMap<String, String>();
			model.addAttribute("contentOK", contentOK);
			if(delete) {
				contenterrors.put("contentok", "已刪除所選擇的文章!!");
				return  "deletecontentok";
			}else {
				contentOK.put("contenterror", "刪除失敗!!");
				return "deletecontenterror";
			}		
		}
		//新增po文章
		@RequestMapping(path = {"/healthcolumn/insQA.controller" }, produces = "text/html;charset=UTF-8", method = {
				RequestMethod.GET, RequestMethod.POST })
		public @ResponseBody String insertresponse(
				String MemId,
				String textmem,
				String advisorycode,
				String title,
				Model model) {				
			QuestionBean bean=new QuestionBean();
			bean.setAdvisorycode(advisorycode);
			bean.setMemberId(MemId);
			bean.setContent(textmem);
			bean.setCreateTime(new Date());
			bean.setQAtype("Q");
			bean.setQuetitle(title);
			System.out.println(bean);
			boolean createcont = QuestionService.insertQA(bean);			
			if(createcont) {
				Gson gson = new Gson();
				String dataLoad = gson.toJson("ok");
				return dataLoad ;
			}else {
				Gson gson = new Gson();
				String dataLoad = gson.toJson("wrong");
				return dataLoad ;
			}		
		}		
		@RequestMapping(path = {"/healthcolumn/insQAdoctor.controller" }, produces = "text/html;charset=UTF-8", method = {
				RequestMethod.GET, RequestMethod.POST })
		public @ResponseBody String insertresponseemp(
				String empId,
				String textemp,
				String advisorycode,
				String title,
				Model model) {				
			QuestionBean bean=new QuestionBean();
			System.out.println("advisorycode=" + advisorycode);
			System.out.println("empId=" + empId);
			System.out.println("textemp=" + textemp);
			System.out.println("title=" + title);
			bean.setAdvisorycode(advisorycode);
			bean.setEmpId(empId);
			bean.setContent(textemp);
			bean.setCreateTime(new Date());
			bean.setQAtype("A");
			bean.setQuetitle(title);
			boolean delete = QuestionService.insertQAemp(bean);			
			if(delete) {
				Gson gson = new Gson();
				String dataLoad = gson.toJson("ok");
				return dataLoad ;
			}else {
				Gson gson = new Gson();
				String dataLoad = gson.toJson("wrong");
				return dataLoad ;
			}		
		}
		//選修改文章
		@RequestMapping(path = {"/healthcolumn/QAupdateId.controller" }, produces = "text/html;charset=UTF-8", method = {
				RequestMethod.GET, RequestMethod.POST })
		public @ResponseBody String QAupdateId(String Id)
		{
			int columnIdemp=Integer.parseInt(Id);
			List<QuestionBean> dataId = QuestionService.loadtitleId(columnIdemp);
			Gson gson = new Gson();
			String dataLoad = gson.toJson(dataId);			
			return dataLoad;			 
		}
		//選修全部文章
				@RequestMapping(path = {"/healthcolumn/allmempublish.controller" }, produces = "text/html;charset=UTF-8", method = {
						RequestMethod.GET, RequestMethod.POST })
				public @ResponseBody String QAallmempublish()
				{					
					List<Object[]> allmempublish = QuestionService.loadtotalcontent();
					Gson gson = new Gson();
					String dataLoad = gson.toJson(allmempublish);					
					return dataLoad;			 
				}
		//選修全部一位文章
		@RequestMapping(path = {"/healthcolumn/QAMemonepublish.controller" },produces = "text/html;charset=UTF-8", method = {
				RequestMethod.GET, RequestMethod.POST })
		public @ResponseBody String QAMemonepublish(String memname,Model model)
			{		
				
				List<Object[]> allmempublish = QuestionService.QAMemonepublish(memname);
				if(allmempublish.size()==0) {					
					Gson gson = new Gson();
					String dataLoad = gson.toJson("wrong");
					return dataLoad ;
				}					
				Gson gson = new Gson();
				String dataLoad = gson.toJson(allmempublish);				
				return dataLoad;			 
			}	
		@RequestMapping(path = {
		"/healthcolumn/deleteQAmemonepublish.controller" }, produces = "text/html;charset=UTF-8", method = {
				RequestMethod.GET, RequestMethod.POST })
		public @ResponseBody String deleteQAmemonepublish(String Id)
		{		
				
			boolean allmempublish = QuestionService.QAMemdelonepublish(Id);
			if(allmempublish) {					
				Gson gson = new Gson();
				String dataLoad = gson.toJson("OK");
				return dataLoad ;
			}else {					
			Gson gson = new Gson();
			String dataLoad = gson.toJson("刪除失敗");				
			return dataLoad;
			}
		}	
}
