package com.shop.service;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import com.shop.dao.BaseDao;
import com.shop.dao.GoodsDao;
import com.shop.dao.OrdersDao;
import com.shop.dao.UserDao;
import com.shop.entity.Address;
import com.shop.entity.CartItem;
import com.shop.entity.Goods;
import com.shop.entity.Orders;
import com.shop.entity.User;

public class OrdersService {
	OrdersDao ordersDao = new OrdersDao();
	GoodsDao goodsDao = new GoodsDao();
	UserDao userDao = new UserDao();
	
	public void addOrders(User user, List<CartItem> list, Address address) {
		for (CartItem cartItem : list) {
			Orders orders = new Orders();
			orders.setoState("待发货");
			orders.setoTime(new Date());
			orders.setUserID(user.getUserID());
			orders.setUserAddress(address.getaContent());
			orders.setgID(cartItem.getgId());
			orders.setoID(cartItem.getCartItemId());
			orders.setoNum(cartItem.getBuyNum());
			orders.setoPrice(cartItem.getTotalPrice());
			
			Goods goods = goodsDao.findGoodById(cartItem.getgId()+"");
			//更新用户公益金
//			userDao.updateUserCharity(goods.getgChar()*cartItem.getBuyNum(), user.getUserID());

			ordersDao.addOrders(orders);
			goodsDao.updateGoodsAmonut(cartItem.getBuyNum(), cartItem.getgId());
		}
	}
	//买家根据订单id修改订单状态
	public void updateOrderState(Orders orders)throws SQLException{
		ordersDao.updateOrderState(orders);
	}
	//发货
	public void deliverGoods(int oId) {
		try {
			ordersDao.deliverGoods(oId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
