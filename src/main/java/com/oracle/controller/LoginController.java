package com.oracle.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.entity.Users;
import com.oracle.service.UserService;
//视图层login.jsp 讲参数传递给控制器
//创建servlet 控制器,注解
@WebServlet(name="login",urlPatterns="/loginservlet")
public class LoginController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//处理中文乱码
		request.setCharacterEncoding("utf-8");
		//获取页面login.jsp传递的参数
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println("测试参数是否正确");
		System.out.println(username + password);
		//控制器访问业务层
		UserService us = new UserService();
		Users u = us.login(username, password);
		if(u!=null){
			request.getSession().setAttribute("u", u);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}else{
			request.setAttribute("info", "用户账号或密码错误");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
	}
	
	

}
