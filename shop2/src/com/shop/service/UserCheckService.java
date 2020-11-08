/**
 * 买家申请成为卖家
 */
package com.shop.service;

import java.sql.SQLException;

import com.shop.dao.BaseDao;
import com.shop.entity.User;

public class UserCheckService {
	/**
	 * 通过用户申请
	 * @param userId
	 * @throws SQLException
	 */
	public void proveUser(int userId) throws SQLException{
		String sql ="UPDATE User SET uCheck = 0,userType = 1 where userId = ? ";
		BaseDao.excuteUpdate(sql,userId);	
	}

	public void provekUser(int userId) throws SQLException{
		String sql ="UPDATE User SET kCheck = 0,kuserType = 1 where userId = ? ";
		BaseDao.excuteUpdate(sql,userId);
	}
	
	/**
	 * 拒绝卖家申请
	 */
	public void cancelUser(int userId) throws SQLException{
		String sql ="UPDATE User SET uCheck = 0 where userId = ? ";
		BaseDao.excuteUpdate(sql,userId);
	}
	/**
	 * 拒绝快递员申请
	 */
	public void cancelkUser(int userId) throws SQLException{
		String sql ="UPDATE User SET kCheck = 0 where userId = ? ";
		BaseDao.excuteUpdate(sql,userId);
	}
	//买家发起身份申请
	public void updateuCheck(User user) {
		String sql = "update user set uCheck = ? where userId = ?";
		BaseDao.excuteUpdate(sql, user.isuCheck(),user.getUserID());
	}

	//买家发起快递员申请
	public void updatekCheck(User user) {
		String sql = "update user set kCheck = ? where userId = ?";
		BaseDao.excuteUpdate(sql, user.iskCheck(),user.getUserID());
	}
}
