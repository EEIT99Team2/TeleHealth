package util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class TestFirst {

	public static void main(String[] args) {
//		try {
//			String strUrl = "http://www.fda.gov.tw/MLMS/ShowFile.aspx?LicId=02025473&Seq=345&Type=10";
//			URL source = new URL(strUrl);
//			String theStrDestDir = "C:\\123\\";
//			File theStockDest = new File(theStrDestDir);
//			FileUtils.forceMkdir(theStockDest);
//
//			File destination = new File(theStrDestDir + "\\衛署藥輸字第025459號.pdf");
//
//			FileUtils.copyURLToFile(source, destination);
//			// File file = new File(".");
//			System.out.println("File Downloaded!");
//		} catch (MalformedURLException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		
		File file = new File("c:/123/456.pdf");
		try {
		   URL url = new URL("http://www.fda.gov.tw/MLMS/ShowFile.aspx?LicId=02025452&Seq=001&Type=10");
		   HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		   conn.connect();
		   BufferedInputStream is = new BufferedInputStream(conn.getInputStream());
		   FileOutputStream fos = new FileOutputStream(file);
		   byte[] b = new byte[8192];
		   
		   int l = 0;
		   
		   while((l = is.read(b))!= -1){
		        fos.write(b, 0, l);
		   }
		   //釋放資源
		   fos.close();
		   is.close();
		   conn.disconnect();
		} catch (Exception e) {
		   // TODO Auto-generated catch block
		   e.printStackTrace();
		}
	}

}