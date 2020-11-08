package com.shop.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shop.dao.GoodsDao;
import com.shop.dao.IndexDao;
import com.shop.entity.Goods;
import com.shop.entity.Indexs;
import com.shop.entity.pageBean;
import com.shop.service.GoodsService;

public class GoodsService{
	
	public pageBean findGoodListBykindNamde(Integer currentPage, Integer rows, String kindName) {
		GoodsDao dao= new GoodsDao();
		//查询商品总条数
		Integer total = dao.findGoodsCountByKindName(kindName);
		//计算总页数
		Integer totalPage = 0;
		if (total%rows>0) {
			totalPage = total/rows+1;
		}else {
			totalPage = total/rows;
		}
		//查询每页显示的内容
		//计算每页显示的第一条的下标
		Integer index = (currentPage-1)*rows;
		List<Goods> list = dao.findGoodsListByKindNameToLimit(kindName, index, rows);
		//List<Goods> goodsList = new ArrayList<>();
		//将数据封装进pageBean并返回
		pageBean pageBean = new pageBean();
		pageBean.setTotal(total);
		pageBean.setCurrentPage(currentPage);
		pageBean.setRows(rows);
		pageBean.setTotalPage(totalPage);
		
		pageBean.setList(list);
		return pageBean;
	}

	public Goods findGoodById(String gId) {
		GoodsDao dao = new GoodsDao();
		Goods goods = dao.findGoodById(gId);
		return goods;
	}

	public List<Goods> findGoodsListByUserId(Integer userId) {
		GoodsDao dao = new GoodsDao();
		List<Goods> list = dao.findGoodsListByUserId(userId);
		return list;
	}
	
	//根据关键字查询商品集合
	public pageBean findGoodsListByKeyWord(String keyWord,Integer currentPage,Integer rows) {
		GoodsDao dao= new GoodsDao();
		//查询商品总条数
		Integer total = dao.findGoodsCountBykeyWord(keyWord);
		//计算总页数
		Integer totalPage = 0;
		if (total%rows>0) {
			totalPage = total/rows+1;
		}else {
			totalPage = total/rows;
		}
		//查询每页显示的内容
		//计算每页显示的第一条的下标
		Integer index = (currentPage-1)*rows;
		List<Goods> list = dao.findGoodsListByKeyWord(keyWord, index, rows);
		//List<Goods> goodsList = new ArrayList<>();
		//将数据封装进pageBean并返回
		pageBean pageBean = new pageBean();
		pageBean.setTotal(total);
		pageBean.setCurrentPage(currentPage);
		pageBean.setRows(rows);
		pageBean.setTotalPage(totalPage);
		
		pageBean.setList(list);
		return pageBean;
	}
	public void addGoods(Goods goods) {
		GoodsDao dao = new GoodsDao();
		try {
			dao.addGoods(goods);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 修改商品
	public void updateGoods(String gName,String gDes,String gPic,String gKind,int gAmount,double gPrice,double gChar,int gId) {
		GoodsDao dao = new GoodsDao();
		try {
			dao.updateGoods(gName, gDes,gPic,gKind, gAmount, gPrice, gChar, gId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	// 查找某个商品
	public List selectOneGoods(int gId) {
		GoodsDao dao = new GoodsDao();
		List<Goods> list = null;
		try {
			list = dao.selectOneGoods(gId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	// 删除某个商品
	public void deleteGoods(int gId) {
		GoodsDao dao = new GoodsDao();
		try {
			dao.deleteGoods(gId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 查看商品评价
	public List selectEva(int gId) {
		GoodsDao dao = new GoodsDao();
		List<Goods> list = null;
		try {
			list = dao.selectEvas(gId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}
