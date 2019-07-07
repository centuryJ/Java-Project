package com.oracle.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.entity.Information;
import com.oracle.service.InformationService;


@WebServlet("/addinformationservlet")
public class AddInformationController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		InformationService info = new InformationService();
		SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss"); 
		String time = formatDate.format(new Date());
		String title = req.getParameter("title");
		String context = req.getParameter("context");
		info.addInfo(title,time,context);
		List<Information> infomations = info.getAllInfomation();
		req.setAttribute("infomations", infomations);
		req.getRequestDispatcher("listinformation.jsp").forward(req, resp);
	}

}
