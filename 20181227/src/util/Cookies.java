package util;

import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Cookies {
	
	private HashMap<String, Cookie> cookieMap =new HashMap<>();
	
	public Cookies(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie c : cookies) {
				cookieMap.put(c.getName(), c);
			}
		}
	}
	
	// Cookie 존재 유무 확인
	public boolean exists(String id) {
		return cookieMap.get(id) != null;
	}
	
	// key 값으로 Cookie 반환
	public Cookie getCookie(String id) {
		return cookieMap.get(id);
	}
	
	// 쿠키에 저장된 실제 id값(value) 반환
	public String getValue(String id) {
		Cookie cookie = cookieMap.get(id);
		return cookie.getValue();
	}
	
	// Cookie 생성
	public static Cookie createCookie(String id, String value, int maxAge) {
		Cookie cookie = new Cookie(id,value);
		cookie.setMaxAge(maxAge);
		return cookie;
	}
	
	// Cookie 삭제
	public void removeCookie(
			HttpServletRequest request, 
			HttpServletResponse response,
			String id) {
		
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie c : cookies) {
				if(c.getName() == id) {
					Cookie cookie = new Cookie(id,"");
					cookie.setMaxAge(0);
					cookieMap.remove(id);
					response.addCookie(cookie);
				}
			}
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
