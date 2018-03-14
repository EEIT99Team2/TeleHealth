package util;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.imageio.ImageIO;
  
public class ImageZipUtil {  
	
	public static void main(String[] args) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String connUrl = "jdbc:sqlserver://localhost:1433;databaseName=TeleHealthDB";  //jdbc:sqlserver://192.168.50.130都不可以空白
			conn = DriverManager.getConnection(connUrl, "sa", "passw0rd");
			String sql = "select licenseNum,pic from drugs where pic <> ? and licenseNum > '衛署藥製字第057200號'";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, "");
			rs = stmt.executeQuery();
			while(rs.next()) {
				String licenceNum = rs.getString(1);
				String jpg = zipWidthHeightImageFile(new File("e:/durgpicsPNG/" + licenceNum + ".png"),new File("e:/PicZip/" + licenceNum + ".jpg"),425,638,0.7f);
				System.out.println("OK = " + jpg);
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
//		zipWidthHeightImageFile(new File("e:\\a\\內衛成製字第000093號.png"),new File("e:\\b\\內衛成製字第000093號.jpg"),425,638,0.7f);
		//zipImageFile(new File("C:\\spider\\2.JPG"),new File("C:\\spider\\2-2.JPG"),425,638,0.7f);
		//zipImageFile(new File("C:\\spider\\3.jpg"),new File("C:\\spider\\3-3.jpg"),425,638,0.7f);
//		System.out.println("ok");
	}
  
    /** 
     * 根據設置的寬高等比例壓縮圖片文件<br> 先保存原文件，再壓縮、上傳 
     * @param oldFile  要進行壓縮的文件 
     * @param newFile  新文件 
     * @param width  寬度 //設置寬度時（高度傳入0，等比例縮放） 
     * @param height 高度 //設置高度時（寬度傳入0，等比例縮放） 
     * @param quality 質量 
     * @return 返回壓縮後的文件的全路徑 
     */  
    public static String zipImageFile(File oldFile,File newFile, int width, int height,float quality) {  
        if (oldFile == null) {  
            return null;  
        }  
        try {  
            /** 對服務器上的臨時文件進行處理 */  
            Image srcFile = ImageIO.read(oldFile);  
            int w = srcFile.getWidth(null);  
            int h = srcFile.getHeight(null);  
            double bili;  
            if(width>0){  
                bili=width/(double)w;  
                height = (int) (h*bili);  
            }else{  
                if(height>0){  
                    bili=height/(double)h;  
                    width = (int) (w*bili);  
                }  
            }  
            
            String srcImgPath = newFile.getAbsoluteFile().toString();
            System.out.println(srcImgPath);
            String subfix = "jpg";
    		subfix = srcImgPath.substring(srcImgPath.lastIndexOf(".")+1,srcImgPath.length());

    		BufferedImage buffImg = null; 
    		if(subfix.equals("png")){
    			buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
    		}else{
    			buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
    		}

    		Graphics2D graphics = buffImg.createGraphics();
    		graphics.setBackground(new Color(255,255,255));
    		graphics.setColor(new Color(255,255,255));
    		graphics.fillRect(0, 0, width, height);
    		graphics.drawImage(srcFile.getScaledInstance(width, height, Image.SCALE_SMOOTH), 0, 0, null);  

    		ImageIO.write(buffImg, subfix, new File(srcImgPath));  
  
        } catch (FileNotFoundException e) {  
            e.printStackTrace();  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
        return newFile.getAbsolutePath();  
    }  
  
    /** 
     * 按設置的寬度高度壓縮圖片文件<br> 先保存原文件，再壓縮、上傳 
     * @param oldFile  要進行壓縮的文件全路徑 
     * @param newFile  新文件 
     * @param width  寬度 
     * @param height 高度 
     * @param quality 質量 
     * @return 返回壓縮後的文件的全路徑 
     */  
	public static String zipWidthHeightImageFile(File oldFile,File newFile, int width, int height,float quality) {  
        if (oldFile == null) {  
            return null;  
        }  
        String newImage = null;  
        try {  
            /** 對服務器上的臨時文件進行處理 */  
            Image srcFile = ImageIO.read(oldFile);  
            
            String srcImgPath = newFile.getAbsoluteFile().toString();
            System.out.println(srcImgPath);
            String subfix = "jpg";
    		subfix = srcImgPath.substring(srcImgPath.lastIndexOf(".")+1,srcImgPath.length());

    		BufferedImage buffImg = null; 
    		if(subfix.equals("png")){
    			buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
    		}else{
    			buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
    		}

    		Graphics2D graphics = buffImg.createGraphics();
    		graphics.setBackground(new Color(255,255,255));
    		graphics.setColor(new Color(255,255,255));
    		graphics.fillRect(0, 0, width, height);
    		graphics.drawImage(srcFile.getScaledInstance(width, height, Image.SCALE_SMOOTH), 0, 0, null);  

    		ImageIO.write(buffImg, subfix, new File(srcImgPath));  
        } catch (FileNotFoundException e) {  
            e.printStackTrace();  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
        return newImage;  
    }  
	
}