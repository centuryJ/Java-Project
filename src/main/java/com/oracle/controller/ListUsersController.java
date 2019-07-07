package com.oracle.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.entity.Users;
import com.oracle.service.UserService;

@WebServlet(name="listusers",urlPatterns="/listusersserverlet")
public class ListUsersController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserService usrser = new UserService();
		List<Users> userlist = usrser.findAllUsers();
		request.setAttribute("listusers", userlist);
		request.getRequestDispatcher("showusers.jsp").forward(request, response);
	}
	
}
