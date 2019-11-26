package com.bq.user;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.bq.util.DB;




public class User {

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getYgh() {
		return ygh;
	}

	public void setYgh(String ygh) {
		this.ygh = ygh;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	private String username;
	private String password;
	private String phone;
	private String department;
	private String ygh;
	private int id;
	private String quanxian;
	public String getQuanxian() {
		return quanxian;
	}

	public void setQuanxian(String quanxian) {
		this.quanxian = quanxian;
	}

	public String getRule() {
		return rule;
	}

	public void setRule(String rule) {
		this.rule = rule;
	}
	private String rule;
	
	
	public void save(){
		Connection conn = null;
		PreparedStatement pstmt =null;
			try {
				conn = DB.getConn();
				
				String sql ="insert into user values(null,?,?,?,?,?)";
				
				pstmt = DB.getPStmt(conn, sql);
				pstmt.setString(1,username);
				pstmt.setString(2,password);
				pstmt.setString(3,phone);
				pstmt.setString(4,department);
				pstmt.setString(5,ygh);
			//pstmt.setTimestamp(5, rdate);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				DB.closeStmt(pstmt);
				DB.closeConn(conn);
				
			}
		
		
	}
	
	public static List<User> getUsers(){
		List<User> list = new ArrayList<User>();
		Connection conn = null;
		ResultSet rs = null;
		try {
			conn = DB.getConn();
			String sql = "Select * from User";
			rs = DB.executeQuery(conn, sql);
			while(rs.next()){
				User u = new User();
				u.setId(rs.getInt("id"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setDepartment(rs.getString("department"));;
				u.setYgh(rs.getString("ygh"));
				list.add(u);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
		}
		return list;
		
	}
	public static User validate(String username, String password) throws UserNotFoundException,PasswordNotCorrectException{
		Connection conn = null;
		ResultSet rs = null;
		User u = null; 
		try {
			conn = DB.getConn();
			String sql = "select * from user where username ='"+ username +"'";
			rs = DB.executeQuery(conn, sql);
			if(!rs.next()){
				throw new UserNotFoundException();
			}else if(!rs.getString("password").equals(password)){
				throw new PasswordNotCorrectException();
			}else{
				u = new User();
				u.setId(rs.getInt("id"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setDepartment(rs.getString("department"));;
				u.setYgh(rs.getString("ygh"));
				u.setQuanxian(rs.getString("quanxian"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DB.closeRs(rs);
			DB.closeConn(conn);
		}
		
		return u;
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

	public void update() {
		Connection conn = DB.getConn();
		String sql = "update user set username = ?, password = ? ,phone = ?, department = ? , ygh = ? where id=" + this.id;
		
		PreparedStatement pstmt = DB.getPStmt(conn, sql);
		try {
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			pstmt.setString(3, phone);
			pstmt.setString(4, department);
			pstmt.setString(5, ygh);
			System.out.println(sql);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			DB.closeStmt(pstmt);
			DB.closeConn(conn);
		}
	}
	
}
