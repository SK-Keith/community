package cn.community.user.web.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.community.base.baseServlet;
import cn.community.information.domain.Information;
import cn.community.information.service.InformationService;
import cn.community.news.domain.News;
import cn.community.news.service.NewsService;
import cn.community.tool.CommonUtils;
import cn.community.user.domain.User;
import cn.community.user.service.UserService;
import cn.community.user.service.exception.UserException;

public class UserServlet extends baseServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UserService userService = new UserService();
	private NewsService newsService = new NewsService();
	private InformationService informationService = new InformationService();
	
	/**
	 * ajax用户名是否注册校验
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String ajaxValidateLoginname(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1.获取用户名
		 */
		String loginname = req.getParameter("loginname");
		/*
		 * 2.通过service得到校验结果
		 */  
		boolean b = userService.ajaxValidateLoginname(loginname);
		/*
		 * 3.返回客户端
		 */
		resp.getWriter().print(b);
		
		return null;
	}
	
	/**
	 * ajax Email是否注册校验
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String ajaxValidateEmail(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1.获取Email
		 */
		String email = req.getParameter("email");
		/*
		 * 2.通过service得到校验结果
		 */
		boolean b = userService.ajaxValidateEmail(email);
		/*
		 * 3.返回客户端
		 */
		resp.getWriter().print(b);
		return null;
	}
	
	/**
	 * ajax 验证码是否注册校验
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String ajaxValidateVerifyCode(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1.获取输入框中的验证码
		 */
		String verifyCode = req.getParameter("verifyCode");
		/*   
		 * 2.获取图片上真实的验证码
		 */
		String vcode = (String) req.getSession().getAttribute("vCode");
		/*
		 * 3.进行忽略大小写比较，得到结果
		 */
		boolean b = verifyCode.equalsIgnoreCase(vcode);
		/*
		 * 4.发送客户端
		 */
		resp.getWriter().print(b);
		return null;
	}
	
	/**
	 * 注册功能
	 * @param req
	 * @param resp
	 * @return
	 */
	public String regist(HttpServletRequest req, HttpServletResponse resp){
		System.out.println("11");
		/*
		 * 1. 封装表单数据到User对象
		 */
		User formUser = CommonUtils.toBean(req.getParameterMap(), User.class);
		/*
		 * 2. 校验之, 如果校验失败，保存错误信息，返回到regist.jsp显示
		 */
		Map<String,String> errors = validateRegist(formUser, req.getSession());
		if(errors.size() > 0) {
			req.setAttribute("form", formUser);
			req.setAttribute("errors", errors);
			return "f:/jsps/user/regist.jsp";
		}
		/*
		 * 3. 使用service完成业务
		 */
		userService.regist(formUser);
		/*  
		 * 4. 保存成功信息，转发到msg.jsp显示！
		 */
		req.setAttribute("code", "success");
		req.setAttribute("msg", "注册功能，请马上到邮箱激活！");
		return "f:/jsps/msg.jsp"; 
	}
	
	/*
	 * 注册检验
	 * 对表单的字段进行逐个校验，如果有错误，使用当前字段名称为key,错误信息为value,保存到map中
	 * 返回map
	 */
	private Map<String,String> validateRegist(User formUser, HttpSession session){
		Map<String,String> errors = new HashMap<String,String>();
		/*
		 * 1.校验登录名
		 */
		String loginname = formUser.getLoginname();
		if(loginname == null || loginname.trim().isEmpty()){
			errors.put("loginname", "用户名不能为空");
		}else if(loginname.length() <2 || loginname.length()>20){
			errors.put("loginname", "用户名长度必须在2~20之间");
		}else if(!userService.ajaxValidateLoginname(loginname)){
			errors.put("loginname", "用户名已被注册!!");
		}
		
		/*
		 * 2.校验登录
		 */
		String loginpass = formUser.getLoginpass();
		if(loginpass == null || loginpass.trim().isEmpty()){
			errors.put("loginpass", "密码不能为空");
		}else if(loginpass.length() <3 || loginpass.length()>20){
			errors.put("loginpass", "密码长度必须在3~20之间");
		}
		
		/*
		 * 3.确认密码校验
		 */
		String reloginpass = formUser.getReloginpass();
		if(reloginpass == null || reloginpass.trim().isEmpty()){
			errors.put("reloginpass", "确认密码不能为空");
		}else if(!reloginpass.equals(loginpass)){
			errors.put("reloginpass", "两次输入不一致");
		}
		
		/*
		 * 4.邮箱校验
		 */ 
		String email = formUser.getEmail();
		if(email == null || email.trim().isEmpty()){
			errors.put("email", "邮箱不能为空");
		}else if(!email.matches("^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\\.[a-zA-Z0-9_-]{2,3}){1,2})$")){
			errors.put("email", "Email格式错误！");
		}else if(!userService.ajaxValidateEmail(email)){
			errors.put("email", "Email已被注册!");
		}
		
		/*
		 * 5.验证码校验
		 */
		String verifyCode = formUser.getVerifyCode();
		String vcode = (String) session.getAttribute("vCode");
		if(verifyCode == null || verifyCode.trim().isEmpty()){
			errors.put("verifyCode", "验证码不能为空");
		}else if(!verifyCode.equalsIgnoreCase(vcode)){
			errors.put("verifyCode", "验证码错误！");
		}
		
		return errors;
	}
	
	/**
	 * 激活功能
	 * @param req
	 * @param resp
	 * @return
	 */
	public String activation(HttpServletRequest req, HttpServletResponse resp){
		/*
		 * 1.获取参数激活码
		 * 2.用激活码调用service方法完成激活
		 *  >service方法有可能抛出异常，拿异常信息保存到request，转发到msg.jsp
		 * 3.保存成功信息到request,转发到msg.jsp显示
		 */
		String code = req.getParameter("activationCode");
		try {
			userService.activation(code);
			req.setAttribute("code", "success");//通知msg.jsp显示√
			req.setAttribute("msg", "恭喜，激活成功，请马上登录");
		} catch (UserException e) {
			req.setAttribute("msg", e.getMessage());
			req.setAttribute("code", "error");//通知msg.jsp显示×
		}
		return "f:/jsps/msg.jsp";
	}
	
	/**
	 * 登录功能
	 * @throws UnsupportedEncodingException 
	 */
	public String login(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		/*
		 * 1.封装表单数据到User
		 * 2.校验表单数据
		 * 3.使用service查询，得到User
		 * 4.查看用户是否存在，如果不存在
		 *  * 保存错误信息，用户名或密码错误
		 *  * 保存用户数据，为了回显
		 *  * 转发到login.jsp
		 * 5.如果存在，查看状态，如果状态为false:
		 *  * 保存错误信息，您没有激活
		 *  * 保存用户数据，为了回显
		 *  * 保存新闻信息，显示在已登录界面
		 *  * 保存公告信息，显示在已登录界面
		 *  * 转发到login.jsp 
		 * 6.登录成功
		 *  * 保存当前查询出的user到session中
		 *  * 保存当前用户的名称到cookie中，注意中文需要编码处理
		 */
		/*
		 * 1.封装表单数据到user
		 */
		User formUser = CommonUtils.toBean(req.getParameterMap(), User.class);
		/*
		 * 2.校验
		 */  
		Map<String,String> errors = validateLogin(formUser, req.getSession());
		if(errors.size()>0){
			req.setAttribute("msg", "用户名或密码错误！");
			req.setAttribute("form", formUser);
			return "f:/jsps/user/login1.jsp";
		} 
		/*
		 * 3.调用userService#login()方法
		 */
		User user = userService.login(formUser);
		/*
		 * 4.开始判断
		 */
		if(user == null){
			req.setAttribute("msg", "用户名或密码错误！");
			req.setAttribute("user", formUser);
			return "f:/jsps/user/login1.jsp";
		}else{
				//保存用户到session
				req.setAttribute("username", user.getLoginname());
				req.getSession().setAttribute("sessionUser", user);
				
				List<News> newsList = newsService.findAll();
				req.setAttribute("newsList", newsList);
				
				List<Information> information = informationService.findAll();
				req.setAttribute("information", information);
				
				//获取用户名保存到cookie中
				String loginname = user.getLoginname();
				loginname = URLEncoder.encode(loginname, "utf-8");
				Cookie cookie = new Cookie("loginname",loginname);
				cookie.setMaxAge(60*60*24*10);//保存10天
				resp.addCookie(cookie);
				return "f:/jsps/login/Index_Pro.jsp";
			}
	}
	
	/*
	 * 登录校验方法，内容待定
	 */
	private Map<String,String> validateLogin(User formUser, HttpSession session){
		Map<String,String> errors = new HashMap<String,String>();
		String verifyCode = formUser.getVerifyCode();
		String vcode = (String) session.getAttribute("vCode");
		if(verifyCode == null || verifyCode.trim().isEmpty()){
			errors.put("verifyCode", "验证码不能为空");
		}else if(!verifyCode.equalsIgnoreCase(vcode)){
			errors.put("verifyCode", "验证码错误！");
		} 
		return errors;
	}
	/**
	 * 判断密码是否正确、修改密码
	 * @param req
	 * @param resp
	 * @return
	 */
	public String updatePassword(HttpServletRequest req,HttpServletResponse resp){
		/*
		 * 1.封装表单数据到user中
		 * 2.从session中获取uid
		 * 3.使用uid和表单中的oldPass和newPass来调用service方法
		 * 	>如果出现异常，保存异常信息到request中，转发到pwd.jsp中
		 * 4.保存成功信息到request中
		 * 5.转发到msg.jsp
		 */
		User formUser = CommonUtils.toBean(req.getParameterMap(), User.class);
		User user = (User) req.getSession().getAttribute("sessionUser");
		//如果用户没有登录，返回到登录页面，显示错误信息
		if(user == null){
			req.setAttribute("msg", "您还没有登录");
			return "f:/jsps/user/login1.jsp";
		}
		  
		try {
			userService.updatePassword(user.getUid(), formUser.getNewPass(), 
					formUser.getLoginpass());
			
			req.setAttribute("msg", "修改密码成功 ");
			req.setAttribute("code", "success");
			return "f:/jsps/msg.jsp";
		} catch (UserException e) {
			req.setAttribute("msg", e.getMessage());//将错误信息返回去
			req.setAttribute("user", formUser);//为了回显
			return "f:/jsps/user/pwd.jsp";
		}
	}
	
	/**
	 * 退出功能 
	 * @param req
	 * @param resp
	 * @return
	 */
	public String quit(HttpServletRequest req,HttpServletResponse resp){
		req.getSession().invalidate();
		return "r:/jsps/user/login1.jsp";
	}

}
