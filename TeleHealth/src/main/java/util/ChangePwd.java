package util;

public class ChangePwd {
	public static String GoPwd(){
	    
		char[] codeData=new char[6];
		  int codeSelect;
		  int code = 0;
		  String videoCode=null;
		  for(int i =0;i<codeData.length;i++) {
		   codeSelect=(int)(Math.random()*9+1);
		   if(codeSelect<=3) {
		    code=(int)(Math.random()*10+48);
		   }else if(codeSelect>3&&codeSelect<=6) {
		    code=(int)(Math.random()*26+65);
		   }else {
		    code=(int)(Math.random()*26+97);
		   }  
		   codeData[i]=(char)code;
		   videoCode=String.valueOf(codeData, 0, 6);
		  }
		return videoCode;
	  }
}