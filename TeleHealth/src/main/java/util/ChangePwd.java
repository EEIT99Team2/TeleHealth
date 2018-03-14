package util;

public class ChangePwd {
	public static String getNewRandomPwd(){
	    
		char[] codeData=new char[8];
		  int codeSelect;
		  int code = 0;
		  String videoCode=null;
		  for(int i =0;i<codeData.length;i++) {
		   codeSelect=(int)(Math.random()*9+1);
		   if(codeSelect<=3) {
		    code=(int)(Math.random()*10+48);
		   }else if(codeSelect>3&&codeSelect<=8) {
		    code=(int)(Math.random()*26+65);
		   }else {
		    code=(int)(Math.random()*26+97);
		   }  
		   codeData[i]=(char)code;
		   videoCode=String.valueOf(codeData, 0, 8);
		  }
		return videoCode;
	  }
}
