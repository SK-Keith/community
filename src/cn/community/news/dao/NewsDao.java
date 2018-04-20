package cn.community.news.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.community.jdbc.TxQueryRunner;
import cn.community.news.domain.News;

public class NewsDao {
	private QueryRunner qr = new TxQueryRunner();

	public List<News> findAll() throws SQLException {
		String sql = "select * from c_new order by orderBy DESC limit 2";
		
		List<News> news = qr.query(sql, new BeanListHandler<News>(News.class));
		return news;
	}
	
	public List<News> findAll2() throws SQLException{
		String sql = "select * from c_new";
//		Map<String,Object> map = qr.query(sql, new MapHandler(), newsId);
		List<News> news = qr.query(sql, new BeanListHandler<News>(News.class));
		return news;  
	}

	public News findByNid(String nid) throws SQLException {
		String sql = "select * from c_new where nid = ?";
		News news = qr.query(sql, new BeanHandler<News>(News.class),nid);
		return news;
	}
}
