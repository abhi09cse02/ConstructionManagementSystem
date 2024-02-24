package com.practise.construction.management.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.practise.construction.management.utils.ManageSession;
@Controller

public class RouteController {
	HttpServletRequest request;
	HttpServletResponse response;
	HttpSession session;

	@RequestMapping("/admin")
	public ModelAndView admin() {
		return new ModelAndView("admin");
	}

	@RequestMapping("/registration")
	public ModelAndView registration() {
		return new ModelAndView("registration");
	}

	@RequestMapping("/vieweamp")
	public ModelAndView viewEmployee() {
		return new ModelAndView("visewemp");
	}

	@RequestMapping("/uploadpage")
	public ModelAndView uploadPage() {
		return new ModelAndView("uploadpage");
	}

	@RequestMapping("/redirectthis")
	public ModelAndView redirectthis() {
		return new ModelAndView("redirect:project.html");
	}

	@RequestMapping("/index")
	public ModelAndView index() {
		return new ModelAndView("index");
	}

	@RequestMapping("/dashboard")
	public ModelAndView dashboard() throws Exception {
		if (ManageSession.checksession()) {
			return new ModelAndView("dashboard");
		} else {
			return new ModelAndView("index");
		}
	}

	@RequestMapping("/addproject")
	public ModelAndView addproject() throws Exception {
		if (ManageSession.checksession()) {
			return new ModelAndView("addproject");
		} else {
			return new ModelAndView("index");
		}
	}

	@RequestMapping("/newtest")
	public ModelAndView newtest() throws Exception {
		if (ManageSession.checksession()) {
			return new ModelAndView("newtest");
		} else {
			return new ModelAndView("index");
		}
	}

	@RequestMapping("/newemployee")
	public ModelAndView newemployee() throws Exception {
		if (ManageSession.checksession()) {
			return new ModelAndView("addemployee");
		} else {
			return new ModelAndView("index");
		}
	}
}