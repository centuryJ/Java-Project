package com.oracle.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.entity.News;
import com.oracle.service.NewsService;

@WebServlet("/preupdatenewsservlet")
public class PreUpdateNewsController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		NewsService nsser =  new NewsService();
		int id = Integer.parseInt(req.getParameter("id"));
		News nss = nsser.getNewsById(id);
		req.setAttribute("nss", nss);
		req.getRequestDispatcher("updatenews.jsp").forward(req, resp);
	}

}
