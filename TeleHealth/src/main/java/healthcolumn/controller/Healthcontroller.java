package healthcolumn.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
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
import com.google.gson.GsonBuilder;

import healthcolumn.model.HealthColumnBean;
import healthcolumn.modelDao.HealthService;
import utils.GlobalService;

@Controller
public class Healthcontroller {
	@Autowired
	private HealthService healthService;

	// 讀取頁面
	@RequestMapping(path = { "/healthcolumn/healthcolumn.controller" }, produces = "text/html;charset=UTF-8", method = {
			RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody String Loadpage(String advisoryCode) {
		List<HealthColumnBean> loadpage = healthService.Loadpage(advisoryCode);
		System.out.println(loadpage);
		Gson gson = new Gson();
		String data = gson.toJson(loadpage);
		System.out.println(data);
		return data;
	}
	//選取點擊的文章
	@RequestMapping(path = { "/healthcolumn/titlecontent.controller" }, produces = "text/html;charset=UTF-8", method = {
			RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody String Loadtitle(String title) {
		List<Object[]> loadtitle = healthService.Loadtitle(title);
		System.out.println(loadtitle);
		Gson gson = new Gson();
		String data = gson.toJson(loadtitle);
		System.out.println(data);
		return data;
	}
	//熱門文章
	@RequestMapping(path = { "/healthcolumn/hotcontent.controller" }, produces = "text/html;charset=UTF-8", method = {
			RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody String Hotcontent() {
		List<HealthColumnBean> data = healthService.Hotcontext();		
		Gson gson = new Gson();
		String dataAll = gson.toJson(data);
		System.out.println(dataAll);
		return dataAll;		
		
	}

	// 尋找個人發布過的文章
	@RequestMapping(path = { "/healthcolumn/publishcontent.controller" }, produces = "text/html;charset=UTF-8", method = {
			RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody String Doctorpublish(String empId) {
		List<HealthColumnBean> doctorpublish = healthService.Doctorpublish(empId);
		System.out.println(doctorpublish);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd ").create(); ;
		String datafordoctor = gson.toJson(doctorpublish);
		System.out.println(datafordoctor);
		return datafordoctor;
	}

	// 新增文章
	@RequestMapping(path = {
			"/healthcolumn/inshealthcolumn.controller" }, produces = "text/html;charset=UTF-8", method = {
					RequestMethod.POST })
	public String insterttxt(
			String title, 
			String name, 
			String type, 
			String content,
			Model model,
			HttpSession session,
			@RequestParam(name="videofile", required = false) MultipartFile file
			) throws IOException {
//		System.out.println("file1=" + file.getName());
//		System.out.println(title + "  " + name + " " + type + " " + content + " " + file.getName());
		Map<String, String> errors = new HashMap<>();
		model.addAttribute("errors", errors);
		Map<String, String> msgOK = new HashMap<String, String>();
		model.addAttribute("msgOK", msgOK);
		if (title == null || title.trim().length() == 0) {
			errors.put("errortitleEmpty", "標題必須輸入");
		}
		if (title != null && content == null || content.trim().length() == 0) {
			errors.put("errorcontentEmpty", "文章必須有內容");
		}
		if (!errors.isEmpty()) {
			return "form.error";
		} else {
			HealthColumnBean bean = new HealthColumnBean();
			bean.setTitle(title);
			bean.setContent(content);
			bean.setAdvisoryCode(type);
			bean.setClickCount(0);
			bean.setCreateDate(new Date());
			String fileName = null;
			InputStream in = null;
			BufferedOutputStream out = null;
			if (file != null && !file.isEmpty()) {
				fileName = file.getOriginalFilename();
				String extension = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length()).toLowerCase();
				if (!extension.equals("mp4") && !extension.equals("ogg") && !extension.equals("webm")
						&& !extension.equals("m3u8")) {
					errors.put("errorVideo", "瀏覽器支援的影像格式為.mp4、.ogg、.webm、.m3u8，請重新上傳!");
				} else {
					fileName = GlobalService.adjustFileName(fileName, GlobalService.IMAGE_FILENAME_LENGTH);
					in = file.getInputStream();
					//上傳檔案路徑 
					//新增檔案位置
					File filepath = new File("c:/videos/" + fileName);
					//將上傳檔案儲存到一個目標檔案當中 
					if (!filepath.getParentFile().exists()) { 
						filepath.getParentFile().mkdirs(); 
					}
					out = new BufferedOutputStream(new FileOutputStream(filepath));
					byte[] readByte = new byte[8192];
					int len = 0;
					while ((len = in.read(readByte)) != -1) {
						out.write(readByte, 0, len);
					}
				}
			}
			bean.setFileName(fileName);
			bean.setEmpId(name);
			boolean ok = healthService.Insert(bean);
			if (ok) {
				msgOK.put("uploadok", "上傳成功!!");
				return "form.ok";
			} else {
				errors.put("uploaderror", "上傳失敗!!");
				return "form.error";
			}

		}

	}
	// 修改文章
	@RequestMapping(path = {
	"/healthcolumn/updatehealthcolumn.controller" }, produces = "text/html;charset=UTF-8", method = {
			RequestMethod.POST })
	public @ResponseBody String updatecontent(String title,String content,String advisoryCode,String fileName,Model model) {
		
		return "a";
	}
	
	// 刪除文章
	@RequestMapping(path = {
	"/healthcolumn/deletehealthcolumn.controller" }, produces = "text/html;charset=UTF-8", method = {
			RequestMethod.POST })
	public @ResponseBody String deletecontent(String columnId,Model model) {
		boolean delete = healthService.Delete(columnId);
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
	
	// 增加點擊率
	@RequestMapping(path = {
	"/healthcolumn/countarticle.controller" }, produces = "text/html;charset=UTF-8", method = {
			RequestMethod.POST })
	public @ResponseBody String countarticle(String title) {
		 healthService.count(title);
		 return "success";
	}
	
}