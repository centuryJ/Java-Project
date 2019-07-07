package com.oracle.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.entity.Information;
import com.oracle.entity.News;
import com.oracle.service.NewsService;

@WebServlet("/listnewsservlet")
public class ListBackNewsController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		NewsService ns = new NewsService();
		List<News> news = ns.getAllNews();
		req.setAttribute("news", news);
		req.getRequestDispatcher("listnews.jsp").forward(req, resp);
	}

}
