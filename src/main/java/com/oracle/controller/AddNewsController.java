package com.oracle.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.entity.News;
import com.oracle.service.NewsService;

@WebServlet("/addnewsservlet")
public class AddNewsController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		NewsService newsser = new NewsService();
		SimpleDateFormat formate = new SimpleDateFormat();
		String time = formate.format(new Date());
		String title = req.getParameter("title");
		String context = req.getParameter("context");
		newsser.addnews(title,time,context);
		List<News> news = newsser.getAllNews();
		req.setAttribute("news", news);
		req.getRequestDispatcher("listnews.jsp").forward(req, resp);
	}
	

}
