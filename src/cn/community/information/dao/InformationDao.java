package cn.community.information.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.community.jdbc.TxQueryRunner;
import cn.community.information.domain.Information;;

public class InformationDao {
	private QueryRunner qr = new TxQueryRunner();
	
	public List<Information> findAll() throws SQLException{
		String sql = "select * from c_information order by orderBy Desc limit 1";
		List<Information> information = qr.query(sql, new BeanListHandler<Information>(Information.class));
		return information;
	}


	public List<Information> findAll2() throws SQLException {
		String sql = "select * from c_information";
		List<Information> information = qr.query(sql, new BeanListHandler<Information>(Information.class));
		return information;
	}


	public Information findByNid(String iid) throws SQLException {
		String sql = "select * from c_information where iid =?";
		Information information = qr.query(sql, new BeanHandler<Information>(Information.class),iid);
		return information;
	}
}
