package com.shop.service;

import java.sql.SQLException;

import com.shop.dao.UserDao;
import com.shop.entity.User;

public class UserService {
	UserDao dao = new UserDao();
	User user=new User();
	//注册
	public void regist(User user) {
		try {
			dao.regist(user);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	//登录
	public User login(String username, String password) {
		try {
			user=dao.selectByCondition(username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	public User findUserById(Integer id) {
		user = dao.findUserById(id);
		return user;
	}
	
	//修改用户头像
	public void updateHeadPic(String headPic, int userID) {
		dao.updateHeadPic(headPic,userID);
	}
	//修改昵称和手机号
	public void updateInfo(User user) {
		dao.updateInfo(user);
	}
	//修改密码
	public void updatePWD(User user) {
		dao.updatePWD(user);
	}
	//卖家信息修改
	public void seller_updateInfo(User user) {
		dao.seller_updateInfo(user);
	}
	
	//卖家修改用户头像
	public void seller_updateHeadPic(String headPic, int userID) {
		dao.updateHeadPic(headPic,userID);
	}
}
