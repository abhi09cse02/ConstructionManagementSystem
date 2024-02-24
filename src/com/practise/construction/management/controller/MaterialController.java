package com.practise.construction.management.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.practise.construction.management.bean.Materialbean;
import com.practise.construction.management.bean.Projectfetchbean;
import com.practise.construction.management.utils.DbConUtil;
import com.practise.construction.management.utils.ManageSession;

@Controller
public class MaterialController {

	@RequestMapping("/addmaterial")
	public ModelAndView addMaterial(@RequestParam("pid") String pid, @RequestParam("pname") String pname) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("pid", pid);
		map.put("pname", pname);
		return new ModelAndView("addmaterial", "list", map);
	}

	@SuppressWarnings("unused")
	@RequestMapping(value = "/insertmaterial", method = RequestMethod.GET)
	public ModelAndView insertMaterial(@ModelAttribute("add") Projectfetchbean add, @ModelAttribute("mb") Materialbean mb) {

		try {
			if (ManageSession.checksession()) {
				int total = Integer.parseInt(mb.getUnit()) * Integer.parseInt(mb.getRate());
				Connection con = DbConUtil.getConnection();
				PreparedStatement pre;
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
				LocalDateTime now = LocalDateTime.now();
				String date = dtf.format(now);
				try {
					int balance;
					pre = con.prepareStatement("select balance from project where pid=? ");
					pre.setString(1, add.getPid());
					ResultSet rs = pre.executeQuery();
					while (rs.next()) {
						balance = Integer.parseInt(rs.getString("balance"));
						if ((balance - total) < 0) {
							String message = "<script type=\"text/javascript\">swal ( \"Oops\" ,  \"low balance to add materials!\" ,  \"error\" )</script>";
							Map<String, String> map = new HashMap<String, String>();
							map.put("pid", add.getPid());
							map.put("pname", add.getPname());
							map.put("message", message);
							return new ModelAndView("addmaterial", "list", map);

						}

						balance = balance - total;
						pre = con.prepareStatement("update project set balance=? where pid=?");
						pre.setString(1, String.valueOf(balance));
						pre.setString(2, add.getPid());
						int ii = pre.executeUpdate();
					}

					pre = con.prepareStatement("insert into materials (mname , mdesc , unit , rate , pid , dop , total) values ( ? , ? , ? , ? , ? , ? , ? ) ");
					pre.setString(1, mb.getMname());
					pre.setString(2, mb.getMdesc());
					pre.setString(3, mb.getUnit());
					pre.setString(4, mb.getRate());
					pre.setString(5, add.getPid());
					pre.setString(6, date);
					pre.setString(7, String.valueOf(total));
					System.out.println(String.valueOf(total));
					int i = pre.executeUpdate();

				} catch (Exception e) {
					e.printStackTrace();
				}
				String message = "<script type=\"text/javascript\">swal(\"Good job!\", \"Material added Successfully!\", \"success\")</script>";
				Map<String, String> map = new HashMap<String, String>();
				map.put("pid", add.getPid());
				map.put("pname", add.getPname());
				map.put("message", message);
				return new ModelAndView("addmaterial", "list", map);
			} else {
				return new ModelAndView("index");
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return new ModelAndView("404");
	}
}