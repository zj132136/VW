package com.bq.plan;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DataJson {	
    
   /*
    * ��ѯ��ݿ��е���ݡ�
    */
   public List getEvents() throws ClassNotFoundException {      	
      	List list = new ArrayList();
      	Class.forName("com.mysql.jdbc.Driver");
      	String url = "jdbc:mysql://localhost/bbs?user=root&password=132136";
      	
      	try {			
      		java.sql.Connection conn = DriverManager.getConnection(url);
          	String sql = "select * from scheduler ";
          	java.sql.Statement stmt = conn.createStatement();
          	ResultSet rs = stmt.executeQuery(sql);
				
				while (rs.next()) {  	
				  			  	  
				  list.add(rs.getString("event_id"));
				  list.add(rs.getString("event_name"));		      
				  list.add(rs.getDate("start_date"));
				  list.add(rs.getDate("end_date"));
			      
				 
				}
	
      	} catch (SQLException e1) {
                    	e1.printStackTrace();
      	} 	

      	return list;
}
   }
