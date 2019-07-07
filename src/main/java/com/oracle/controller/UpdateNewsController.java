package com.oracle.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.entity.News;
import com.oracle.service.NewsService;

@WebServlet("/updatenewsServlet")
public class UpdateNewsController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		NewsService nsupdate = new NewsService();
		News nss = new News();
		int id = Integer.parseInt(req.getParameter("id"));
		String title = req.getParameter("title");
		String time = req.getParameter("time");
		String context = req.getParameter("context");
		nss.setId(id);
		nss.setTitle(title);
		nss.setTime(time);
		nss.setContext(context);
		
		nsupdate.updatenews(nss);
		
		List<News> news = nsupdate.getAllNews();
		req.setAttribute("news", news);
		req.getRequestDispatcher("listnews.jsp").forward(req, resp);
	}

}
