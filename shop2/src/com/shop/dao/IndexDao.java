package com.shop.dao;

import java.sql.SQLException;
import java.util.List;

import com.shop.entity.Indexs;
import com.shop.mapper.IndexsMapper;

public class IndexDao {

	public List<Indexs> findGoodsList(String kindName){
		String sql="select * from indexs where iKind = ?";
		List<Indexs> list = BaseDao.excuteQuery(sql,new IndexsMapper(),kindName);
		return list;
	}
	//查找所有广告
	public List selectAllAdvs() throws SQLException{
		String sql = "select * from Indexs group by iId";
		List<Indexs> list = BaseDao.excuteQuery(sql, new IndexsMapper());
		return list;
	}
}
