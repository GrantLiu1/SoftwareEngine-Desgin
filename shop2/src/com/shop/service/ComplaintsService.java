package com.shop.service;

import java.sql.SQLException;

import com.shop.dao.BaseDao;
import com.shop.dao.ComplaintsDao;
import com.shop.entity.Complaints;

public class ComplaintsService {
	ComplaintsDao dao=new ComplaintsDao();
	
	//添加新投诉
	public void addComplaints(Complaints comp) throws SQLException{
		dao.addComplaints(comp);
	}
	//删除投诉
	public void delComplaints(int cId)throws SQLException{
		dao.delComplaints(cId);
	}
	//处理投诉
	public void dealComplaints(int cId) throws SQLException{
		String sql = "update Complaints set cState = 1 where cId = ?";
		BaseDao.excuteUpdate(sql, cId);
	}
}
