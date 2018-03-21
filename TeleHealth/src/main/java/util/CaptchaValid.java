package util;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.nio.charset.Charset;
public class CaptchaValid {
	public static boolean isCaptchaValid(String secretKey, String response) {
	    try {
	        String url = "https://www.google.com/recaptcha/api/siteverify?"
	                + "secret=" + secretKey
	                + "&response=" + response;
	        InputStream res = new URL(url).openStream();
	        BufferedReader rd = new BufferedReader(new InputStreamReader(res, Charset.forName("UTF-8")));
	        StringBuilder sb = new StringBuilder();
	        int cp;
	        while ((cp = rd.read()) != -1) {
	            sb.append((char) cp);
	        }
	        res.close();
	        String jsonText = sb.toString();
	        String result = jsonText.substring(jsonText.indexOf(":")+1, jsonText.indexOf(",")).trim();
	        return result.equals("true");
	    } catch (Exception e) {
	        return false;
	    }
	}
}
