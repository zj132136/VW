package com.bq.plan;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

import com.bq.util.DB;

public class Utile {
	public List getEvent(String tjm){
		
		List list = new ArrayList();
		Connection conn = null;
		ResultSet rs = null;
		
		try { 
			conn = DB.getConn();
			String sql1 = "";
			if (tjm != null && !tjm.equals("")) {
			    sql1 = " and tjm = '" + tjm + "' ";
			//System.out.println("sql1 = "+sql1); 
			} 
       
			String sql = "Select * from plan where 1 = 1" + sql1;
			 System.out.println("222"+ sql);
			rs = DB.executeQuery(conn, sql);
			while(rs.next()){
				Event e = new Event();
				e.setText(rs.getString("planname"));
				e.setId(rs.getString("id"));
				e.setPlanname(rs.getString("planname"));
				e.setContent(rs.getString("content"));
				e.setFdjxh(rs.getString("fdjxh"));
				e.setFdjbh(rs.getString("fdjxh"));
			    e.setStart_date(rs.getString("qssj"));
			    e.setEnd_date(rs.getString("jssj"));	    
			    e.setTestpeople(rs.getString("testpeople"));
			    e.setEngineer(rs.getString("engineer"));
			    e.setState_id(rs.getString("state"));
				list.add(e);
				System.out.println("aa");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
		}
		return list;
		
	}
	
	
	
public List getEventTo(){
		
		List list = new ArrayList();
		Connection conn = null;
		ResultSet rs = null;
		
		try { 
			conn = DB.getConn();
			String sql = "Select * from plan where 1 = 1";
			 System.out.println("222"+ sql);
			rs = DB.executeQuery(conn, sql);
			while(rs.next()){
				Event e = new Event();
				e.setText(rs.getString("planname"));
				e.setId(rs.getString("id"));
				e.setPlanname(rs.getString("planname"));
				e.setContent(rs.getString("content"));
				e.setSection_id(rs.getString("tjm"));//
				e.setFdjxh(rs.getString("fdjxh"));
				e.setFdjbh(rs.getString("fdjxh"));
			    e.setStart_date(rs.getString("qssj"));
			    e.setEnd_date(rs.getString("jssj"));	    
			    e.setTestpeople(rs.getString("testpeople"));
			    e.setEngineer(rs.getString("engineer"));
			    e.setState_id(rs.getString("state"));
				list.add(e);
				System.out.println("aa");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
		}
		return list;
		
	}
	public List getTotal(){
		
		List list = new ArrayList();
		Connection conn = null;
		ResultSet rs = null;
		
		try { 
			conn = DB.getConn();
			String sql1 = "";
			
       
			String sql = "Select * from plan where 1 = 1" + sql1;
			 System.out.println("222"+ sql);
			rs = DB.executeQuery(conn, sql);
			while(rs.next()){
				Total t = new Total();
						      
			    t.setStart_date(rs.getString("qssj"));
			    t.setEnd_date(rs.getString("jssj"));	    
			   
				list.add(t);
				
			}
		} catch (SQLException t) {
			// TODO Auto-generated catch block
			t.printStackTrace();
		}finally{
			
		}
		return list;
		
	}
	
	 public String getEvnetsJSON(List list){
		   String jsonstr=null;
		   
		   if(list!=null||list.size()!=0){
			   JSONArray array = JSONArray.fromObject(list);
			   jsonstr = array.toString();
		   }
		   return jsonstr;
	   }
		
	}

