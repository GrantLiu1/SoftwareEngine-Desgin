package com.shop.dao;

import java.sql.SQLException;
import java.util.List;

import com.shop.entity.Store;
import com.shop.mapper.AddressMapper;
import com.shop.mapper.StoreMapper;

public class StoreDao {
	//添加收藏物品
	public void addStore(Store  store) {
		String sql ="insert into store (userId,gId) values(?,?)";
		BaseDao.excuteUpdate(sql, store.getUserID(),store.getgID());
	}
	//查询收藏物品
	public Store findStoreByUserIdandGId(int userId, int gId) {
		String sql = "select * from store where userId = ? and gId = ?";
		List<Store> list = BaseDao.excuteQuery(sql, new StoreMapper(), userId,gId);
		if (list.size() == 0) {
			return null;
		}
		return list.get(0);
	}
	//删除收藏物品
	public void deleteStoreByUserIdAndGId(Store store) {
		String sql = "delete from store where userId = ? and gId = ?";
		BaseDao.excuteUpdate(sql, store.getUserID(),store.getgID());
	}
	//根据买家id查询收藏商品
	public List selectStoreListByUserID(int userID){
		String sql="select * from store where userId = ? ";
		List<Store> list=BaseDao.excuteQuery(sql,new StoreMapper(),userID);
		return list;
	}
}
