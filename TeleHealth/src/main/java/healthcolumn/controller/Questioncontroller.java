package healthcolumn.controller;

import java.util.Date;
import java.util.HashMap;
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
		System.out.println(loadpage);
		Gson gson = new Gson();
		String data = gson.toJson(loadpage);
		System.out.println(data);
		return data;
	}
	//員工文章
	@RequestMapping(path = { "/healthcolumn/QAEmpublish.controller" }, produces = "text/html;charset=UTF-8", method = {
			RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody String loadQAEmppublish(String empId) {
		List<QuestionBean> loadpage = QuestionService.loadEmp(empId);
		System.out.println(loadpage);
		Gson gson = new Gson();
		String data = gson.toJson(loadpage);
		System.out.println(data);
		return data;
	}
	//會員文章
	@RequestMapping(path = { "/healthcolumn/QAMempublish.controller" }, produces = "text/html;charset=UTF-8", method = {
			RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody String loadQAMempublish(String memId) {
		List<QuestionBean> loadpage = QuestionService.loadMem(memId);
		System.out.println(loadpage);
		Gson gson = new Gson();
		String data = gson.toJson(loadpage);
		System.out.println(data);
		return data;
	}
	// 修改會員po文
//	@RequestMapping(path = {
//	"/healthcolumn/updatehealthcolumn.controller" }, produces = "text/html;charset=UTF-8", method = {
//			RequestMethod.POST })
//	public @ResponseBody String updatecontent(String title,String content,String advisoryCode,String fileName,Model model) {
//		
//		return "a";
//	}
//	// 修改員工po文
//	@RequestMapping(path = {
//	"/healthcolumn/updatehealthcolumn.controller" }, produces = "text/html;charset=UTF-8", method = {
//			RequestMethod.POST })
//	public @ResponseBody String updatecontent(String title,String content,String advisoryCode,String fileName,Model model) {
//		
//		return "a";
//	}
	//新增回應
	
	//新增問題
//	@RequestMapping(path = {"/healthcolumn/QAinsertMem.controller" }, produces = "text/html;charset=UTF-8", method = {
//			RequestMethod.POST })
//	public @ResponseBody String insertMem(
//			,Model model) {
//	
//		}		
//	}
//	
	// 刪除會員po文章
	@RequestMapping(path = {
	"/healthcolumn/deleteQAMem.controller" }, produces = "text/html;charset=UTF-8", method = {
			RequestMethod.POST })
	public @ResponseBody String deleteMem(String Id,String empId,Model model) {
		int columnIdMem=Integer.parseInt(Id);
		boolean delete = QuestionService.deleteEmp(columnIdMem, empId);
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
				RequestMethod.POST })
		public @ResponseBody String deleteEmp(String Id,String MemId,Model model) {
			int columnIdemp=Integer.parseInt(Id);
			boolean delete = QuestionService.deleteEmp(columnIdemp, MemId);
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
				RequestMethod.POST })
		public @ResponseBody String insertresponse(
				String MemId,
				String textmem,
				String advisorycode,
				String title,
				Model model) {	
			System.out.println(MemId+"123 "+textmem+" "+advisorycode+" "+title);
			QuestionBean bean=new QuestionBean();
			bean.setAdvisorycode(advisorycode);
			bean.setMemberId(MemId);
			bean.setContent(textmem);
			bean.setCreateTime(new Date());
			bean.setQAtype("Q");
			bean.setQuetitle(title);
			boolean delete = QuestionService.insertQA(bean);
			Map<String, String> contenterrors = new HashMap<>();
			model.addAttribute("contenterrors", contenterrors);
			Map<String, String> contentOK = new HashMap<String, String>();
			model.addAttribute("contentOK", contentOK);
			if(delete) {
				contenterrors.put("contentok", "新增成功!!");
				return  "deletecontentok";
			}else {
				contentOK.put("contenterror", "新增失敗!!");
				return "deletecontenterror";
			}		
		}
}
