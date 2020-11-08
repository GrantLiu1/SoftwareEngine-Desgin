package com.shop.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.entity.Address;
import com.shop.entity.User;
import com.shop.service.AddressService;


@WebServlet("/addressServlet")
public class AddressServlet extends BaseServlet{
	AddressService service= new AddressService();
	//添加新地址
	public void newAddress(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");	
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Address address =new Address();
		String aContent = request.getParameter("address");
		
		address.setUserID(user.getUserID());
		address.setaContent(aContent);
		
		try {
			service.addAddress(address);
			request.getRequestDispatcher("/Reception/user_address.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	//删除地址
	public void delAddress(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		int aId = Integer.parseInt(request.getParameter("key"));
		try {
			service.delAddress(aId);
			request.getRequestDispatcher("/Reception/user_address.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//修改地址
	public void updAddress(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		Address address =new Address();
		int aId = Integer.parseInt(request.getParameter("AID"));
		String aContent = request.getParameter("address2");
		
		address.setaID(aId);
		address.setaContent(aContent);
		
		try {
			service.updateAddress(address);
			response.sendRedirect("Reception/user_address.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
