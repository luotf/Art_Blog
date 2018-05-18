package com.luotf.util;

import java.security.MessageDigest;

/**
 * 
 */
public class CipherUtil {

	private final static String[] hexDigits = { "0", "1", "2", "3", "4", "5",
			"6", "7", "8", "9", "a", "b", "c", "d", "e", "f" };

	/**
	 * cipher password
	 * 
	 * @param inputString
	 * @return
	 */
	public static String generatePassword(String inputString) {
		return encodeByMD5(inputString);
	}

	/**
	 * validate password
	 * 
	 * @param password
	 * @param inputString
	 * @return
	 */
	public static boolean validatePassword(String password, String inputString) {
		if (password.equals(encodeByMD5(inputString))) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * encode
	 * 
	 * @param originString
	 * @return
	 */
	private static String encodeByMD5(String originString) {
		if (originString != null) {
			try {
				MessageDigest md = MessageDigest.getInstance("MD5");
				byte[] results = md.digest(originString.getBytes());
				String resultString = byteArrayToHexString(results);
				return resultString.toUpperCase();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		return null;
	}

	/**
	 * change the Byte[] to hex string
	 * 
	 * @param b
	 * @return
	 */
	private static String byteArrayToHexString(byte[] b) {
		StringBuffer resultSb = new StringBuffer();
		for (int i = 0; i < b.length; i++) {
			resultSb.append(byteToHexString(b[i]));
		}
		return resultSb.toString();
	}

	/**
	 * change a byte to hex string
	 * 
	 * @param b
	 * @return
	 */
	private static String byteToHexString(byte b) {
		int n = b;
		if (n < 0)
			n = 256 + n;
		int d1 = n / 16;
		int d2 = n % 16;
		return hexDigits[d1] + hexDigits[d2];
	}
	
	public static void main(String[] args) {
		String pwd1 = "123456";
		String pwd2 = "";
		CipherUtil cipher = new CipherUtil();
		System.out.println("加密�?" + pwd1);
		
		pwd2 = cipher.generatePassword(pwd1);
		System.out.println("加密�?" + pwd2);

		System.out.print("验证:");
		if (cipher.validatePassword(pwd2, "admin")) {
			System.out.println("正确");
		} else {
			System.out.println("错误");
		}
	}
}