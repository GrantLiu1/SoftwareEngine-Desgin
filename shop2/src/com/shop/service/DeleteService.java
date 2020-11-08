/**
 * 各类删除Service
 */
package com.shop.service;

import java.sql.SQLException;

import com.shop.dao.BaseDao;

public class DeleteService {
	/**
	 * 删除指定订单
	 */
	public void deleteOrder(int oId) throws SQLException{
		String sql = "delete from Orders where oId = ?";
		BaseDao.excuteUpdate(sql,oId);
	}
	
	/**
	 * 删除指定商品
	 */
	public void deleteGoods(int gId) throws SQLException{
		String sql = "delete from Goods where gId = ?";
		BaseDao.excuteUpdate(sql,gId);
	}
	
	/**
	 * 删除指定用户
	 */
	public void deleteUser(int userId) throws SQLException{
		String sql = "delete from User where userId = ?";
		BaseDao.excuteUpdate(sql,userId);
	}
	
	/**
	 * 删除指定评价
	 */
	public void deleteEvaluation(int eId) throws SQLException{
		String sql = "delete from Evaluation where eId = ?";
		BaseDao.excuteUpdate(sql,eId);
	}
	
	/**
	 * 删除指定广告
	 */
	public void deleteIndex(int iId) throws SQLException{
		String sql = "delete from Indexs where iId = ?";
		BaseDao.excuteUpdate(sql,iId);
	}
}
