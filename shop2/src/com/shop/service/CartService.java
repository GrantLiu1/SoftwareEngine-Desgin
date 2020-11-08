package com.shop.service;

import java.util.List;

import com.shop.dao.CartDao;
import com.shop.entity.CartItem;

public class CartService {

	CartDao cartDao = new CartDao();
	//将商品添加至购物车
	public void addGoodsToCart(CartItem cart) {
		cartDao.addNewCart(cart);
	}
	//根据用户id查询购物车
	public List<CartItem> findCartListById(Integer userId) {
		List<CartItem> list = cartDao.findCartListById(userId);
		return list;
	}
	//根据id删除购物车里的商品
	public void deleteCartItemById(Integer cartItemId) {
		cartDao.deleteCartItemById(cartItemId);
	}
	//根据用户Id删除其购物车里的所有商品
	public void deleteAllCartItem(int userId) {
		cartDao.deleteAllCartItem(userId);
	}
	
}
