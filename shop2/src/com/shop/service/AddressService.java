package com.shop.service;

import java.sql.SQLException;

import com.shop.dao.AddressDao;
import com.shop.entity.Address;

public class AddressService {
	AddressDao dao=new AddressDao();
	//添加地址
	public void addAddress(Address address)throws SQLException{
		dao.addAddress(address);
	}
	//删除地址
	public void delAddress(int aId)throws SQLException{
		dao.delAddress(aId);
	}
	//修改地址
	public void updateAddress(Address address)throws SQLException{
		dao.updateAddress(address);
	}
}
