package com.practise.construction.management.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.practise.construction.management.bean.Employeebean;
import com.practise.construction.management.bean.Materialbean;
import com.practise.construction.management.bean.Projectfetchbean;
import com.practise.construction.management.bean.Taskbean;
import com.practise.construction.management.utils.DbConUtil;
import com.practise.construction.management.utils.ManageSession;

@Controller
public class ProjectController {

	@RequestMapping("/project")
	public ModelAndView project() {

		try {
			if (ManageSession.checksession()) {
				List<Projectfetchbean> listOfproject = new ArrayList<Projectfetchbean>();
				Connection con = DbConUtil.getConnection();
				System.out.println((String) ManageSession.getSession().getAttribute("user"));
				PreparedStatement pre;
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
				String message ="";
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("emp",listOfproject);
				map.put("message",message );
				return new ModelAndView("project", "list", map);
				
			} else {
				return new ModelAndView("index");
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return new ModelAndView("404");
	}

	@SuppressWarnings("unused")
	@RequestMapping(value = "/showmoreproject", method = RequestMethod.GET)
	public ModelAndView showMoreProjectDetails(@ModelAttribute("show") Projectfetchbean show) {
		Connection con = DbConUtil.getConnection();
		PreparedStatement pre, pre1, pre2, pre3, pre4;
		Projectfetchbean proj = new Projectfetchbean();

		try {
			pre = con.prepareStatement("select * from project where pid = ? ");
			pre.setString(1, show.getPid());
			ResultSet rs = pre.executeQuery();

			while (rs.next()) {
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

				pre1 = con.prepareStatement("select * from task where pid = ? and progress = ? ");
				pre1.setString(1, show.getPid());
				pre1.setString(2, "Y");
				ResultSet rs1 = pre1.executeQuery();
				ArrayList<Taskbean> tasks1 = new ArrayList<Taskbean>();
				while (rs1.next()) {
					Taskbean task1 = new Taskbean();
					task1.setPid(rs1.getString("pid"));
					task1.setProgress(rs1.getString("progress"));
					task1.setTid(rs1.getString("tid"));
					task1.setTname(rs1.getString("tname"));
					tasks1.add(task1);
				}
				proj.setTasks1(tasks1);

				pre2 = con.prepareStatement("select * from task where pid = ? and progress = ? ");
				pre2.setString(1, show.getPid());
				pre2.setString(2, "N");
				ResultSet rs2 = pre2.executeQuery();
				ArrayList<Taskbean> tasks2 = new ArrayList<Taskbean>();
				while (rs2.next()) {
					Taskbean task = new Taskbean();
					task.setPid(rs2.getString("pid"));
					task.setProgress(rs2.getString("progress"));
					task.setTid(rs2.getString("tid"));
					task.setTname(rs2.getString("tname"));

					tasks2.add(task);

				}
				proj.setTasks2(tasks2);

				pre3 = con.prepareStatement("select * from materials where pid = ?");
				pre3.setString(1, show.getPid());
				ResultSet rs3 = pre3.executeQuery();
				ArrayList<Materialbean> mb = new ArrayList<Materialbean>();
				while (rs3.next()) {
					Materialbean collector = new Materialbean();
					collector.setPid(rs3.getString("pid"));
					collector.setMid(rs3.getString("mid"));
					collector.setMname(rs3.getString("mname"));
					collector.setMdesc(rs3.getString("mdesc"));
					collector.setUnit(rs3.getString("unit"));
					collector.setRate(rs3.getString("rate"));

					mb.add(collector);

				}
				proj.setMaterial1(mb);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("showproject", "list", proj);
	}

	@RequestMapping(value = "/deleteproject", method = RequestMethod.GET)
	public ModelAndView deleteProject(@RequestParam("pid") String pid) {
		Connection con = DbConUtil.getConnection();
		PreparedStatement pre;
		try {
			pre = con.prepareStatement("delete from project where pid = ? ");
			pre.setString(1, pid);
			pre.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("redirect:project.html");
	}

	@RequestMapping(value = "/viewemp", method = RequestMethod.GET)
	public ModelAndView viewEmployee(@RequestParam("pid") String pid) {
		Connection con = DbConUtil.getConnection();
		PreparedStatement pre;
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
		String message="";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pid",pid);
		map.put("emp",proj);
		map.put("message",message );
		return new ModelAndView("viewemp", "list",map);
	}

	@SuppressWarnings("unused")
	@RequestMapping(value = "/addingprojectinfo", method = RequestMethod.POST)
	public ModelAndView addingProjectInfo(@ModelAttribute("add") Projectfetchbean add) {

		try {
			Connection con = DbConUtil.getConnection();
			PreparedStatement pre = con.prepareStatement("select * from project where pname= ? or cust_mob= ?");
			pre.setString(1, add.getPname());
			pre.setString(2, add.getCust_mob());
			ResultSet rs = pre.executeQuery();
			if (rs.next()) {
				if (rs.getString("pname").equals(add.getPname())) {
					String message ="<script type=\"text/javascript\">swal ( \"Oops\" ,  \"project name already taken!\" ,  \"error\" )</script>";
					return new ModelAndView("addproject", "message", message);
				}
				if (rs.getString("cust_mob").equals(add.getCust_mob())) {
					String message ="<script type=\"text/javascript\">swal ( \"Oops\" ,  \"mobile number exists!\" ,  \"error\" )</script>";
					return new ModelAndView("addproject", "message", message);
				}
			} else {
				String conid = (String) ManageSession.getSession().getAttribute("user");
				PreparedStatement pre1 = con.prepareStatement("insert into project (pname , conid , customer_name , cust_mob , cust_addr , budget , sdate , edate , balance) values ( ? , ? , ? , ? , ? , ? , ? , ? , ? )");
				pre1.setString(1, add.getPname());
				pre1.setString(2, conid);
				pre1.setString(3, add.getCust_name());
				pre1.setString(4, add.getCust_mob());
				pre1.setString(5, add.getCust_addr());
				pre1.setString(6, add.getBudget());
				pre1.setString(7, add.getStart());
				pre1.setString(8, add.getEnd());
				pre1.setString(9, add.getBudget());

				int i = pre1.executeUpdate();
				System.out.println(add.getCust_name());
				String message = "<script type=\"text/javascript\">swal(\"Good job!\", \"You have Registered Successfully!\", \"success\")</script>";
				return new ModelAndView("redirect:project.html", "message", message);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("404", "add", add);
	}
}