package cn.community.user.service;

import java.io.IOException;
import java.sql.SQLException;
import java.text.MessageFormat;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.Session;
  
import cn.community.mail.Mail;
import cn.community.mail.MailUtils;
import cn.community.tool.CommonUtils;
import cn.community.user.domain.User;
import cn.community.user.service.exception.UserException;
import cn.community.user.dao.UserDao;

public class UserService {
	
	private UserDao userDao = new UserDao();

	/**
	 * 注册功能
	 * @param user
	 */
	public void regist(User user){
		/*
		 * 1.数据的补齐
		 * uuid  32位随机数字
		 */
		user.setUid(CommonUtils.uuid());
		user.setStatus(false);
		user.setActivationCode(CommonUtils.uuid() + CommonUtils.uuid());
		/*
		 * 2.向数据库插入
		 */
		try {
			userDao.add(user);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		/*
		 * 3.发邮件
		 */
		/*
		 * email_template.properties  是文件名
		 * 把配置文件的内容加载到prop中
		 */
		Properties prop = new Properties();
		try {
			prop.load(this.getClass().getClassLoader().getResourceAsStream("email_template.properties"));
		} catch (IOException e1) {
			throw new RuntimeException(e1);
		}
		/*
		 * 登录邮件服务器，得到session
		 */
		String host = prop.getProperty("host");//服务器主机名
		String name = prop.getProperty("username");//登录名
		String pass = prop.getProperty("password");//登录密码
		Session session = MailUtils.createSession(host, name, pass);
		/*
		 *创建Mail对象   
		 */
		String from = prop.getProperty("from"); 
		String to = user.getEmail();
		String subject = prop.getProperty("subject");
		// MessageForm.format方法会把第一个参数中的{0},使用第二个参数来替换。
		// 例如MessageFormat.format("你好{0}, 你{1}!", "张三", "去死吧"); 返回“你好张三，你去死吧！”
		String content = MessageFormat.format(prop.getProperty("content"), user.getActivationCode());
		Mail mail = new Mail(from, to, subject, content);
		/*
		 * 发送邮件
		 */
		try {
			MailUtils.send(session, mail);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 用户名注册校验
	 * @param loginname
	 * @return
	 */
	public boolean ajaxValidateLoginname(String loginname){
		try {
			return userDao.ajaxValidateLoginname(loginname);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 邮箱注册校验
	 * @param email
	 * @return
	 */
	public boolean ajaxValidateEmail(String email){
		try {
			return userDao.ajaxValidateEmail(email);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 激活功能
	 * @param code
	 * @throws UserException
	 */
	public void activation(String code) throws UserException{
		/*
		 * 1.通过激活码查询用户
		 * 2.如果User为null,说明是无效激活码，抛出异常，给出异常信息(无效激活码)
		 * 3.查看用户状态是否为true,如果为true,抛出异常，给出异常信息（请不要二次激活）
		 * 4.修改用户状态
		 */
		try {
			User user = userDao.findByCode(code);
			if(user == null) throw new UserException("无效的激活码！");
			if(user.isStatus()) throw new UserException("你已经激活过了，不要二次激活!");
			userDao.updateStatus(user.getUid(), true);//修改状态
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 登录功能
	 * @param user
	 * @return
	 */
	public User login(User user){
		try {
			return userDao.findByLoginnameAndLoginpass(user.getLoginname(), user.getLoginpass());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		}
	}
	
	public void updatePassword(String uid,String newPass, String oldPass) throws UserException{
		boolean bool;
		try {
			bool = userDao.findByUidAndPassword(uid, oldPass);
			if(!bool){
				/*
				 * 1.校验原密码
				 */
				throw new UserException("原密码错误了哦！");
			}  
			
			/*
			 * 2.修改密码
			 */
			userDao.updatePassword(uid, newPass);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}  
	}

}
