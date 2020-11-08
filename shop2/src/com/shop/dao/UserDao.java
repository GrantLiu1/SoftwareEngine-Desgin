package com.shop.dao;

import java.sql.SQLException;
import java.util.List;
import com.shop.dao.BaseDao;
import com.shop.entity.User;
import com.shop.mapper.UserMapper;


public class UserDao{
	//注册
	public void regist(User user) throws SQLException {
		String sql = "insert into user(userName,userPwd,headPic,nickName,IDNum,phone) values(?,?,?,?,?,?)";
		BaseDao.excuteUpdate(sql, user.getUserName(),user.getUserPwd(),user.getHeadPic(),user.getNickName(),user.getIDNum(),user.getPhone());
	}
	//查询所有用户
	public List selectAllUser() throws SQLException {
		String sql="select * from user";
		List<User> list=BaseDao.excuteQuery(sql,new UserMapper());
		return list;
	}
	//登录
	public User selectByCondition(String username, String password)throws SQLException{
		User user =null;
		String sql="select * from user where userName = ? and userPwd = ?";
		List list=BaseDao.excuteQuery(sql,new UserMapper(),username,password);
		if(list.size() > 0){
			user=(User)list.get(0);	
		}
		return user;
	}
	//根据ID查询一个用户
	public User findUserById(Integer id) {
		String sql="select * from user where userId = ?";
	    List<User> list = BaseDao.excuteQuery(sql, new UserMapper(), id);
		return list.get(0);
	}
	//更新头像
	public void updateHeadPic(String headPic, int userID) {
		String sql = "update user set headPic = ? where userId = ?";
		BaseDao.excuteUpdate(sql, headPic,userID);
	}	
	//修改昵称和手机号
	public void updateInfo(User user) {
		String sql = "update user set phone = ? , nickName = ? where userId = ?";
		BaseDao.excuteUpdate(sql, user.getPhone(),user.getNickName(),user.getUserID());
	}
	//修改密码
	public void updatePWD(User user) {
		String sql = "update user set userPwd = ? where userId = ?";
		BaseDao.excuteUpdate(sql, user.getUserPwd(),user.getUserID());
	}
	//查询申请成为卖家的买家
	public List selectAimUser() throws SQLException{
		String sql="select * from User where uCheck = 1 group by userId";
		List<User> list=BaseDao.excuteQuery(sql,new UserMapper());
		return list;
	}
	//查询申请成为快递员的买家
	public List selectKUser() throws SQLException{
		String sql="select * from User where kCheck = 1 group by userId";
		List<User> list=BaseDao.excuteQuery(sql,new UserMapper());
		return list;
	}
	//卖家信息修改
	public void seller_updateInfo(User user) {
		String sql = "update user set headPic= ? ,phone = ? , nickName = ? where userId = ?";
		BaseDao.excuteUpdate(sql, user.getHeadPic(),user.getPhone(),user.getNickName(),user.getUserID());
	}
	//修改公益金
	public void updateUserCharity(double charity, Integer userId) {
		String sql = "update user set charity = charity + ? where userId = ?";
		BaseDao.excuteUpdate(sql, charity,userId);
	}

}
