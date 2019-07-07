package com.oracle.service;

import java.util.List;

import com.oracle.dao.InformationDao;
import com.oracle.dao.NewsDao;
import com.oracle.entity.News;
import com.oracle.entity.PageBean;

public class NewsService {
	public List<News> getAllNews() {
		// TODO Auto-generated method stub
		return NewsDao.getNews();
	}

	public int deleteNewsById(int id) {
		// TODO Auto-generated method stub
		return NewsDao.deleteNews(id);
	}

	public int addnews(String title, String time, String context) {
		// TODO Auto-generated method stub
		return NewsDao.addnnews(title,time,context);	
	}

	public News getNewsById(int id) {
		// TODO Auto-generated method stub
		return NewsDao.getById(id);
	}

	public int updatenews(News nss) {
		return NewsDao.updateN(nss);
	}

	public List<News> getFiveInfos() {
		// TODO Auto-generated method stub
		return NewsDao.getFiveNews();
	}

	public PageBean<News> getNewsPageByParam(int pc, int ps, String title) {
		// TODO Auto-generated method stub
		return NewsDao.getNewsBypage(pc,ps,title);
	}

}
