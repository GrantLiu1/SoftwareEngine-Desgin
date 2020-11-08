package com.shop.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.entity.Goods;
import com.shop.entity.Store;
import com.shop.entity.User;
import com.shop.service.GoodsService;
import com.shop.service.StoreService;
@WebServlet("/store")
public class StoreServlet extends BaseServlet {
	StoreService storeService = new StoreService();
	//添加收藏功能
	public void addStore(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String gId = request.getParameter("gId");
		Store store = new Store();
		store.setgID(Integer.parseInt(gId));
		store.setUserID(Integer.parseInt(userId));
		storeService.addStore(store);
		
		response.getWriter().write("1");
	}
	//取消收藏功能
	public void deleteStore(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String gId = request.getParameter("gId");
		Store store = new Store();
		store.setgID(Integer.parseInt(gId));
		store.setUserID(Integer.parseInt(userId));
		storeService.deleteStoreByUserIdAndGId(store);
		
		response.getWriter().write("1");
	}
	//根据买家查询收藏夹
	public void findStoreByUser(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		List<Goods> goodsList = storeService.selectStoreListByUserID(user.getUserID());
		request.setAttribute("goodsList", goodsList);
		request.getRequestDispatcher("/Reception/user_collection.jsp").forward(request, response);
	}
}
