package com.zgx.util;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class DbUtil {
	
	private static String url="";
	private static String username="";
	private static String password="";
	
	//静态初始化块
	static{
		
		Properties properties=new Properties();
		
		try {
			
			InputStream in= DbUtil.class.getClassLoader().getResourceAsStream("jdbc.properties");
			properties.load(in);//加载的驱动的jar包
			//读取配置
			url=properties.getProperty("url");
			username=properties.getProperty("username");
			password=properties.getProperty("password");
			
			String driver=properties.getProperty("driver");
			
			//加载驱动
			Class.forName(driver);
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
			
		}
				
	}
	
	//获取数据库连接
	public static Connection getConnection() throws SQLException
	{
		return DriverManager.getConnection(url, username, password);
	}
	
	//关闭资源
	public static void close(Connection conn,PreparedStatement ps,ResultSet rs)
	{		
		try {
			if (conn!=null) {
				conn.close();
			}
			if (ps!=null) {
				ps.close();
			}
			if (rs!=null) {
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}
