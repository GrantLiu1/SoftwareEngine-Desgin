package com.shop.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.shop.entity.User;


public class UserMapper implements RowMapper{

	@Override
	public Object mapperObject(ResultSet rs) throws SQLException {
		User user=new User();
		user.setUserID(rs.getInt(1));
		user.setUserName(rs.getString(2));
		user.setUserPwd(rs.getString(3));
		user.setHeadPic(rs.getString(4));
		user.setNickName(rs.getString(5));
		user.setUserType(rs.getBoolean(6));
		user.setIDNum(rs.getString(7));
		user.setPhone(rs.getString(8));
		user.setCharity(rs.getDouble(9));
		user.setHonest(rs.getInt(10));
		user.setuCheck(rs.getBoolean(11));
		user.setKuserType(rs.getBoolean(12));
		user.setkCheck(rs.getBoolean(13));
		return user;
	}

}
