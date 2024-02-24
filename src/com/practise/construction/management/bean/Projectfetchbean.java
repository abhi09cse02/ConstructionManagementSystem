package com.practise.construction.management.bean;


import java.util.ArrayList;

public class Projectfetchbean {
String pname,cust_name,budget,start,end,cust_addr,cust_mob,balance,pid,conid,taskdesc;
ArrayList<Taskbean> tasks1 , tasks2;
ArrayList<Materialbean> material1;
ArrayList<Employeebean> emp1;

public ArrayList<Employeebean> getEmp1() {
	return emp1;
}

public void setEmp1(ArrayList<Employeebean> emp1) {
	this.emp1 = emp1;
}

public ArrayList<Materialbean> getMaterial1() {
	return material1;
}

public void setMaterial1(ArrayList<Materialbean> material1) {
	this.material1 = material1;
}

public ArrayList<Taskbean> getTasks1() {
	return tasks1;
}

public void setTasks1(ArrayList<Taskbean> tasks) {
	this.tasks1 = tasks;
}

public ArrayList<Taskbean> getTasks2() {
	return tasks2;
}

public void setTasks2(ArrayList<Taskbean> tasks) {
	this.tasks2 = tasks;
}

public String getTaskdesc() {
	return taskdesc;
}

public void setTaskdesc(String taskdesc) {
	this.taskdesc = taskdesc;
}

public String getPid() {
	return pid;
}

public void setPid(String pid) {
	this.pid = pid;
}

public String getConid() {
	return conid;
}

public void setConid(String conid) {
	this.conid = conid;
}

public String getPname() {
	return pname;
}

public void setPname(String pname) {
	this.pname = pname;
}

public String getCust_name() {
	return cust_name;
}

public void setCust_name(String cust_name) {
	this.cust_name = cust_name;
}

public String getBudget() {
	return budget;
}

public void setBudget(String budget) {
	this.budget = budget;
}

public String getStart() {
	return start;
}

public void setStart(String start) {
	this.start = start;
}

public String getEnd() {
	return end;
}

public void setEnd(String end) {
	this.end = end;
}

public String getCust_addr() {
	return cust_addr;
}

public void setCust_addr(String cust_addr) {
	this.cust_addr = cust_addr;
}

public String getCust_mob() {
	return cust_mob;
}

public void setCust_mob(String cust_mob) {
	this.cust_mob = cust_mob;
}

public String getBalance() {
	return balance;
}

public void setBalance(String balance) {
	this.balance = balance;
}
}
