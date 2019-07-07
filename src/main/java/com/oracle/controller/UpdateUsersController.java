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

@WebServlet(name="updateusers",urlPatterns="/updateusersserverlet")
public class UpdateUsersController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int id = Integer.parseInt(req.getParameter("id"));
		String username = req.getParameter("username");
		String realname = req.getParameter("realname");
		String password = req.getParameter("password");
		
		Users users = new Users();
		users.setId(id);
		users.setUsername(username);
		users.setPassword(password);
		users.setRealname(realname);
		
		UserService us = new UserService();
		//修改用户传递的参数为实体类Users
		int count = us.updateUserById(users);
		List<Users> userlist = us.findAllUsers();
		req.setAttribute("listusers", userlist);
		req.getRequestDispatcher("showusers.jsp").forward(req, resp);
	}

	
}
