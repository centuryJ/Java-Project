package com.oracle.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.service.UserService;

@WebServlet(name="register",urlPatterns="/registerservlet")
public class RegisterController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String realname = request.getParameter("realname");
		UserService us = new UserService();
		int count = us.register(username, password, realname);
		if(count > 0){
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

}
