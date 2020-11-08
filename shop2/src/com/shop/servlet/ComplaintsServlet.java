package com.shop.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.entity.Complaints;
import com.shop.entity.User;
import com.shop.service.ComplaintsService;

@WebServlet("/complaintsServlet")
public class ComplaintsServlet extends BaseServlet {
	ComplaintsService service = new ComplaintsService();
	//删除投诉
	public void delComp(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		int cId = Integer.parseInt(request.getParameter("key"));
		System.out.println(cId);
		try {
			service.delComplaints(cId);
			request.getRequestDispatcher("/Reception/user_complain.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//管理员删除投诉
	public void delComp_admin(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		int cId = Integer.parseInt(request.getParameter("cId"));
		try {
			service.delComplaints(cId);
			response.sendRedirect(request.getContextPath()+"/Backstage/complaint/complaints_list.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//管理员处理投诉
	public void dealComp(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int cId = Integer.parseInt(request.getParameter("cId"));
			try {
				service.dealComplaints(cId);
				response.sendRedirect(request.getContextPath()+"/Backstage/complaint/complaints_list.jsp");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
	}
	//添加新投诉
	public void addComp(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");	
		request.setCharacterEncoding("UTF-8");
		String cContent = request.getParameter("cContent");
		int gid = Integer.parseInt(request.getParameter("GID"));
		Complaints comp = new Complaints();
		
		comp.setcContent(cContent);
		comp.setcTime(new Date());
		comp.setUserID(user.getUserID());
		comp.setGid(gid);
		try {
			service.addComplaints(comp);
			response.sendRedirect("Reception/myhome.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
