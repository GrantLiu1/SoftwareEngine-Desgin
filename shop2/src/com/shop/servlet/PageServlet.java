package com.shop.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.shop.entity.Indexs;
import com.shop.service.DeleteService;
import com.shop.service.IndexService;


@MultipartConfig
@WebServlet(urlPatterns="/index")
public class PageServlet extends BaseServlet {
	
	public void index(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException,IOException{
		IndexService service = new IndexService();
		//查询主页轮播图
		List<Indexs> bigPic = service.findIndexList("轮播图");
		//查询主页热门商品
		List<Indexs> hotGoods = service.findIndexList("热门商品");
		//查询最新商品
		List<Indexs> newGoods = service.findIndexList("最新商品");
		
		request.setAttribute("bigPic", bigPic);
		request.setAttribute("hotGoods", hotGoods);
		request.setAttribute("newGoods", newGoods);
		request.getRequestDispatcher("/Reception/index.jsp").forward(request, response);
	}
	//广告上传
	IndexService impl = new IndexService();
	public void uploadPage_admin(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Indexs index = new Indexs();
		
		String iName = request.getParameter("iName");
		String iSName = request.getParameter("iSName");
		String iUrl = request.getParameter("iUrl");
		String iKind = request.getParameter("iKind");
		
		Part part = request.getPart("file");	
		String header = part.getHeader("content-disposition");
		String fileName = header.substring(header.indexOf("filename")+10, header.length()-1);
		String sever_path = this.getServletContext().getRealPath("upLoadPic");
		part.write(sever_path+"/"+fileName);
		part.delete();
		
		index.setiName(iName);
		index.setiSName(iSName);
		index.setiPic("upLoadPic/" + fileName);
		index.setiUrl(iUrl);
		index.setiKind(iKind);

		try {
			impl.addIndex(index);
			response.sendRedirect(request.getContextPath()+"/Backstage/adv/adv_list.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//删除广告
	DeleteService deleteService = new DeleteService();
	public void delPage_admin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int iId = Integer.parseInt(request.getParameter("iId"));
		try {
			deleteService.deleteIndex(iId);
			response.sendRedirect(request.getContextPath()+"/Backstage/adv/adv_list.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
