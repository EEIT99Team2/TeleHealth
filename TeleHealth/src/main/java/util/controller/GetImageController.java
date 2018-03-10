package util.controller;

import java.sql.Blob;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import register.model.MemberBean;

//本Controller用於將網頁顯示資料庫的圖片用src路徑
@Controller
public class GetImageController {
	@RequestMapping(value = "/getImage.controller", method = { RequestMethod.GET, RequestMethod.POST })
	public ResponseEntity<byte[]> getImageAsResponseEntity(HttpSession session) {
		MemberBean member = null;
		if (session.getAttribute("LoginOK") != null) {
			member = (MemberBean) session.getAttribute("LoginOK");

			// MemberBean member = registerService.selectByAccount();
			HttpHeaders headers = new HttpHeaders();
			byte[] media = null;
			try {
				if (member.getPhoto() != null) {
					Blob blob = member.getPhoto();
					media = util.SystemUtils.BlobToByte(blob);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			headers.setCacheControl(CacheControl.noCache().getHeaderValue());
			ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
			return responseEntity;
		} else {
			return null;
		}
	}
}
