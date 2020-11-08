package com.shop.service;

import java.util.ArrayList;
import java.util.List;

import com.shop.dao.GoodsDao;
import com.shop.dao.StoreDao;
import com.shop.entity.Goods;
import com.shop.entity.Store;

public class StoreService {
	StoreDao storeDao = new StoreDao();
	GoodsDao goodsDao = new GoodsDao();
	public void addStore(Store  store) {
		storeDao.addStore(store);
	}
	public Store findStoreByUserIdandGId(int userId, int gId) {
		Store store =  storeDao.findStoreByUserIdandGId(userId,gId);
		return store;
	}
	public void deleteStoreByUserIdAndGId(Store store) {
		storeDao.deleteStoreByUserIdAndGId(store);
	}
	//根据用户id查询收藏物品
	public List selectStoreListByUserID(int userID){
		List<Store> list=storeDao.selectStoreListByUserID(userID);
		List<Goods> goodslist=new ArrayList<>();
		for(Store store:list) {
			Goods goods=goodsDao.findGoodById(store.getgID());
			goodslist.add(goods);
		}
		return goodslist;
	}
}
