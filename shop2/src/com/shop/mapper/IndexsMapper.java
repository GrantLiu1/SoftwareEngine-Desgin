package com.shop.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.shop.entity.Indexs;

public class IndexsMapper implements RowMapper{

	@Override
	public Object mapperObject(ResultSet rs) throws SQLException {
		Indexs index= new Indexs();
		index.setiID(rs.getInt(1));
		index.setiName(rs.getString(2));
		index.setiSName(rs.getString(3));
		index.setiPic(rs.getString(4));
		index.setiUrl(rs.getString(5));
		index.setiKind(rs.getString(6));
		return index;
	}
}
