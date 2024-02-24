package com.practise.construction.management.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.practise.construction.management.bean.Employeebean;
import com.practise.construction.management.bean.Projectfetchbean;
import com.practise.construction.management.utils.DbConUtil;
import com.practise.construction.management.utils.ManageSession;

@Controller
public class PaymentController {

	@RequestMapping(value = "/paythem", method = RequestMethod.GET)
	public ModelAndView paythem(@RequestParam("empid") String empid, @RequestParam("pid") String pid) {

		try {
			if (ManageSession.checksession()) {
				Map<String, String> map = new HashMap<String, String>();
				map.put("empid", empid);
				map.put("pid", pid);
				return new ModelAndView("payment", "map", map);
			} else {
				return new ModelAndView("index");
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return new ModelAndView("404");
	}

	@SuppressWarnings("unused")
	@RequestMapping(value = "/paid", method = RequestMethod.GET)
	public ModelAndView addEmployeePayment(@RequestParam("empid") String empid, @RequestParam("pid") String pid) {

		try {
			if (ManageSession.checksession()) {
				Connection con = DbConUtil.getConnection();
				PreparedStatement pre;

				try {
					int balance;
					pre = con.prepareStatement("select balance from project where pid=? ");
					pre.setString(1, pid);
					ResultSet rs = pre.executeQuery();
					while (rs.next()) {
						balance = Integer.parseInt(rs.getString("balance"));
						if ((balance - 500) < 0) {

							Projectfetchbean proj = new Projectfetchbean();
							try {
								pre = con.prepareStatement("select employee.empid,emp_name,dob,address, phone,photo from employee,employee_set,project where employee.empid =employee_set.empid and employee_set.pid = project.pid and project.pid= ? ");
								pre.setString(1, pid);
								ResultSet rs4 = pre.executeQuery();
								ArrayList<Employeebean> eb = new ArrayList<Employeebean>();
								while (rs4.next()) {
									Employeebean collectemp = new Employeebean();
									collectemp.setEmpid(rs4.getString("empid"));
									collectemp.setEmp_name(rs4.getString("emp_name"));
									collectemp.setDob(rs4.getString("dob"));
									collectemp.setAddress(rs4.getString("address"));
									collectemp.setPhone(rs4.getString("phone"));
									collectemp.setPhoto(rs4.getString("photo"));
									collectemp.setPid(pid);
									eb.add(collectemp);
								}
								proj.setEmp1(eb);
							} catch (Exception e) {
								e.printStackTrace();
							}
							String message = "<script type=\"text/javascript\">swal ( \"Oops\" ,  \"low balance to Pay employees!\" ,  \"error\" )</script>";
							Map<String, Object> map = new HashMap<String, Object>();
							map.put("pid", pid);
							map.put("emp", proj);
							map.put("message", message);
							return new ModelAndView("viewemp", "list", map);

						}
						balance = balance - 500;
						pre = con.prepareStatement("update project set balance=? where pid=?");
						pre.setString(1, String.valueOf(balance));
						pre.setString(2, pid);
						int ii = pre.executeUpdate();
					}

					Date dNow = new Date();
					SimpleDateFormat ft = new SimpleDateFormat("yyyy.MM.dd");

					String date = ft.format(dNow);
					pre = con.prepareStatement("insert into payment (empid ,pid ,date, amount ) values ( ? , ? ,? , ?) ");
					pre.setString(1, empid);
					pre.setString(2, pid);
					pre.setString(3, date);
					pre.setString(4, "500");
					int i = pre.executeUpdate();

				} catch (Exception e) {
					e.printStackTrace();
				}
				List<Projectfetchbean> listOfproject = new ArrayList<Projectfetchbean>();
				try {

					pre = con.prepareStatement("select * from project where conid= ?");
					pre.setString(1, (String) ManageSession.getSession().getAttribute("user"));
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
				String message = "";
				Map<String, Object> map = new HashMap<String, Object>();
				message = "<script type=\"text/javascript\">swal(\"Good job!\", \"Payment Successfully!\", \"success\")</script>";
				map.put("emp", listOfproject);
				map.put("message", message);
				return new ModelAndView("project", "list", map);
			} else {
				return new ModelAndView("index");
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return new ModelAndView("404");
	}
}