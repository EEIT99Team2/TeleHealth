package util;

import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.net.SocketAddress;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.imageio.ImageIO;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.rendering.PDFRenderer;

public class DownloadFile {

	public static void main(String[] args) {
		Connection conn = null;   //習慣可加上 = null
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//			DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver()); //SQLException
//			System.setProperty("jdbc.drivers", "com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String connUrl = "jdbc:sqlserver://localhost:1433;databaseName=TeleHealthDB";  //jdbc:sqlserver://192.168.50.130都不可以空白
			conn = DriverManager.getConnection(connUrl, "sa", "passw0rd");
			String sql = "select licenceNum,pic from TeleHealth where pic <> ?";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			DownloadFile download = new DownloadFile();
			while(rs.next()) {
				String licenceNum = rs.getString(1);
				String picUrl = rs.getString(2);
				System.out.println(download.downloadUrlFile(picUrl, "E:/drupPics/" + licenceNum + ".pdf"));
				File file = new File("E:/drugPics/" + licenceNum + ".pdf");
				try {
					PDDocument doc = PDDocument.load(file);
					PDFRenderer renderer = new PDFRenderer(doc);
				 	int pageCount = doc.getNumberOfPages();
					for(int i=0;i<pageCount;i++){
//						BufferedImage image = renderer.renderImageWithDPI(i, 296);
						BufferedImage image = renderer.renderImage(i, 2.5f);
						ImageIO.write(image, "PNG", new File("E:/drugPics/" + licenceNum + ".png"));
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(conn != null) {
				try {
					rs.close();
					stmt.close();
					conn.close();
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

	boolean downloadUrlFile(String urlpath, String filepath) {
		try {
			String proxyURL = "proxy.hinet.net";
			String proxyPort = "80";
			SocketAddress sa = new InetSocketAddress(proxyURL, Integer.parseInt(proxyPort));
			Proxy proxy = new Proxy(Proxy.Type.HTTP, sa);
			URL url = new URL(urlpath);
			// URLConnection conn = url.openConnection(proxy);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection(proxy);
			conn.setConnectTimeout(60000); // 60sec, default: 15sec
			conn.setReadTimeout(90000); // 90sec, default: 60sec
			conn.connect();

			/* Check Http Status */
			int status = conn.getResponseCode();
			System.out.println(status);
			switch (status) {
			case java.net.HttpURLConnection.HTTP_GATEWAY_TIMEOUT:// 504
				System.out.println("連線網址逾時!");
				break;
			case java.net.HttpURLConnection.HTTP_FORBIDDEN:// 403
				System.out.println("連線網址禁止!");
				break;
			case java.net.HttpURLConnection.HTTP_INTERNAL_ERROR:// 500
				System.out.println("連線網址錯誤或不存在!");
				break;
			case java.net.HttpURLConnection.HTTP_NOT_FOUND:// 404
				System.out.println("連線網址不存在!");
				break;
			case java.net.HttpURLConnection.HTTP_OK:
				System.out.println("OK!");
				break;
			}

			java.io.BufferedInputStream in = new java.io.BufferedInputStream(conn.getInputStream());
			java.io.FileOutputStream fos = new java.io.FileOutputStream(filepath);
			java.io.BufferedOutputStream bout = new BufferedOutputStream(fos, 1024);
			byte[] data = new byte[1024];
			int x = 0;
			while ((x = in.read(data, 0, 1024)) >= 0) {
				bout.write(data, 0, x);
			}
			bout.close();
			in.close();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
}
