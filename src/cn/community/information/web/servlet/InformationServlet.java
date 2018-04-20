package cn.community.information.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.community.base.baseServlet;
import cn.community.information.domain.Information;
import cn.community.information.service.InformationService;
import cn.community.news.domain.News;

public class InformationServlet extends baseServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private InformationService informationService = new InformationService();
	
	/*
	 * 查询最新的新闻  
	 */
	public String findAll(HttpServletRequest req, HttpServletResponse resp){
		List<Information> information =  informationService.findAll();
		req.setAttribute("information", information);
		return "f:/jsps/login/AJY-Pro.jsp";
	}
	
	public String findAll2(HttpServletRequest req, HttpServletResponse resp){
		List<Information> information =  informationService.findAll2();
		req.setAttribute("information", information);
		return "f:/jsps/information/index.jsp";
	}
	
	public String findByIid(HttpServletRequest req, HttpServletResponse resp){
		String iid = req.getParameter("iid");
		Information information = informationService.findByNid(iid);
		req.setAttribute("information", information);
		return "f:/jsps/information/index2.jsp";
	}
}
