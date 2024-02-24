package com.practise.construction.management.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
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
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.practise.construction.management.bean.Employeebean;
import com.practise.construction.management.utils.DbConUtil;
import com.practise.construction.management.utils.ManageSession;

@Controller
public class EmployeeController {

	@SuppressWarnings("unused")
	@RequestMapping(value = "/addemployee", method = RequestMethod.POST)
	public ModelAndView addEmployee(@ModelAttribute("add") Employeebean add, @RequestParam CommonsMultipartFile Image)throws IOException {

		try {
			if (ManageSession.checksession()) {

				String filename = Image.getOriginalFilename();
				System.out.println(Image.getSize());
				System.out.println("E:/upload" + "/" + filename);
				String savepath = "E:/upload" + "/" + filename;
				String filepath = "E:/upload";
				if (Image.isEmpty()) {

				} else {
					byte[] bytes = Image.getBytes();
					BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(filepath + File.separator + filename)));
					stream.write(bytes);
					stream.flush();
					stream.close();

				}
				Connection con = DbConUtil.getConnection();
				PreparedStatement pre;
				System.out.println(add.getEmp_name());

				try {
					pre = con.prepareStatement("insert into employee (emp_name , dob , phone , address , photo , accno ) values ( ? , ? , ? , ? , ? , ? ) ");
					pre.setString(1, add.getEmp_name());
					pre.setString(2, add.getDob());
					pre.setString(3, add.getPhone());
					pre.setString(4, add.getAddress());
					pre.setString(5, savepath);
					pre.setString(6, add.getAccno());
					int i = pre.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
				}
				return new ModelAndView("redirect:employee.html");
			} else {
				return new ModelAndView("index");
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return new ModelAndView("404");
	}

	@RequestMapping("/employee")
	public ModelAndView employee() {

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
						eb.setPhoto(rs.getString("photo"));
						listofemployee.add(eb);
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return new ModelAndView("employee", "list", listofemployee);
			} else {
				return new ModelAndView("index");
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return new ModelAndView("404");
	}

	@RequestMapping(value = "/insertemployee", method = RequestMethod.GET)
	public ModelAndView insertEmployee(@ModelAttribute("add") Employeebean add) {

		try {
			if (ManageSession.checksession()) {
				List<Employeebean> listofemployee = new ArrayList<Employeebean>();
				Connection con = DbConUtil.getConnection();
				PreparedStatement pre;

				try {
					pre = con.prepareStatement("select * from employee");
					ResultSet rs = pre.executeQuery();
					while (rs.next()) {
						Employeebean eb = new Employeebean();
						eb.setEmpid(rs.getString("empid"));
						eb.setEmp_name(rs.getString("emp_name"));
						eb.setAddress(rs.getString("address"));
						eb.setDob(rs.getString("dob"));
						eb.setPhone(rs.getString("phone"));
						eb.setPid(add.getPid());
						System.out.println(add.getPid());
						listofemployee.add(eb);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				return new ModelAndView("insertemployee", "list", listofemployee);
			} else {
				return new ModelAndView("index");
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return new ModelAndView("404");
	}

	@SuppressWarnings("unused")
	@RequestMapping(value = "/empadd", method = RequestMethod.GET)
	public ModelAndView employeeAdd(@ModelAttribute("add") Employeebean add) {

		try {
			if (ManageSession.checksession()) {
				Connection con = DbConUtil.getConnection();
				PreparedStatement pre;

				try {
					pre = con.prepareStatement("select * from employee_set where empid=?  and pid=?");
					pre.setString(1, add.getEmpid());
					pre.setString(2, add.getPid());
					ResultSet rs = pre.executeQuery();
					if (rs.next()) {

					} else {
						pre = con.prepareStatement("insert into employee_set (empid , pid , wage ) values ( ? , ? , ? ) ");
						pre.setString(1, add.getEmpid());
						pre.setString(2, add.getPid());
						pre.setString(3, "500");
						int i = pre.executeUpdate();
						con.close();
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				return new ModelAndView("redirect:insertemployee.html?pid=" + add.getPid() + "&empid=" + add.getEmpid());
			} else {
				return new ModelAndView("index");
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return new ModelAndView("404");
	}

	@SuppressWarnings("unused")
	@RequestMapping(value = "/empremove", method = RequestMethod.GET)
	public ModelAndView employeeRemove(@ModelAttribute("add") Employeebean add) {

		try {
			if (ManageSession.checksession()) {

				Connection con = DbConUtil.getConnection();
				PreparedStatement pre;

				try {
					pre = con.prepareStatement("delete from employee_set where empid= ? and pid = ?");
					pre.setString(1, add.getEmpid1());
					pre.setString(2, add.getPid());

					int i = pre.executeUpdate();
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				return new ModelAndView("redirect:insertemployee.html?pid=" + add.getPid() + "&empid=" + add.getEmpid1());
			} else {
				return new ModelAndView("index");
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return new ModelAndView("404");
	}

	@RequestMapping(value = "/payemp", method = RequestMethod.GET)
	public ModelAndView getEmployeeusingId(@ModelAttribute("add") Employeebean add, @RequestParam("pid") String pid) {

		try {
			if (ManageSession.checksession()) {
				Connection con = DbConUtil.getConnection();
				PreparedStatement pre;
				Employeebean eb = new Employeebean();
				try {
					pre = con.prepareStatement("select * from employee, employee_set where employee.empid=employee_set.empid and employee.empid= ?");
					pre.setString(1, add.getEmpid());
					ResultSet rs = pre.executeQuery();
					while (rs.next()) {

						eb.setEmpid(rs.getString("empid"));
						eb.setEmp_name(rs.getString("emp_name"));
						eb.setAddress(rs.getString("address"));
						eb.setDob(rs.getString("dob"));
						eb.setPhone(rs.getString("phone"));
						eb.setWage(rs.getString("wage"));
						eb.setAccno(rs.getString("accno"));
						eb.setPid(pid);
						System.out.println(rs.getString("empid"));
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				String message = "";
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("eb", eb);
				map.put("message", message);
				return new ModelAndView("selectemp", "list", map);
			} else {
				return new ModelAndView("index");
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return new ModelAndView("404");
	}
}