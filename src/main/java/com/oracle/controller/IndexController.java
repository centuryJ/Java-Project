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
import com.oracle.service.InformationService;
import com.oracle.service.NewsService;

@WebServlet("/indexservlet")
public class IndexController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//获取创业动态的数据
		//获取优秀项目的数据
		//获取创业政策的数据
		NewsService ns1 = new NewsService();
		List<News> nw = ns1.getFiveInfos();
		req.getSession().setAttribute("nws", nw);
		//只获取钱五条数据
		InformationService is = new InformationService();
		List<Information> infos = is.getFiveInfos();
		req.getSession().setAttribute("infos", infos);
		req.getRequestDispatcher("index.jsp").forward(req, resp);
	}

}

