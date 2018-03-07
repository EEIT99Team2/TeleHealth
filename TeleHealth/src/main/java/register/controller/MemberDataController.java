package register.controller;

import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import register.model.RegisterService;

@Controller
public class MemberDataController {
	
	@Autowired
	private RegisterService registerService =null;
	
	@RequestMapping(
			path={"/Members02.controller"},
			method={RequestMethod.GET, RequestMethod.POST}
	)
	public String method(		
			String memName,
			String memHeight,
			String memWeight,
			String bloodType,
			String medicine,
			String medicalHistory,
			String phone, 
			String cellphone,
			String address,
			Model model,
			@RequestParam(value="fileout" ,required = false) MultipartFile file
			) throws IOException, SQLException, ParseException {
		// 接收資料
				Map<String, String> errorMsg = new HashMap<>();
				model.addAttribute("MsgMap", errorMsg); 
				
				if(memName!=null) {
					System.out.println("memName="+memName);
				}
		
		return null;		
	}
}
