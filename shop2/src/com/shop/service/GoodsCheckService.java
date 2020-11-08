/**
 * 商品审核
 */
package com.shop.service;

import java.sql.SQLException;

import com.shop.dao.BaseDao;

/**
 * @author macbook-pro
 *
 */
public class GoodsCheckService {
	/**
	 * 通过商品发布申请
	 * @param
	 * @throws SQLException
	 * @throws
	 */
	public void proveGoods(int gId) throws SQLException{
		String sql ="UPDATE Goods SET gCheck = 1 where gId = ? ";
		BaseDao.excuteUpdate(sql,gId);	
	}
	
	/**
	 * 拒绝商品发布申请
	 */
	public void cancelGoods(int gId) throws SQLException{
		String sql="delete from Goods where gId = ? ";
		BaseDao.excuteUpdate(sql,gId);
	}
}
