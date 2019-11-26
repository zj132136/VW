package com.bq.plan;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import com.bq.util.DB;
import java.util.Date;

public class OverPlanCount {
	private String planname;
	private String tjm;
	private Date qssj;
	private Date jssj;
	private String testpeople;
	private String engineer;
	private String content;
	private String state;
	public String getPlanname() {
		return planname;
	}
	public void setPlanname(String planname) {
		this.planname = planname;
	}
	public String getTjm() {
		return tjm;
	}
	public void setTjm(String tjm) {
		this.tjm = tjm;
	}
	public Date getQssj() {
		return qssj;
	}
	public void setQssj(Date qssj) {
		this.qssj = qssj;
	}
	public Date getJssj() {
		return jssj;
	}
	public void setJssj(Date jssj) {
		this.jssj = jssj;
	}
	public String getTestpeople() {
		return testpeople;
	}
	public void setTestpeople(String testpeople) {
		this.testpeople = testpeople;
	}
	public String getEngineer() {
		return engineer;
	}
	public void setEngineer(String engineer) {
		this.engineer = engineer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	public static int count(){
		java.util.Date nowdate=new java.util.Date(); 
		Connection conn = null;
		int i =0;
		ResultSet rs = null;	
			try {
				conn = DB.getConn();	
				String sql ="select * from plan ";
				rs = DB.executeQuery(conn, sql);
				SimpleDateFormat a=new SimpleDateFormat("yyyy-MM-dd");			
				while(rs.next()){							
					String  sjssj = a.format(rs.getDate("jssj"));
					Date jssj = a.parse(sjssj);
					boolean flag = jssj.before(nowdate);
					boolean flags = rs.getString("state").equals("���·�");
					if(flag && flags){
						i ++;			
					}	
				}				
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ParseException e) {
				e.printStackTrace();
			}finally{
				DB.closeRs(rs);
				DB.closeConn(conn);
				
			}
			return i;	
		    
	}

}
