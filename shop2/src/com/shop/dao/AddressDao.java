package com.shop.dao;

import java.sql.SQLException;
import java.util.List;

import com.shop.entity.Address;
import com.shop.mapper.AddressMapper;

public class AddressDao {
	//根据用户id，查询地址
	public List selectUserAddress(int userID) throws SQLException {
		String sql="select * from address where userId = ? ";
		List<Address> list=BaseDao.excuteQuery(sql,new AddressMapper(),userID);
		return list;
	}
	//添加地址
	public void addAddress(Address address)throws SQLException{
		String sql="insert into address(userId,aContent) values(?,?)";
		BaseDao.excuteUpdate(sql, address.getUserID(),address.getaContent());
	}
	//删除地址
	public void delAddress(int aId)throws SQLException{
		String sql="DELETE FROM address WHERE aId = ?";
		BaseDao.excuteUpdate(sql,aId);
	}
	//修改地址
	public void updateAddress(Address address)throws SQLException{
		String sql="update address set aContent = ? WHERE aId = ?";
		BaseDao.excuteUpdate(sql,address.getaContent(),address.getaID());
	}
}
