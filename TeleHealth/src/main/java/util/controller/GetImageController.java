package util.controller;

import java.sql.Blob;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import employees.model.EmployeesBean;
import employees.model.EmployeesService;
import register.model.LoginService;
import register.model.MemberBean;

//本Controller用於將網頁顯示資料庫的圖片用src路徑
@Controller
public class GetImageController {
	@Autowired
	private LoginService loginService;
	@Autowired
	private EmployeesService employeesService;
	
	@RequestMapping(value = "/getImage.controller", method = { RequestMethod.GET, RequestMethod.POST })
	public ResponseEntity<byte[]> getImageAsResponseEntity(HttpSession session) {
		MemberBean member = null;
		EmployeesBean emp = null;
		if (session.getAttribute("LoginOK") != null) {
			member = (MemberBean) session.getAttribute("LoginOK");
		} else if(session.getAttribute("empLoginOK") != null) {
			emp = (EmployeesBean) session.getAttribute("empLoginOK");
		}
		HttpHeaders headers = new HttpHeaders();
		byte[] media = null;
		Blob blob = null;
		try {
			if (member != null && member.getPhoto() != null) {
				blob = member.getPhoto();
				media = util.SystemUtils.BlobToByte(blob);
			} else if (emp != null && emp.getPhoto() != null) {
				blob = emp.getPhoto();
				media = util.SystemUtils.BlobToByte(blob);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		if(media != null) {
			ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
			return responseEntity;
		} else {
			return null;
		}
	}

	@RequestMapping(value = "/getimagebyid.controller", method = { RequestMethod.GET, RequestMethod.POST })
	public ResponseEntity<byte[]> getImageByIdAsResponseEntity(String id,HttpSession session) {
		MemberBean member = null;
		EmployeesBean emp = null;
		String queryId = null;
		String flag = "member";
		if(id != null) {
			queryId = id.trim();
			if(queryId.indexOf("@") < 1 ) {
				flag = "emp";
			}
			if(flag.equals("member")) {
				member = loginService.selectByAccount(queryId);
			} else {
				emp = employeesService.selectByAccount(queryId);
			}
		}
		HttpHeaders headers = new HttpHeaders();
		byte[] media = null;
		Blob blob = null;
		try {
			if (member != null && member.getPhoto() != null) {
				blob = member.getPhoto();
				media = util.SystemUtils.BlobToByte(blob);
			} else if (emp != null && emp.getPhoto() != null) {
				blob = emp.getPhoto();
				media = util.SystemUtils.BlobToByte(blob);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		if(media != null) {
			ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
			return responseEntity;
		} else {
			return null;
		}
	}
}
