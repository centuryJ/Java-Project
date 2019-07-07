package com.oracle.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.entity.Employee;
import com.oracle.service.EmployeeService;
//视图层login.jsp 讲参数传递给控制器
//创建servlet 控制器,注解
@WebServlet(name="backlogin",urlPatterns="/backloginservlet")
public class BackLoginController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//处理中文乱码
		request.setCharacterEncoding("utf-8");
		//获取页面login.jsp传递的参数
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		//控制器访问业务层
		EmployeeService es = new EmployeeService();
		Employee emp = es.login(name, password);
		if(emp!=null){
			request.getSession().setAttribute("emp", emp);
			request.getRequestDispatcher("backframe.jsp").forward(request, response);

		}else{
			request.setAttribute("info", "员工账号或密码错误");
			request.getRequestDispatcher("backlogin.jsp").forward(request, response);
		}
		
	}
	
	

}

