package com.shop.dao;

import java.sql.SQLException;
import java.util.List;

import com.shop.entity.Complaints;
import com.shop.mapper.ComplaintsMapper;

public class ComplaintsDao {
	//添加新投诉
	public void addComplaints(Complaints comp) throws SQLException{
		String sql="insert into complaints(userId,cContent,cTime,gid) values(?,?,?,?)";
		BaseDao.excuteUpdate(sql,comp.getUserID(),comp.getcContent(),comp.getcTime(),comp.getGid());
	}
	//查找所有投诉
	public List selectAllComplaints() throws SQLException{
		String sql = "select * from Complaints group by cId";
		List<Complaints> list = BaseDao.excuteQuery(sql, new ComplaintsMapper());
		return list;
	}	
	//根据用户id，查询投诉
	public List selectUserComplaints(int userID) throws SQLException {
		String sql="select * from complaints where userId = ? ";
		List<Complaints> list=BaseDao.excuteQuery(sql,new ComplaintsMapper(),userID);
		return list;
	}
	//删除投诉
	public void delComplaints(int cId)throws SQLException{
		String sql="DELETE FROM complaints WHERE cId = ?";
		BaseDao.excuteUpdate(sql,cId);
	}
}
