package com.practise.construction.management.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.practise.construction.management.bean.Registration;
import com.practise.construction.management.utils.DbConUtil;

@Controller
public class Registercontroller {

	@SuppressWarnings("unused")
	@RequestMapping(value = "/saveReg", method = RequestMethod.POST)
	public ModelAndView saveRegistration(@ModelAttribute("select") Registration select) {
		try {
			Connection con = DbConUtil.getConnection();
			System.out.println(select.getEmail());
			System.out.println("Connection: " + con);

			PreparedStatement pre = con.prepareStatement("select * from contractor_reg where email= ? or mobile =? or username = ?");
			pre.setString(1, select.getEmail());
			pre.setString(2, select.getMobile());
			pre.setString(3, select.getUsername());
			ResultSet rs = pre.executeQuery();
			if (rs.next()) {
				if (rs.getString("email").equals(select.getEmail())) {
					String message = "<script type=\"text/javascript\">swal ( \"Oops\" ,  \"user already exist!\" ,  \"error\" )</script>";
					return new ModelAndView("registration", "message", message);
				}
				if (rs.getString("mobile").equals(select.getMobile())) {
					String message = "<script type=\"text/javascript\">swal ( \"Oops\" ,  \"mobile already exist!\" ,  \"error\" )</script>";
					return new ModelAndView("registration", "message", message);
				}
				if (rs.getString("username").equals(select.getUsername())) {
					String message = "<script type=\"text/javascript\">swal ( \"Oops\" ,  \"username already exist!\" ,  \"error\" )</script>";
					return new ModelAndView("registration", "message", message);
				}

			} else if (!select.getPassword().equals(select.getCpassword())) {
				String message = "<script type=\"text/javascript\">swal ( \"Oops\" ,  \"Password doesnt match!\" ,  \"error\" )</script>";
				return new ModelAndView("registration", "message", message);
			} else {

				// should validate confirm password
				PreparedStatement pre1 = con.prepareStatement("insert into contractor_reg (fullname , username , mobile , email , password) values ( ? , ? , ? , ? , ? )");
				pre1.setString(1, select.getName());
				pre1.setString(2, select.getUsername());
				pre1.setString(3, select.getMobile());
				pre1.setString(4, select.getEmail());
				pre1.setString(5, select.getPassword());

				int i = pre1.executeUpdate();
				System.out.println(select.getEmail() + select.getUsername() + select.getMobile() + select.getEmail()
						+ select.getPassword());
				String message = "<script type=\"text/javascript\">swal(\"Good job!\", \"You have Registered Successfully!\", \"success\")</script>";
				return new ModelAndView("index", "message", message);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return new ModelAndView("registration", "select", select);// will redirect to viewemp
		// request mapping
	}
}
