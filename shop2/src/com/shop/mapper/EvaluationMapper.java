package com.shop.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.shop.entity.Evaluations;

public class EvaluationMapper implements RowMapper{

	@Override
	public Object mapperObject(ResultSet rs) throws SQLException {
		Evaluations eva =new Evaluations();
		eva.seteID(rs.getInt(1));
		eva.setgID(rs.getInt(2));
		eva.seteContent(rs.getString(3));
		eva.seteTime(rs.getDate(4));
		eva.setUserID(rs.getInt(5));
		return eva;
	}
}
