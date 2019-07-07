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

@WebServlet(name="Deleteusers",urlPatterns="/deleteusersserverlet")
public class DeleteUsersController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserService usrserv = new UserService();
		int uid = Integer.parseInt(request.getParameter("id"));
		usrserv.deleteUserById(uid);
		List<Users> userlist = usrserv.findAllUsers();
		request.setAttribute("listusers", userlist);
		request.getRequestDispatcher("showusers.jsp").forward(request, response);
	}

}
