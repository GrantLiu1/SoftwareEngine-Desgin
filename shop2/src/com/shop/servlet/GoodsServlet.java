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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.shop.entity.Goods;
import com.shop.entity.Store;
import com.shop.entity.User;
import com.shop.entity.pageBean;
import com.shop.service.DeleteService;
import com.shop.service.EvaluationService;
import com.shop.service.GoodsCheckService;
import com.shop.service.GoodsService;
import com.shop.service.StoreService;
import com.shop.service.UserCheckService;
import com.shop.service.UserService;

@MultipartConfig
@WebServlet("/goodsServlet")
public class GoodsServlet extends BaseServlet {
	EvaluationService evaluationService = new EvaluationService();
	StoreService storeService = new StoreService();
	// 根据分类名称查询商品集合
	public void findGoodListByKindName(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 获得要查询的分类名
		String kindName = request.getParameter("kindName");
		// 获得当前页
		Integer currentPage = Integer.parseInt(request.getParameter("currentPage"));
		// 设每页显示的条数
		Integer rows = 18;
		if (currentPage <= 0) {
			currentPage = 1;
		}
		kindName = new String(kindName.getBytes("iso-8859-1"), "utf-8");
		GoodsService goodsService = new GoodsService();
		pageBean pageBean = goodsService.findGoodListBykindNamde(currentPage, rows, kindName);
		request.setAttribute("pageBean", pageBean);
		request.setAttribute("kindName", kindName);
		request.getRequestDispatcher("/Reception/product_list.jsp").forward(request, response);
	}

	// 根据id查询单个商品信息
	public void goodsInfo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Store store=null;
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String gId = request.getParameter("gId");
		GoodsService service = new GoodsService();
		UserService userService = new UserService();
		//查询该商品信息
		Goods goods = service.findGoodById(gId);
		if(user!=null)
			store = storeService.findStoreByUserIdandGId(user.getUserID(),Integer.parseInt(gId));
		User seller = userService.findUserById(goods.getUserID());
		request.setAttribute("goods", goods);
		request.setAttribute("store", store);
		request.setAttribute("seller", seller);
		request.getRequestDispatcher("/Reception/product_info.jsp").forward(request, response);
	}

	// 搜索商品功能 根据关键字查询商品
	public void findGoodListByKeyWord(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String keyWord = request.getParameter("keyWord");
		// 获得当前页
		Integer currentPage = Integer.parseInt(request.getParameter("currentPage"));
		// 设每页显示的条数
		Integer rows = 18;
		if (currentPage <= 0) {
			currentPage = 1;
		}
		GoodsService goodsService = new GoodsService();
		pageBean pageBean = goodsService.findGoodsListByKeyWord(keyWord,currentPage,rows);
		
		request.setAttribute("pageBean", pageBean);
		request.setAttribute("keyWord", keyWord);
		
		request.getRequestDispatcher("/Reception/product_list.jsp").forward(request, response);
	}
	//拒绝商品发布
		GoodsCheckService uImpl = new GoodsCheckService();
	public void cancelGoods_admin(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int gId = Integer.parseInt(request.getParameter("gId"));
			try {
				uImpl.cancelGoods(gId);
				response.sendRedirect(request.getContextPath()+"/Backstage/xs/goods_check.jsp");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	//删除商品
	DeleteService deleteService = new DeleteService();	
	public void delGoods_admin(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int gId = Integer.parseInt(request.getParameter("gId"));
		try {
			deleteService.deleteGoods(gId);
			response.sendRedirect(request.getContextPath()+"/Backstage/xs/goods.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//通过商品发布
	GoodsCheckService gImpl = new GoodsCheckService();
	public void proveGoods_admin(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int gId = Integer.parseInt(request.getParameter("gId"));
			try {
				gImpl.proveGoods(gId);
				response.sendRedirect(request.getContextPath()+"/Backstage/xs/goods_check.jsp");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	// 添加商品
	public void addGoods(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		Goods goods = new Goods();
		GoodsService service = new GoodsService(); 
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String gName = request.getParameter("gName");
		String gKind = request.getParameter("gKind");
		String gPrice = request.getParameter("gPrice");
		String gAmount = request.getParameter("gAmount");
		String gChar = request.getParameter("gChar");
		User user=(User)session.getAttribute("user");
		
		Part part1 = request.getPart("file1");
		String header1 = part1.getHeader("content-disposition");
		String fileName1 = header1.substring(header1.indexOf("filename")+10, header1.length()-1);
		String sever_path1 = this.getServletContext().getRealPath("upLoadPic");
		part1.write(sever_path1+"/"+fileName1);
		System.out.println("file1:"+fileName1);
		part1.delete();
		
		Part part2 = request.getPart("file2");
		String header2 = part2.getHeader("content-disposition");
		String fileName2 = header2.substring(header2.indexOf("filename")+10, header2.length()-1);
		String sever_path2 = this.getServletContext().getRealPath("upLoadPic");
		part2.write(sever_path2+"/"+fileName2);
		System.out.println("file2:"+fileName2);
		part2.delete();

		goods.setgName(gName);
		goods.setgKind(gKind);
		goods.setgPrice(Double.parseDouble(gPrice));
		goods.setgAmount(Integer.valueOf(gAmount));
		goods.setgChar(Double.parseDouble(gChar));
		goods.setgDes("upLoadPic/" + fileName2);
		goods.setgPic("upLoadPic/" + fileName1);
		goods.setUserID(user.getUserID());
		
		service.addGoods(goods);
		response.sendRedirect(request.getContextPath()+"/Seller/goods/goods_list.jsp");
		
	}
	
	// 修改商品
	public void updateGoods(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, SQLException { 
		GoodsService service = new GoodsService();  
		request.setCharacterEncoding("UTF-8");
		/*从对话框获取修改商品的信息*/
		String s1 = request.getParameter("s1");
		String s2 = request.getParameter("s2");
		
		int gId = Integer.parseInt(request.getParameter("gId"));
		String gName1 = request.getParameter("gName");
		String gKind1 = request.getParameter("gKind");
		int gAmount1 = Integer.parseInt(request.getParameter("gAmount"));
		double gPrice1 = Double.parseDouble(request.getParameter("gPrice"));
		double gChar1 = Double.parseDouble(request.getParameter("gChar"));
		
		String gDes1 = null;
		String gPic1 = null;
		
		/*从数据库取出对应商品编号的商品信息*/
		String gName2 = null;
		String gKind2 = null;
		String gDes2 = null;
		String gPic2 = null;
		int gAmount2 = 0;
		double gPrice2 = 0;
		double gChar2 = 0;
		
		List<Goods> list = service.selectOneGoods(gId);
		for(Goods goods:list){
			gName2 = goods.getgName();
			gKind2 = goods.getgKind();
			gDes2 = goods.getgDes();
			gPic2 = goods.getgPic();
			gAmount2 = goods.getgAmount();
			gPrice2 = goods.getgPrice();
			gChar2 = goods.getgChar();
		}
		
		if("1".equals(s1) && "2".equals(s2)) {
			Part part1 = request.getPart("file1");
			String header1 = part1.getHeader("content-disposition");
			String fileName1 = header1.substring(header1.indexOf("filename")+10, header1.length()-1);
			String sever_path1 = this.getServletContext().getRealPath("upLoadPic");
			part1.write(sever_path1+"/"+fileName1);
			gPic1 = "upLoadPic/" + fileName1;
			part1.delete();
			
			Part part2 = request.getPart("file2");
			String header2 = part2.getHeader("content-disposition");
			String fileName2 = header2.substring(header2.indexOf("filename")+10, header2.length()-1);
			String sever_path2 = this.getServletContext().getRealPath("upLoadPic");
			part2.write(sever_path2+"/"+fileName2);
			gDes1 = "upLoadPic/" + fileName2;
			part2.delete();
		}else if(! ("1".equals(s1)) && "2".equals(s2)) {
			Part part2 = request.getPart("file2");
			String header2 = part2.getHeader("content-disposition");
			String fileName2 = header2.substring(header2.indexOf("filename")+10, header2.length()-1);
			String sever_path2 = this.getServletContext().getRealPath("upLoadPic");
			part2.write(sever_path2+"/"+fileName2);
			gDes1 = "upLoadPic/" + fileName2;
			gPic1=gPic2;
			part2.delete();
		}else if( "1".equals(s1) && ! ("2".equals(s2))) {
			Part part1 = request.getPart("file1");
			String header1 = part1.getHeader("content-disposition");
			String fileName1 = header1.substring(header1.indexOf("filename")+10, header1.length()-1);
			String sever_path1 = this.getServletContext().getRealPath("upLoadPic");
			part1.write(sever_path1+"/"+fileName1);
			gPic1 = "upLoadPic/" + fileName1;
			gDes1 = gDes2;
			part1.delete();
		}else {
			gDes1 = gDes2;
			gPic1=gPic2;
		}	
		
		String gName = (gName1.equals(gName2)) ? gName2 : gName1;
		String gKind = (gKind1.equals(gKind2)) ? gKind2 : gKind1;
		String gDes = (gDes1.equals(gDes2)) ? gDes2 : gDes1;
		String gPic = (gPic1.equals(gPic2)) ? gPic2 : gPic1;
		int gAmount = (gAmount1 == gAmount2) ? gAmount2 : gAmount1;
		double gPrice = (gPrice1 == gPrice2) ? gPrice2 : gPrice1;
		double gChar = (gChar1 == gChar2) ? gChar2 : gChar1;
		
		if(gId != 0) {
			service.updateGoods(gName, gDes,gPic,gKind, gAmount, gPrice, gChar, gId);
			response.sendRedirect(request.getContextPath()+"/Seller/goods/goods_list.jsp");
		}
	}
	
	// 删除指定商品
	public void deleteGoods_seller(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, SQLException {
		GoodsService service = new GoodsService();  
		request.setCharacterEncoding("UTF-8");
		int gId = Integer.parseInt(request.getParameter("gId"));
		service.deleteGoods(gId);
		response.sendRedirect(request.getContextPath()+"/Seller/goods/goods_list.jsp");
	}
	
	// 查找指定商品的评价
	public void selectEvaOfGoods(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, SQLException {
		GoodsService service = new GoodsService();  
		request.setCharacterEncoding("UTF-8");
		int gId = Integer.parseInt(request.getParameter("gId"));
		service.selectEva(gId);
		response.sendRedirect(request.getContextPath()+"/Seller/goods/goods_list.jsp");
	}

}
