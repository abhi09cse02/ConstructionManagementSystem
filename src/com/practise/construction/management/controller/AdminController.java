package com.practise.construction.management.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.practise.construction.management.bean.Contractorbean;
import com.practise.construction.management.bean.Employeebean;
import com.practise.construction.management.bean.Projectfetchbean;
import com.practise.construction.management.utils.DbConUtil;
import com.practise.construction.management.utils.ManageSession;

@Controller
public class AdminController {

	@RequestMapping("/projectreport")
	public ModelAndView projectReport() {

		try {
			if (ManageSession.checksession()) {
				List<Projectfetchbean> listOfproject = new ArrayList<Projectfetchbean>();
				Connection con = DbConUtil.getConnection();
				PreparedStatement pre;
				try {
					pre = con.prepareStatement("select * from project ");
					ResultSet rs = pre.executeQuery();
					while (rs.next()) {
						Projectfetchbean proj = new Projectfetchbean();
						proj.setPname(rs.getString("pname"));
						proj.setBalance(rs.getString("balance"));
						proj.setBudget(rs.getString("budget"));
						proj.setCust_addr(rs.getString("cust_addr"));
						proj.setCust_mob(rs.getString("cust_mob"));
						proj.setStart(rs.getString("sdate"));
						proj.setEnd(rs.getString("edate"));
						proj.setCust_name(rs.getString("customer_name"));
						proj.setConid(rs.getString("conid"));
						proj.setPid(rs.getString("pid"));
						listOfproject.add(proj);

					}
				} catch (Exception e) {
					e.printStackTrace();
				}

				return new ModelAndView("projectreport", "list", listOfproject);
			} else {
				return new ModelAndView("index");
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return new ModelAndView("404");
	}

	@RequestMapping("/employeereport")
	public ModelAndView employeeReport() {

		try {
			if (ManageSession.checksession()) {
				List<Employeebean> listofemployee = new ArrayList<Employeebean>();
				Connection con = DbConUtil.getConnection();
				PreparedStatement pre;
				try {
					pre = con.prepareStatement("select * from employee ");
					ResultSet rs = pre.executeQuery();
					while (rs.next()) {
						Employeebean eb = new Employeebean();
						eb.setEmpid(rs.getString("empid"));
						eb.setEmp_name(rs.getString("emp_name"));
						eb.setAddress(rs.getString("address"));
						eb.setDob(rs.getString("dob"));
						eb.setPhone(rs.getString("phone"));

						listofemployee.add(eb);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				return new ModelAndView("employeereport", "list", listofemployee);
			} else {
				return new ModelAndView("index");
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return new ModelAndView("404");
	}

	@RequestMapping("/contractorsreport")
	public ModelAndView contractorsReport() {

		try {
			if (ManageSession.checksession()) {
				List<Contractorbean> listofuser = new ArrayList<Contractorbean>();
				Connection con = DbConUtil.getConnection();
				PreparedStatement pre;
				try {
					pre = con.prepareStatement("select * from contractor_reg ");
					ResultSet rs = pre.executeQuery();
					while (rs.next()) {
						Contractorbean eb = new Contractorbean();
						eb.setConid(rs.getString("conid"));
						eb.setFullname(rs.getString("fullname"));
						eb.setEmail(rs.getString("email"));
						eb.setUsername(rs.getString("username"));
						eb.setMobile(rs.getString("mobile"));

						listofuser.add(eb);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				return new ModelAndView("contractorsreport", "list", listofuser);
			} else {
				return new ModelAndView("index");
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return new ModelAndView("404");
	}
}