package com.bq.maintain;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.bq.util.DB;

public class acknowledgement {
	
public static int count(){
		Connection conn = null;
		int i =0;
		ResultSet rs = null;	
			try {
				conn = DB.getConn();	
				String sql ="select * from maintain ";
				rs = DB.executeQuery(conn, sql);	
				while(rs.next()) {		
					if((rs.getString("acknowledgement")==null || rs.getString("acknowledgement") ==""|| rs.getString("acknowledgement").length()==0) && rs.getString("repairPeople")!=null && rs.getString("repairPeople") !=""&& rs.getString("repairPeople").length()!=0){
					i++;
					}	
				}				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				DB.closeRs(rs);
				DB.closeConn(conn);		
			}
			return i;	   
	}
}
