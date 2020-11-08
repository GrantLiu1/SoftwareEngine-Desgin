package com.shop.dao;

import java.sql.SQLException;
import java.util.List;

import com.shop.entity.Orders;
import com.shop.mapper.OrdersMapper;

public class OrdersDao {

	public void addOrders(Orders orders) {
		String sql= "insert into orders values(?,?,?,?,?,?,?,?,?)";
		BaseDao.excuteUpdate(sql, orders.getoID(),orders.getgID(),orders.getoNum(),orders.getoPrice(),
				orders.getoState(),null,orders.getoTime(),orders.getUserID(),orders.getUserAddress());
	}
	
	//查询所有订单
	public List selectAllOrders() throws SQLException{
		String sql = "select * from orders order by oId";
		List<Orders> list = BaseDao.excuteQuery(sql, new OrdersMapper());
		return list;
	}
	//根据买家id查询订单
	public List selectOrdersByUserID(int userId) throws SQLException{
		String sql = "select * from orders where userId = ?";
		List<Orders> list = BaseDao.excuteQuery(sql, new OrdersMapper(),userId);
		return list;
	}
	//买家根据订单id修改订单状态
	public void updateOrderState(Orders orders)throws SQLException{
		String sql="update orders set oState = ? WHERE oId = ?";
		BaseDao.excuteUpdate(sql,orders.getoState(),orders.getoID());
	}
	//根据oid查询订单
	public Orders selectOrdersByOID(int oId){
		String sql = "select * from orders where oId = ?";
		List<Orders> list = BaseDao.excuteQuery(sql, new OrdersMapper(),oId);
		return list.get(0);
	}
	// 查找已登录卖家的订单
	public List selectSellerOrders(int userId) throws SQLException{
		String sql = "select * from orders where gId in(select gId from goods where userId = ?) && (oState = '已发货' || oState = '已收货')";
		List<Orders> list = BaseDao.excuteQuery(sql,new OrdersMapper() ,userId);
		return list;
	}
	
	// 查找未发货的订单
	public List selectDeliverGoods(int userId) throws SQLException{
		String sql = "select * from orders where gId in(select gId from goods where userId = ?) && oState = '待发货'";
		List<Orders> list = BaseDao.excuteQuery(sql,new OrdersMapper() ,userId);
		return list;
	}
	
	//发货
	public void deliverGoods(int oId) throws SQLException {
		String sql ="UPDATE orders SET oState ='已发货' WHERE oId = ?; ";
		BaseDao.excuteUpdate(sql,oId);
		
	}
}
