package com.practise.construction.management.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import com.practise.construction.management.bean.Login;
import com.practise.construction.management.utils.DbConUtil;
import com.practise.construction.management.utils.ManageSession;

@Controller
@SessionAttributes("user")
public class Indexcontroller {

	@RequestMapping(value = "/verifylogin", method = RequestMethod.POST)
	public ModelAndView verifyLogin(@ModelAttribute("select") Login select, HttpSession session) {
		try {
			if ((select.getEmail().equals("abhi09cse02@gmail.com")) && (select.getPassword().equals("admin"))) {
				String user = "Admin";
				ManageSession.setSession(session);
				ManageSession.getSession().setAttribute("user", user);
				ManageSession.getSession().setAttribute("username", "Admin");
				return new ModelAndView("admin", "user", user);
			} else {
				Connection con = DbConUtil.getConnection();
				PreparedStatement pre = con.prepareStatement("select * from contractor_reg where email= ? ");
				pre.setString(1, select.getEmail());
				ResultSet rs = pre.executeQuery();
				if (rs.next()) {
					if ((rs.getString("email").equals(select.getEmail())) && (rs.getString("password").equals(select.getPassword()))) {
						String user = rs.getString("conid");
						String username = rs.getString("username");
						ManageSession.setSession(session);
						ManageSession.getSession().setAttribute("user", user);
						ManageSession.getSession().setAttribute("username", username);
						return new ModelAndView("dashboard", "user", user);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		String message = "<script type=\"text/javascript\">swal ( \"Oops\" ,  \"email or Password doesnt match!\" ,  \"error\" )</script>";
		return new ModelAndView("index", "message", message);
	}
}