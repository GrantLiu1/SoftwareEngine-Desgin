package com.shop.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.shop.entity.Goods;

public class GoodsMapper implements RowMapper{

	@Override
	public Object mapperObject(ResultSet rs) throws SQLException {
		Goods goods =new Goods();
		goods.setgID(rs.getInt(1));
		goods.setUserID(rs.getInt(2));
		goods.setgName(rs.getString(3));
		goods.setgDes(rs.getString(4));
		goods.setgPic(rs.getString(5));
		goods.setgAmount(rs.getInt(6));
		goods.setgChar(rs.getDouble(7));
		goods.setgCheck(rs.getBoolean(8));
		goods.setgKind(rs.getString(9));
		goods.setgPrice(rs.getDouble(10));
		return goods;
	}

}
