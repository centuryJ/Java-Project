package com.oracle.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.entity.Employee;
import com.oracle.entity.PageBean;
import com.oracle.service.EmployeeService;

@WebServlet("/searchemployeeServlet")
public class SearchEmployeeController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		
		//接收请求查询参数 ，标题
		String name = request.getParameter("name");

		// 获得请求的页面数,第一次请求默认设置为第一页
		String s = request.getParameter("pc");
		if (s == null || s.trim().isEmpty()) {
			s = "1";
		}
		int pc = Integer.valueOf(s);
		
		// 给定ps的值，每页显示的行数
		int ps = 5;

		PageBean<Employee> pb = null;
		if (name == null) {// 查询所有员工
			pb = new EmployeeService().getEmployeePageByParam(pc, ps,null);
		}else{
			String nameParam = "%"+name+"%";
			pb = new EmployeeService().getEmployeePageByParam(pc, ps, nameParam);
			//转发到页面
			request.setAttribute("name", name);
		}
		request.setAttribute("pb", pb);
		request.getRequestDispatcher("searchemployee.jsp").forward(request, response);
	}
	
	

}

