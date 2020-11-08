package com.shop.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.shop.entity.Complaints;

public class ComplaintsMapper implements RowMapper{

	@Override
	public Object mapperObject(ResultSet rs) throws SQLException {
		Complaints comp=new Complaints();
		comp.setCid(rs.getInt(1));
		comp.setUserID(rs.getInt(2));
		comp.setcContent(rs.getString(3));
		comp.setcTime(rs.getDate(4));
		comp.setcState(rs.getBoolean(5));
		comp.setcResult(rs.getString(6));
		comp.setGid(rs.getInt(7));
		return comp;
	}

}
