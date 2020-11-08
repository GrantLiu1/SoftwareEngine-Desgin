package com.shop.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.shop.entity.Goods;
import com.shop.entity.User;
import com.shop.service.DeleteService;
import com.shop.service.GoodsService;
import com.shop.service.UserCheckService;
import com.shop.service.UserService;

@MultipartConfig
@WebServlet("/user")
public class UserServlet extends BaseServlet{
	UserService service = new UserService();
	//买家注册
	public void regist(HttpServletRequest request,HttpServletResponse response)
			throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");	
		User user=new User();
		
		String userName = request.getParameter("userName");
		String userPwd = request.getParameter("userPwd");
		String nickName = request.getParameter("nickName");
		String phone = request.getParameter("phone");
		String idnum = request.getParameter("IDNum");
				
		user.setUserName(userName);
		user.setUserPwd(userPwd);
		user.setHeadPic("upLoadPic/morentouxiang.png");
		user.setNickName(nickName);
		user.setIDNum(idnum);
		user.setPhone(phone);
			
		service.regist(user);
		request.getRequestDispatcher("/Reception/login.jsp").forward(request, response);
	}
	//买家登录
	public void login(HttpServletRequest request,HttpServletResponse response)
			throws ServletException,IOException{
		HttpSession session = request.getSession();
		User user =null;
		
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("userName");
		String password = request.getParameter("userPwd");
		
		//将用户名和密码传递给service层
		user = service.login(username,password);
		if(user!=null){
			//登录成功
			//***************判断用户是否勾选了自动登录*****************
			String autoLogin = request.getParameter("autoLogin");
			if("true".equals(autoLogin)){
				//要自动登录
				//创建存储用户名的cookie
				Cookie cookie_username = new Cookie("cookie_username",user.getUserName());
				cookie_username.setMaxAge(10*60);
				//创建存储密码的cookie
				Cookie cookie_password = new Cookie("cookie_password",user.getUserPwd());
				cookie_password.setMaxAge(10*60);

				response.addCookie(cookie_username);
				response.addCookie(cookie_password);
			}

			//***************************************************
			//将user对象存到session中
			session.setAttribute("user", user);
			
			String seller =request.getParameter("seller");
			if("true".equals(seller)) {
				if(!user.isUserType()) {
					response.setContentType("text/html; charset=utf-8"); 
					response.getWriter().println("<script language='javascript'>alert('身份不符!');location.href='Reception/login.jsp'</script>");
				}else {
					response.sendRedirect("Seller/sellerHome.jsp");
				}	
			}else
			//重定向到首页
			request.getRequestDispatcher("/Reception/default.jsp").forward(request, response);
		}else{
			response.setContentType("text/html; charset=utf-8"); 
			response.getWriter().println("<script language='javascript'>alert('账号或密码错误!');location.href='Reception/login.jsp'</script>");
		}
	}
	
	public void findSellerById(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException, IOException {
		Integer userId = Integer.parseUnsignedInt(request.getParameter("id"));
		UserService userService = new UserService();
		User seller = userService.findUserById(userId);
		GoodsService goodsService = new GoodsService();
		List<Goods> goodsList = goodsService.findGoodsListByUserId(userId);
		
		request.setAttribute("seller", seller);
		request.setAttribute("goodsList", goodsList);
		request.getRequestDispatcher("/Reception/seller_info.jsp").forward(request, response);
	}
	//买家退出登录
	public void exit(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException, IOException {
		Cookie cookie_username = new Cookie("cookie_username","");
		cookie_username.setMaxAge(10*60);
		Cookie cookie_password = new Cookie("cookie_password","");
		cookie_password.setMaxAge(10*60);
		response.addCookie(cookie_username);
		response.addCookie(cookie_password);
		request.getSession().removeAttribute("user");
		request.getRequestDispatcher("/Reception/default.jsp").forward(request, response);
	}
	//买家信息更新
	public void update_info(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");	
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		String nickName = request.getParameter("nickName");
		String phone = request.getParameter("phone");
		
		user.setPhone(phone);
		user.setNickName(nickName);
		service.updateInfo(user);
		request.getRequestDispatcher("/Reception/user_info.jsp").forward(request, response);
	}
	//买家更新密码
	public void update_PWD(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");	
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		String userPwd = request.getParameter("new_pwd1");
		user.setUserPwd(userPwd);
		service.updatePWD(user);
		exit(request,response);
	}
	//管理员拒绝买家申请成卖家
	UserCheckService uImpl = new UserCheckService();
	public void cancelUser_admin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int userId = Integer.parseInt(request.getParameter("userId"));
		try {
			uImpl.cancelUser(userId);
			response.sendRedirect(request.getContextPath()+"/Backstage/user/user_check.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	//管理员拒绝买家申请成快递员
	public void cancelUser_k(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int userId = Integer.parseInt(request.getParameter("userId"));
		try {
			uImpl.cancelkUser(userId);
			response.sendRedirect(request.getContextPath()+"/Backstage/user/kuser_check.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	//管理员删除用户
	DeleteService deleteService = new DeleteService();	
	public void delUser_admin(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int userId = Integer.parseInt(request.getParameter("userId"));
		try {
			deleteService.deleteUser(userId);
			//System.out.println("ok");
			response.sendRedirect(request.getContextPath()+"/Backstage/user/user_list.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//管理员退出登录
	public void exit_admin(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int action = Integer.parseInt(request.getParameter("action"));
		System.out.println("x:"+action);
		if(1 == action) {
			response.sendRedirect(request.getContextPath()+"/Backstage/login.jsp");
		}else {
			response.sendRedirect(request.getContextPath()+"/Backstage/backstage.jsp");
			
		}
	}
	//管理员登录
	public void login_admin(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("username");
		String pwd = request.getParameter("password");
		if("admin".equals(userId) && "123".equals(pwd)) {
			response.setContentType("text/html; charset=UTF-8"); //转码
		    PrintWriter out = response.getWriter();
		    out.println("<script>");
		    out.println("alert('登录成功！');");
		    out.println("window.location.href='Backstage/backstage.jsp'");
		    out.println("</script>");
		}else {
			response.setContentType("text/html; charset=UTF-8"); //转码
		    PrintWriter out = response.getWriter();
		    out.print("<title>错误提示</title>");
		    out.println("<script>");
		    out.println("alert('帐号或密码错误！');");
		    out.println("window.location.href='Backstage/login.jsp'");
		    out.println("</script>");
		}
	}
	//管理员通过买家申请卖家
	public void proveUser_admin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int userId = Integer.parseInt(request.getParameter("userId"));
			try {
				uImpl.proveUser(userId);
				response.sendRedirect(request.getContextPath()+"/Backstage/user/user_check.jsp");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

	//管理员通过买家申请快递员
	public void proveUser_k(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int userId = Integer.parseInt(request.getParameter("userId"));
		try {
			uImpl.provekUser(userId);
			response.sendRedirect(request.getContextPath()+"/Backstage/user/kuser_check.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//买家发起卖家身份申请
	public void updateuCheck(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		user.setuCheck(true);
		uImpl.updateuCheck(user);
		request.getRequestDispatcher("/Reception/user_info.jsp").forward(request, response);
	}
	//买家发起快递员身份申请
	public void updatekCheck(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		user.setkCheck(true);
		uImpl.updatekCheck(user);
		request.getRequestDispatcher("/Reception/user_info.jsp").forward(request, response);
	}
	//卖家修改 昵称 手机号
	public void seller_update_info(HttpServletRequest request,HttpServletResponse response)
			throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");	
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		System.out.println("开始修改信息");
		
		String nickName = request.getParameter("nickName");
		String phone = request.getParameter("phone");
		
		System.out.println("昵称:"+nickName+",手机号:"+phone);
		
		user.setPhone(phone);
		user.setNickName(nickName);
		service.seller_updateInfo(user);

		response.sendRedirect(request.getContextPath()+"/Seller/personal/sellerInform.jsp");
	}
		
	//卖家修改头像
	public void seller_updateHeadPic(HttpServletRequest request,HttpServletResponse response)
			throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");	
		System.out.println("开始修改头像！");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Part part = request.getPart("spic");
		String header = part.getHeader("content-disposition");
		System.out.println("header:"+header);
		String fileName = header.substring(header.indexOf("filename")+10, header.length()-1);
		System.out.println("fileName:"+fileName);
		String sever_path = this.getServletContext().getRealPath("upLoadPic");
		part.write(sever_path+"/"+fileName);
		System.out.println("Pic:"+sever_path+"/"+fileName);
		part.delete();
		user.setHeadPic("upLoadPic/"+fileName);

		service.seller_updateHeadPic(user.getHeadPic(),user.getUserID());
		String nickName = request.getParameter("nickName");
		String phone = request.getParameter("phone");
		
		user.setPhone(phone);
		user.setNickName(nickName);
		service.seller_updateInfo(user);

		response.sendRedirect(request.getContextPath()+"/Seller/personal/sellerInform.jsp");
		
	}
}
