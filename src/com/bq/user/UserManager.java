package com.bq.user;

import java.sql.*;
import java.util.*;

import com.bq.util.DB;
public class UserManager {
	public static List<User> getUsers(){
		List<User> list = new ArrayList<User>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DB.getConn();
			stmt = DB.getStmt(conn);
			rs = stmt.executeQuery("select * from user ");
			while(rs.next()){
				User u = new User();
				u.setId(rs.getInt("id"));
				u.setUsername(rs.getString("username"));
				u.setPhone(rs.getString("phone"));
				
				u.setPassword(rs.getString("password"));
				list.add(u);
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DB.closeRs(rs);
			DB.closeStatement(stmt);
			DB.closeConn(conn);
		}
		return list;
	}
	public static void deleteUser(int id){
		Connection conn = null;
		Statement stmt = null;
		
		try {
			conn = DB.getConn();
			stmt = DB.getStmt(conn);
			stmt.executeUpdate("delete from user where id =" + id);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
		
			DB.closeStatement(stmt);
			DB.closeConn(conn);
		}
	}
}
