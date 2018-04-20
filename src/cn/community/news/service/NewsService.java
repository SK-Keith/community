package cn.community.news.service;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.community.news.dao.NewsDao;
import cn.community.news.domain.News;

public class NewsService {

	private NewsDao newsDao = new NewsDao();

	/*
	 * 查询所有新闻信息
	 */
	public List<News> findAll() {
		try {  
			return newsDao.findAll();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<News> findAll2() {
		try {  
			return newsDao.findAll2();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public News findByNid(String nid) {
		try {
			return newsDao.findByNid(nid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	
	
}
