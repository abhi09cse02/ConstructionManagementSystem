package com.practise.construction.management.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.practise.construction.management.utils.ManageSession;

@Controller
public class Logout {

	@RequestMapping("/logout")
	public ModelAndView logout() throws Exception {
		if (ManageSession.checksession()) {
			ManageSession.getSession().invalidate();
			return new ModelAndView("index");
		}
		return new ModelAndView("404");
	}
}