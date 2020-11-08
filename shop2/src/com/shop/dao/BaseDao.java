package com.shop.dao;

/**
 * 导入jar包
 * 加载驱动
 * 创建数据池连接
 * 编写sql语句
 * 创建PreparedStatement语句发送sql语句
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shop.mapper.RowMapper;

public class BaseDao {
	private static final String DRIVER ="com.mysql.jdbc.Driver";
	private static final String URL ="jdbc:mysql://localhost:3306/shop"+"?useUnicode=true&characterEncoding=UTF-8";
	private static final String USER ="root";
	private static final String PWD ="root";
	
	static{
		try {
			Class.forName(DRIVER);
			//System.out.println("加载成功");
		} catch (ClassNotFoundException e) {
			System.out.println("加载失败！");
			e.printStackTrace();
		}//加载驱动
	}
	
	public static void excuteUpdate(String sql,Object...params){
		try {
			Connection conn = DriverManager.getConnection(URL, USER,PWD);//创建连接
			PreparedStatement pstmt = conn.prepareStatement(sql);
			//给占位符赋值
			for(int i=0 ; i < params.length ; i++){
				pstmt.setObject((i+1),params[i]);
			}
			
			int count = pstmt.executeUpdate();
			if(count > 0){
				System.out.println("修改成功");
			}else{
				System.out.println("修改失败");
			}
			conn.close();
		} catch (SQLException e) {
			System.out.println("创建连接失败");
			e.printStackTrace();
		}
	}
	
	public static List excuteQuery(String sql,RowMapper rowMapper,Object...params){
		ArrayList list= new ArrayList();
		try {
			Connection conn = DriverManager.getConnection(URL,USER,PWD);//创建连接
			//System.out.println("创建连接成功");
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			//给占位符赋值
			for(int i=0 ; i < params.length ; i++){
				pstmt.setObject((i+1),params[i]);
			}
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				Object obj= rowMapper.mapperObject(rs);
				list.add(obj);
			}
			conn.close();
		}catch (SQLException e) {
			System.out.println("创建连接失败");
			e.printStackTrace();
		}
		return list;
	}
	
	public static Integer excuteQueryCount(String sql,Object...params) {
		Integer count = 0;
		try {
			Connection conn = DriverManager.getConnection(URL,USER,PWD);//创建连接
			//System.out.println("创建连接成功");
			PreparedStatement pstmt = conn.prepareStatement(sql);
			//System.out.println(count);
			//给占位符赋值
			for(int i=0 ; i < params.length ; i++){
				pstmt.setObject((i+1),params[i]);
			}
			ResultSet set = pstmt.executeQuery();
			while(set.next()) {
				count = set.getInt(1);
			}
			conn.close();
		}catch (SQLException e) {
				System.out.println("创建连接失败");
				e.printStackTrace();
		}
		return count;
		
	}
}