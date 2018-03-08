package healthcolumn.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	//文章回應
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
	@RequestMapping(path = { "/healthcolumn/QAempublish.controller" }, produces = "text/html;charset=UTF-8", method = {
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
	@RequestMapping(path = { "/healthcolumn/QAmempublish.controller" }, produces = "text/html;charset=UTF-8", method = {
			RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody String loadQAMempublish(String memId) {
		List<QuestionBean> loadpage = QuestionService.loadMem(memId);
		System.out.println(loadpage);
		Gson gson = new Gson();
		String data = gson.toJson(loadpage);
		System.out.println(data);
		return data;
	}
}
