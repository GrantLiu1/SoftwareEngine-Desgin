package com.shop.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.shop.entity.Address;

public class AddressMapper implements RowMapper{

	@Override
	public Object mapperObject(ResultSet rs) throws SQLException {
		Address add =new Address();
		add.setaID(rs.getInt(1));
		add.setUserID(rs.getInt(2));
		add.setaContent(rs.getString(3));
		return add;
	}
}
