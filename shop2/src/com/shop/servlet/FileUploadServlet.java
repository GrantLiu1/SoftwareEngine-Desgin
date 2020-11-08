package com.shop.servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

import com.shop.entity.User;
import com.shop.service.UserService;

@WebServlet("/fileUpload")
public class FileUploadServlet extends BaseServlet {

	public void userPic(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			
			// 1 创建磁盘文件项工厂
			DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
			// 2 设置缓存区的大小，如果文件的大小超过了缓冲区的大小，就会产生临时文件
			diskFileItemFactory.setSizeThreshold(3 * 1024 * 1024);
			// 获得核心解析类
			ServletFileUpload fileUpload = new ServletFileUpload(diskFileItemFactory);
			// 解决文件上传乱码问题
			fileUpload.setHeaderEncoding("UTF-8");
			// 解析request 返回list集合
			List<FileItem> list = fileUpload.parseRequest(request);
			// 将遍历的值存入到一个map集合中
			//Map<String, String> map = new HashMap<String, String>();
			String fileName = null;
			for (FileItem fileItem : list) {
				// 判断普通项和文件上传项
				/*if (fileItem.isFormField()) {
					// 普通项
					String name = fileItem.getFieldName();
					String value = fileItem.getString("utf-8");
					map.put(name, value);
				} else {*/
					// 文件上传项
					// 获得文件名
					fileName = fileItem.getName();
					// 获得文件的输入流：
					InputStream server_is = fileItem.getInputStream();
					// 获得文件要上传的路径
					String sever_path = this.getServletContext().getRealPath("upLoadPic");
					
					OutputStream server_os = new FileOutputStream(sever_path + "/" + fileName);
					
					IOUtils.copy(server_is, server_os);
					server_is.close();
					server_os.close();
					fileItem.delete();
					//map.put("pimage", "upload/" + fileName);
				//}
			}
			
			String headPic = "upLoadPic/" + fileName;
			UserService userService = new UserService();
			userService.updateHeadPic(headPic,user.getUserID());
			user.setHeadPic(headPic);
			session.setAttribute("user", user);
			response.sendRedirect(request.getContextPath()+"/Reception/myhome.jsp");
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
