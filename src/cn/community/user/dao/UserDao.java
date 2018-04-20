package cn.community.user.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.community.jdbc.TxQueryRunner;
import cn.community.user.domain.User;


public class UserDao {
	private QueryRunner qr = new TxQueryRunner();

	/**
	 * 按uid和password查询
	 * @param code
	 * @return
	 * @throws SQLException
	 */
	public boolean findByUidAndPassword(String uid, String password) throws SQLException{
		String sql = "select count(1) from c_user where uid=? and loginpass=?";
		Number number = (Number)qr.query(sql, new ScalarHandler(),uid,password);
		return number.intValue()>0;
	}
	
	/*
	 * 修改密码
	 */
	public void updatePassword(String uid, String password) throws SQLException{
		String sql = "update c_user set loginpass = ? where uid = ? ";
		qr.update(sql,password,uid);
	}
	
	/*
	 * 通过激活码查询用户
	 */
	public User findByCode(String code) throws SQLException{
		String sql = "select * from c_user where activationCode=?";
		return qr.query(sql, new BeanHandler<User>(User.class), code); 
	}
	  
	/**
	 * 按用户名和密码查询
	 * @param uid
	 * @param status
	 * @throws SQLException
	 */
	public User findByLoginnameAndLoginpass(String loginname,String loginpass) throws SQLException {
		String sql = "select * from c_user where loginname=? and loginpass=?";
		return qr.query(sql, new BeanHandler<User>(User.class), loginname, loginpass);
	}
	
	/*
	 * 修改用户状态
	 */
	 public void updateStatus(String uid, boolean status) throws SQLException{
		 String sql = "update c_user set status=? where uid=?";
		 qr.update(sql, status,uid);
	 }
	 
	/*
	 * 以ajax开头命名表示支持ajax的校验方法
	 * 检验用户名是否注册
	 */
	public boolean ajaxValidateLoginname(String loginname) throws SQLException{
		String sql = "select count(1) from c_user where loginname=?";
		Number number = (Number) qr.query(sql, new ScalarHandler(),loginname);
		return number.intValue() == 0;
	}
	/*
	 * 校验email是否注册
	 */
	public boolean ajaxValidateEmail(String email) throws SQLException{
		String sql = "select count(1) from c_user where email=?";
		Number number = (Number) qr.query(sql, new ScalarHandler(),email);
		return number.intValue() == 0;
	}
	  
	/**
	 * 添加用户
	 * @param user
	 * @throws SQLException
	 */
	public void add(User user) throws SQLException{
		String sql ="insert into c_user values(?,?,?,?,?,?)";
		Object[] params = {user.getUid(), user.getLoginname(),user.getLoginpass(),
				user.getEmail(), user.isStatus(), user.getActivationCode()};
		qr.update(sql, params);
	}

}
