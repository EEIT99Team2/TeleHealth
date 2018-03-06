package util.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//本Controller用於產生驗證的亂碼
@Controller
public class IdentityController {
	// 預先建立隨機字元，去除0、O、I、1易混淆字
	public static final char[] CHARS = { '2', '3', '4', '5', '6', '7', '8', '9', 
			'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P',
			'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

	// 亂數
	public static Random random = new Random();

	// 獲得6位亂數
	public static String getRandomString() {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < 6; i++) {
			sb.append(CHARS[random.nextInt(CHARS.length)]);
		}
		return sb.toString();
	}
	
	//獲得隨機的顏色
	public static Color getRandomColor() {
		return new Color(random.nextInt(255), random.nextInt(255), random.nextInt(255));
	}
	
	//獲得隨機顏色的反色
	public static Color getReverseColor(Color color) {
		return new Color(255 - color.getRed(), 255 - color.getGreen(), 255 - color.getBlue());
	}
	@RequestMapping(value = "/verificationcode.controller", method= {RequestMethod.GET, RequestMethod.POST})
	public ResponseEntity<byte[]> getVerificationCode(Model model) throws IOException {
		String randomString = getRandomString();
		model.addAttribute("randomString", randomString);
		int width = 120;
		int height = 40;
		Color color = getRandomColor();
		Color reverseColor = getReverseColor(color);
		
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_BGR);
		Graphics2D g = image.createGraphics();
		g.setFont(new Font(Font.SANS_SERIF, Font.BOLD, 26));
		g.setColor(color);
		g.fillRect(0, 0, width, height);
		g.setColor(reverseColor);
		g.drawString(randomString, 8, 28);
		for(int i = 0, n =random.nextInt(100); i < n; i++) {
			g.drawRect(random.nextInt(width), random.nextInt(height), 1, 1);
		}
 
		g.dispose();
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		ImageIO.write(image, "JPEG", baos);
		byte[] verifiy = baos.toByteArray();
		HttpHeaders headers = new HttpHeaders();
	    ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(verifiy, headers, HttpStatus.OK);
		
	    return responseEntity;
	}
	
}
