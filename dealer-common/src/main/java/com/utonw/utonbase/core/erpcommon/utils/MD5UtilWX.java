package com.utonw.utonbase.core.erpcommon.utils;

import java.security.MessageDigest;


public class MD5UtilWX {

	private static String byteArrayToHexString(byte b[]) {
		StringBuffer resultSb = new StringBuffer();
		for (int i = 0; i < b.length; i++)
			resultSb.append(byteToHexString(b[i]));

		return resultSb.toString();
	}

	private static String byteToHexString(byte b) {
		int n = b;
		if (n < 0)
			n += 256;
		int d1 = n / 16;
		int d2 = n % 16;
		return hexDigits[d1] + hexDigits[d2];
	}

	public static String MD5Encode(String origin, String charsetname) {
		String resultString = null;
		try {
			resultString = new String(origin);
			MessageDigest md = MessageDigest.getInstance("MD5");
			if (charsetname == null || "".equals(charsetname))
				resultString = byteArrayToHexString(md.digest(resultString
						.getBytes()));
			else
				resultString = byteArrayToHexString(md.digest(resultString
						.getBytes(charsetname)));
		} catch (Exception exception) {
		}
		return resultString;
	}

	private static final String hexDigits[] = { "0", "1", "2", "3", "4", "5",
			"6", "7", "8", "9", "a", "b", "c", "d", "e", "f" };
	
	/**
	 * MD5加密将openid转话为9位纯数字
	 * @param source
	 * @return
	 */
	public static String getMD5ToNumStr(byte[] source) {
		  String s = null;
		  char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
		   try
		   {
		    MessageDigest md = MessageDigest.getInstance( "MD5" );
		    md.update( source );
		    byte tmp[] = md.digest(); 
		    char str[] = new char[9];
		    int k = 0;
		    for (int i = 0; i < 9; i++) {
		     byte byte0 = tmp[i];
		    //只取高位 
		    str[k++] = hexDigits[(byte0 >>> 4 & 0xf)%10]; 
		   }
		      s = new String(str);  // 换后的结果转换为字符串
		      String substring = s.substring(0, 1);//截取字符穿首位字母如果为0则在此字符串后补齐
		      if("0".equals(substring)){
		       s=s.substring(1, s.length()); 
		      }
		    }catch( Exception e )
		   {
		       e.printStackTrace();
		   }
		   return s;
		 }
    public final static String getMessageDigest(byte[] buffer) {  
        char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };  
        try {  
            MessageDigest mdTemp = MessageDigest.getInstance("MD5");  
            mdTemp.update(buffer);  
            byte[] md = mdTemp.digest();  
            int j = md.length;  
            char str[] = new char[j * 2];  
            int k = 0;  
            for (int i = 0; i < j; i++) {  
                byte byte0 = md[i];  
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];  
                str[k++] = hexDigits[byte0 & 0xf];  
            }  
            return new String(str);  
        } catch (Exception e) {  
            return null;  
        }  
    }
	
	/*public static void main(String[] args) {
		  String om="ohm_dwhjTz3pt9_BqetasLUikspo"+"5079d3daa31548649b1dbf8db4139f1e";
		  String a = MD5UtilWX.getMD5ToNumStr(om.getBytes());
		  System.out.println(a);
		  Integer valueOf = Integer.valueOf(a);
		  System.err.println(valueOf);
	}*/
	
	public static void main(String[] args) {
		
		byte[] str="\"梧桐汽车\"叫老子车祖宗".getBytes();
		String str2 = "\"梧桐汽车\"叫老子车祖宗";
		//String s1 = StringEscapeUtils.unescapeJava(str);
		String s2 = MD5UtilWX.getMessageDigest(str);
		String s3 = MD5UtilWX.getMD5ToNumStr(str);
		String s4 = MD5UtilWX.MD5Encode(str2, "UTF-8");
	}
}
