package util.controller;

import java.sql.Blob;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import register.model.MemberBean;
import register.model.RegisterService;

@Controller
public class GetImageController {
	@Autowired
	private RegisterService registerService;
	
//	@RequestMapping(value = "/getImage.controller", method= {RequestMethod.GET, RequestMethod.POST})
//	public @ResponseBody byte[] getImageAsByteArray(HttpSession session) throws IOException {
//	    InputStream in = session.getServletContext()
//	    		.getResourceAsStream("/WEB-INF/imagesimages/Test.JPG");
//	    return IOUtils.toByteArray(in);
//	}
	
	@RequestMapping(value = "/getImage.controller", method= {RequestMethod.GET, RequestMethod.POST})
	public ResponseEntity<byte[]> getImageAsResponseEntity() {
		MemberBean member = registerService.selectByAccount("abc123");
		HttpHeaders headers = new HttpHeaders();
		byte[] media = null;
		try	{
			Blob blob = member.getPhoto();
			media = util.SystemUtils.BlobToByte(blob);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}
	
}
