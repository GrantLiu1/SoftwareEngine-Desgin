package com.shop.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.entity.CartItem;
import com.shop.entity.Goods;
import com.shop.entity.User;
import com.shop.service.CartService;
import com.shop.service.GoodsService;
import com.shop.service.UserService;

/**
 * 购物车相关功能实现
 * 
 * @author zouzh
 *
 */
@WebServlet("/cart")
public class CartServlet extends BaseServlet {
	CartService cartService = new CartService();
	GoodsService goodsService = new GoodsService();
	UserService userService = new UserService();

	public void addGoodsToCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		// 判断用户是否为登录状态
		if (user == null) {
			// 不是登录状态，跳转到登录页面进行登录
			response.sendRedirect(request.getContextPath() + "/Reception/login.jsp");
		} else {
			// 是登录状态，继续操作
			Integer gId = Integer.parseInt(request.getParameter("gId"));
			Integer sellerId = Integer.parseInt(request.getParameter("sellerId"));
			Integer userId = Integer.parseInt(request.getParameter("userId"));
			Integer buyNum = Integer.parseInt(request.getParameter("buyNum"));
			// 封装一个cart
			Goods goods = goodsService.findGoodById(gId.toString());
			CartItem cart = new CartItem();
			cart.setgId(gId);
			cart.setgName(goods.getgName());
			cart.setgPic(goods.getgPic());
			cart.setgPrice(goods.getgPrice());
			cart.setBuyNum(buyNum);
			cart.setTotalPrice(goods.getgPrice()*buyNum);
			cart.setSellerId(sellerId);
			cart.setUserId(userId);
			
			User seller = userService.findUserById(sellerId);
			// 查询商品信息用于回显
			cartService.addGoodsToCart(cart);

			response.setContentType("text/html; charset=utf-8");
			response.getWriter().println("<script language='javascript'>alert('商品已成功加入购物车!');location.href='"
					+ request.getContextPath() + "/goodsServlet?method=goodsInfo&gId=" + gId + "'</script>");
		}

	}

	// 查看购物车里的商品
	public void showMyCart(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException,IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		//判断用户是否为登录状态
		if (user == null) {
			//不是登录状态，跳转到登录页面进行登录
			response.sendRedirect(request.getContextPath()+"/Reception/login.jsp");
		}else {
			Integer userId = user.getUserID();
			List<CartItem> list = cartService.findCartListById(userId);
			double price = 0;
			double charity = 0;
			for (CartItem cartItem : list) {
				Goods goods = goodsService.findGoodById(cartItem.getgId()+"");
//				charity += goods.getgChar()*cartItem.getBuyNum();
				price +=cartItem.getTotalPrice();
			}
			request.setAttribute("charity", charity);
			request.setAttribute("cartList", list);
			request.setAttribute("price", price);
			request.getRequestDispatcher("/Reception/cart.jsp").forward(request, response);
		}
	}
	
	//根据id删除购物车里的商品
	public void deleteCartItemById(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException,IOException {
		Integer cartItemId = Integer.parseInt(request.getParameter("cartItemId"));
		cartService.deleteCartItemById(cartItemId);
		response.setContentType("text/html; charset=utf-8");
		response.getWriter().println("<script language='javascript'>location.href='"
					+ request.getContextPath() + "/cart?method=showMyCart'</script>");
	}
	//根据用户Id删除其购物车里的所有商品
	public void deleteAllCartItem(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException,IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		cartService.deleteAllCartItem(user.getUserID());
		response.setContentType("text/html; charset=utf-8");
		response.getWriter().println("<script language='javascript'>location.href='"
					+ request.getContextPath() + "/cart?method=showMyCart'</script>");
	}
}
