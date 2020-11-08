package com.shop.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.shop.entity.CartItem;

public class CartMapper implements RowMapper {

	@Override
	public Object mapperObject(ResultSet rs) throws SQLException {
		CartItem cart = new CartItem();
		cart.setCartItemId(rs.getInt(1));
		cart.setSellerId(rs.getInt(2));
		cart.setUserId(rs.getInt(3));
		cart.setgName(rs.getString(4));
		cart.setgPic(rs.getString(5));
		cart.setgPrice(rs.getDouble(6));
		cart.setBuyNum(rs.getInt(7));
		cart.setTotalPrice(rs.getDouble(8));
		cart.setgId(rs.getInt(9));
		return cart;
	}

}
