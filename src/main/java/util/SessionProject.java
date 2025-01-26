package util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class SessionProject {
	
	public void saveSessionString(HttpServletRequest request, String key, String value) {
		HttpSession session = request.getSession();
		session.setAttribute(key, value);
 	}
	
	public void saveSessionInt(HttpServletRequest request, String key, int cod) {
		HttpSession session = request.getSession();
		session.setAttribute(key, cod);
	}
	public void saveSessionDouble(HttpServletRequest request, String key, double cod) {
		HttpSession session = request.getSession();
		session.setAttribute(key, cod);
	}
	
	public void saveSessionTimeOut(HttpServletRequest request, int time) {
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(time);
	}
	
	public void invalidateSession(HttpServletRequest request) {
		request.getSession().invalidate();
	}


}
