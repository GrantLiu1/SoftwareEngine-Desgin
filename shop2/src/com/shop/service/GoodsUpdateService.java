/**
 * 商品修改Service
 */
package com.shop.service;

import java.sql.SQLException;

import com.shop.dao.BaseDao;

public class GoodsUpdateService {
	/**
	 * 根据商品修改内容修改数据库对应内容
	 */
	public void changeGoods(String gName,String gKind,int gAmount,double gPrice,double gChar,int gId) throws SQLException{
		String sql ="UPDATE Goods SET gName = ?,gKind = ?,gAmount = ?,gPrice = ?,gChar = ? where gId = ?";
		BaseDao.excuteUpdate(sql,gName,gKind,gAmount,gPrice,gChar,gId);	
	}
}
