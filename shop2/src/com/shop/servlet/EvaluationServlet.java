package com.shop.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.shop.entity.Evaluations;
import com.shop.entity.pageBean;
import com.shop.service.DeleteService;
import com.shop.service.EvaluationService;
@WebServlet(urlPatterns="/evaluation")
public class EvaluationServlet extends BaseServlet {
	EvaluationService evaluationService = new EvaluationService();
	//根据商品查询评价
	public void findEvaluationsByGId(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException,IOException{
		Integer gId = Integer.parseInt(request.getParameter("gId"));
		Integer currentPage = Integer.parseInt(request.getParameter("currentPage"));
		Integer rows = Integer.parseInt(request.getParameter("rows"));
		pageBean pageBean = evaluationService.findEvalutionByGId(currentPage, rows, gId);
				
		Gson gson = new Gson();
		String json = gson.toJson(pageBean);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write(json);
	}
	
	//管理员删除评价
	DeleteService deleteService = new DeleteService();
	public void delEva_admin(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int eId = Integer.parseInt(request.getParameter("eId"));
		try {
			deleteService.deleteEvaluation(eId);
			response.sendRedirect(request.getContextPath()+"/Backstage/evaluation/evaluation_list.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	
	//买家删除评价
	public void delEva(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int eId = Integer.parseInt(request.getParameter("key"));
		try {
			deleteService.deleteEvaluation(eId);
			response.sendRedirect("Reception/user_evaluate.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	
	//根据评价号修改评价
	public void updEva(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		Evaluations eva = new Evaluations();
		int eId = Integer.parseInt(request.getParameter("EID"));
		String eContent = request.getParameter("evaluate");
		eva.seteID(eId);
		eva.seteContent(eContent);
		eva.seteTime(new Date());
		
		try {
			evaluationService.updateEvaluation(eva);
			response.sendRedirect("Reception/user_evaluate.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
