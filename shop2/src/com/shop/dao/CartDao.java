package com.shop.dao;

import java.util.List;

import com.shop.entity.CartItem;
import com.shop.mapper.CartMapper;

public class CartDao {

	public void addNewCart(CartItem cart) {
		String sql = "insert into cartItem (sellerId,UserId,gName,gPic,gPrice,buyNum,totalPrice,gId) "
				+ "values(?,?,?,?,?,?,?,?)";
		BaseDao.excuteUpdate(sql, cart.getSellerId(),cart.getUserId(),cart.getgName(),cart.getgPic(),
				cart.getgPrice(),cart.getBuyNum(),cart.getTotalPrice(),cart.getgId());
	}

	public List<CartItem> findCartListById(Integer userId) {
		String sql = "select * from cartItem where userId = ?";
		List<CartItem> list = BaseDao.excuteQuery(sql, new CartMapper(), userId);
		return list;
	}
	//根据id删除购物车里的商品
	public void deleteCartItemById(Integer cartItemId) {
		String sql = "delete from cartItem where cartItemId = ?";
		BaseDao.excuteUpdate(sql, cartItemId);
	}
	//根据用户Id删除其购物车里的所有商品
	public void deleteAllCartItem(int userId) {
		String sql = "delete from cartItem where userId = ?";
		BaseDao.excuteUpdate(sql, userId);
	}

}
