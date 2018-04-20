package cn.community.information.service;

import java.sql.SQLException;
import java.util.List;

import cn.community.information.dao.InformationDao;
import cn.community.information.domain.Information;

public class InformationService {
	private InformationDao informationDao = new InformationDao();
	
	public List<Information> findAll(){
		try {
			return informationDao.findAll();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Information> findAll2() {
		try {
			return informationDao.findAll2();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public Information findByNid(String iid) {
		try {
			return informationDao.findByNid(iid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
