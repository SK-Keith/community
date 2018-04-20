package cn.community.news.web.servlet;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.community.base.baseServlet;
import cn.community.news.domain.News;
import cn.community.news.service.NewsService;

public class NewsServlet extends baseServlet {
	private static final long serialVersionUID = 1L;
	private NewsService newsService = new NewsService();
	
	/*
	 * 查询前两条新闻  
	 */
	public String findAll(HttpServletRequest req, HttpServletResponse resp){
		List<News> news =  newsService.findAll();
		req.setAttribute("news", news);
		return "f:/jsps/login/Index_Pro.jsp";
	}

	/*
	 * 查询全部新闻  
	 */
	public String findAll2(HttpServletRequest req, HttpServletResponse resp){
		List<News> news =  newsService.findAll2();
		req.setAttribute("news", news);
		return "f:/jsps/news/index.jsp";
	}
	
	public String findByNid(HttpServletRequest req, HttpServletResponse resp){
		String nid = req.getParameter("nid");
		News news = newsService.findByNid(nid);
		req.setAttribute("news", news);
		return "f:/jsps/news/index1.jsp";
	}
}
