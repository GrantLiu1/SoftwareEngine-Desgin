package com.shop.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import com.shop.entity.Store;

public class StoreMapper implements RowMapper{

	@Override
	public Object mapperObject(ResultSet rs) throws SQLException {
		Store store=new Store();
		store.setsID(rs.getInt(1));
		store.setUserID(rs.getInt(2));
		store.setgID(rs.getInt(3));
		return store;
	}

}
