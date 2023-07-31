package kh.test.jdbckh.common.filter.wrapper;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class PasswordWrapper extends HttpServletRequestWrapper {

	public PasswordWrapper(HttpServletRequest request) {
		super(request);
	}
	@Override
	public String getParameter(String name) {
		if(name !=null && name.equals("pwd")) { // request.getParameter("pwd") 가 호출되면
		 name = getSh512(super.getParameter(name)); 
		} else { // request.getParameter("pwd의다른이름") 가 호출되면
			name = super.getParameter(name);
		}
		System.out.println("[ejkim] 암호화후"+name.length()+", "+name);
		return name;
	}
	private String getSh512(String pwd) {
		String result = null;
		// SHA-512 암호메소드
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-512"); //singleson
			byte[] pwdBytes = pwd.getBytes(Charset.forName("UTF-8")); 
				md.update(pwdBytes); // 암호화함.
				result = Base64.getEncoder().encodeToString(pwdBytes); // 88자 String 형태			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
	