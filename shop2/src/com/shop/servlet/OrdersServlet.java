package com.shop.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.dao.OrdersDao;
import com.shop.entity.Address;
import com.shop.entity.CartItem;
import com.shop.entity.Evaluations;
import com.shop.entity.Goods;
import com.shop.entity.Orders;
import com.shop.entity.User;
import com.shop.service.AddressService;
import com.shop.service.CartService;
import com.shop.service.DeleteService;
import com.shop.service.EvaluationService;
import com.shop.service.GoodsService;
import com.shop.service.OrdersService;

@WebServlet("/orders")
public class OrdersServlet extends BaseServlet {
	EvaluationService evaluationService =new EvaluationService();
	OrdersService ordersService = new OrdersService();
	CartService cartService = new CartService();
	AddressService addressService = new AddressService();
	OrdersDao ordersDao =new OrdersDao();
	//进入订单页面之前查询需要回显的信息
	public void showOrders(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException,IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		List<CartItem> list = cartService.findCartListById(user.getUserID());
		GoodsService goodsService =new GoodsService();
		double price = 0;
		double charity = 0;
		for (CartItem cartItem : list) {
			Goods goods = goodsService.findGoodById(cartItem.getgId()+"");
//			charity += goods.getgChar()*cartItem.getBuyNum();
			price += cartItem.getTotalPrice();
		}
		
		request.setAttribute("charity", charity);
		request.setAttribute("price", price);
		request.setAttribute("orderList", list);
		request.getRequestDispatcher("/Reception/order_info.jsp").forward(request, response);
	}
	//保存订单
	public void addOrders(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException,IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		List<CartItem> list = cartService.findCartListById(user.getUserID());
		Address address = new Address();
		request.setCharacterEncoding("UTF-8");
		String aContent = request.getParameter("aContent");
		address.setaContent(aContent);
		ordersService.addOrders(user,list,address);
		cartService.deleteAllCartItem(user.getUserID());
		
		response.sendRedirect(request.getContextPath()+"/Reception/success_result.jsp");
	}
	//删除订单
	DeleteService deleteService = new DeleteService();
	public void delOrders_admin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int oId = Integer.parseInt(request.getParameter("oId"));
		try {
			deleteService.deleteOrder(oId);
			response.sendRedirect(request.getContextPath()+"/Backstage/order/order_list.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//卖家删除订单
	public void delOrders_seller(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int oId = Integer.parseInt(request.getParameter("oId"));
		try {
			deleteService.deleteOrder(oId);
			response.sendRedirect(request.getContextPath()+"/Seller/order/order_list.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//确认收货
	public void ensureGoods(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Orders orders = new Orders();
		Evaluations eva = new Evaluations();
		
		int oId = Integer.parseInt(request.getParameter("OID"));
		String eContent = request.getParameter("evaluate");
		orders = ordersDao.selectOrdersByOID(oId);
		eva.setgID(orders.getgID());
		orders.setoID(oId);
		orders.setoState("已收货");
		eva.seteContent(eContent);
		eva.seteTime(new Date());
		eva.setUserID(user.getUserID());		
		try {
			evaluationService.addEvaluation(eva);
			ordersService.updateOrderState(orders);
			response.sendRedirect(request.getContextPath()+"/Reception/user_order.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//发货
	public void deliverGoods(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int oId = Integer.parseInt(request.getParameter("oId"));
		//System.out.println(oId);
		if(oId != 0) {
			ordersService.deliverGoods(oId);
			System.out.println("发货成功");
			response.sendRedirect(request.getContextPath()+"/Seller/order/deliverOrder.jsp");
		}else {
			response.sendRedirect(request.getContextPath()+"/Seller/order/deliverOrder.jsp");
			System.out.println("发货失败");
		}	
	}
	
}
