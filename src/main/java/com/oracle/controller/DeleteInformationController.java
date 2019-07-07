package com.oracle.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.service.InformationService;

@WebServlet("/deleteinformationservlet")
public class DeleteInformationController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//获取参数deleteinfomationservlet?id=${infomation.id }
		int id = Integer.parseInt(req.getParameter("id"));
		//调用业务层
		InformationService is = new InformationService();
		is.deleteInfoById(id);
		//获取删除后的最新数据
		req.setAttribute("infomations", is.getAllInfomation());
		req.getRequestDispatcher("listinformation.jsp").forward(req, resp);
		
	}

}
