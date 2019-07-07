package com.oracle.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.entity.Information;
import com.oracle.service.InformationService;

@WebServlet("/listinfoservlet")
public class ListBackInformationController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//查询所有的创业动态的信息转发到
		InformationService info = new InformationService();
		List<Information> infomations = info.getAllInfomation();
		req.setAttribute("infomations", infomations);
		req.getRequestDispatcher("listinformation.jsp").forward(req, resp);
	}

}
