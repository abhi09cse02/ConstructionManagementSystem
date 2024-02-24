package com.practise.construction.management.utils;

import javax.servlet.http.HttpSession;

public class ManageSession {
	static HttpSession session;
	public static HttpSession getSession() {
		return session;
	}

	public static void setSession(HttpSession session) {
		ManageSession.session = session;
	}
	public static boolean checksession() throws Exception {
		 try {

		 if(ManageSession.getSession().getAttribute("user")!=null) {
			 return true;
		 }
		 else
			 return false;
		 }
		 catch(Exception e) {
			 e.printStackTrace();
		 }
		return false;
	}

}
