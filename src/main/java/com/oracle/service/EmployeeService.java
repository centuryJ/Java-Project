package com.oracle.service;

import java.util.List;

import com.oracle.dao.EmployeeDao;
import com.oracle.dao.UserDao;
import com.oracle.entity.Employee;
import com.oracle.entity.PageBean;

public class EmployeeService {
	EmployeeDao dao = new  EmployeeDao();
	public List<Employee> findAllEmployee() {
		// TODO Auto-generated method stub
		return dao.getEmployees();
	}
	public Employee login(String name, String password) {
		return dao.login(name, password);
	}
	public PageBean<Employee> getEmployeePageByParam(int pc, int ps, String name) {
		// TODO Auto-generated method stub
		return dao.getUserBypage(pc,ps,name);
	}

}
