package com.oracle.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.entity.Employee;
import com.oracle.service.EmployeeService;

@WebServlet("/employeelisserverlet")
public class EmployeeListController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		EmployeeService es = new EmployeeService();
		List<Employee> employees = es.findAllEmployee();
		req.setAttribute("employees", employees);
		req.getRequestDispatcher("employeelist.jsp").forward(req, resp);
	}

}
