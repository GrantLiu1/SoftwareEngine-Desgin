package com.shop.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.shop.entity.Orders;

public class OrdersMapper implements RowMapper{

	@Override
	public Object mapperObject(ResultSet rs) throws SQLException {
		Orders orders=new Orders();
		orders.setoID(rs.getInt(1));
		orders.setgID(rs.getInt(2));
		orders.setoNum(rs.getInt(3));
		orders.setoPrice(rs.getDouble(4));
		orders.setoState(rs.getString(5));
		orders.setoTip(rs.getString(6));
		orders.setoTime(rs.getDate(7));
		orders.setUserID(rs.getInt(8));
		orders.setUserAddress(rs.getString(9));
		return orders;
	}

}
