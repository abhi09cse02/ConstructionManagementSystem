package com.practise.construction.management.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.HashMap;
import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.practise.construction.management.bean.Projectfetchbean;
import com.practise.construction.management.bean.Taskbean;
import com.practise.construction.management.utils.DbConUtil;
import com.practise.construction.management.utils.ManageSession;

@Controller
public class TaskController {
	@RequestMapping("/addtask")
	public ModelAndView addTasks(@RequestParam("pid") String pid,@RequestParam("pname") String pname) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("pid",pid);
		map.put("pname", pname);
		return new ModelAndView("addtask","list",map);
	}

	@SuppressWarnings("unused")
	@RequestMapping(value = "/inserttask", method = RequestMethod.GET) 
	public ModelAndView helloWorld(@ModelAttribute("add") Projectfetchbean add ) {  
		  
		 try {
			if(ManageSession.checksession()) 
			 {
				Connection con =DbConUtil.getConnection();
				PreparedStatement pre;
				System.out.println(add.getTaskdesc());
				System.out.println(add.getPid());
				try {
					pre = con.prepareStatement("insert into task (tname , progress , pid) values ( ? , ? , ? ) ");
					pre.setString(1, add.getTaskdesc());
					pre.setString(2, "N");
					pre.setString(3, add.getPid());
					int i=pre.executeUpdate();
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				String message = "<script type=\"text/javascript\">swal(\"Good job!\", \"Task added Successfully!\", \"success\")</script>";
				Map<String, String> map = new HashMap<String, String>();
				map.put("pid",add.getPid());
				map.put("pname", add.getPname());
				map.put("message", message);
				return new ModelAndView("addtask","list",map);
			 }
			 else 
			 {
			   return new ModelAndView("index"); 
			 }
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} 
		 return new ModelAndView("404"); 
   } 
	
	@RequestMapping(value = "/deletetask", method = RequestMethod.GET)
	public ModelAndView deleteTask(@RequestParam("tid") String tid, @RequestParam("pid") String pid) {
		Connection con = DbConUtil.getConnection();
		PreparedStatement pre;
		try {
			pre = con.prepareStatement("delete from task where tid = ? ");
			pre.setString(1, tid);
			pre.executeUpdate();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return new ModelAndView("redirect:showmoreproject.html?pid=" + pid);
	}
	
	@RequestMapping(value = "/taskcomp", method = RequestMethod.GET) 
    public ModelAndView taskComplete(@ModelAttribute("task") Taskbean task, @RequestParam("tid") String tid,@RequestParam("pid") String pid) {  
		Connection con =DbConUtil.getConnection();
		PreparedStatement pre;
		try {
			pre = con.prepareStatement("update task set progress = ? where tid = ? ");
			pre.setString(1, "Y");
			pre.setString(2, task.getTid());
			pre.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return new ModelAndView("redirect:showmoreproject.html?pid="+pid);  
    } 
}