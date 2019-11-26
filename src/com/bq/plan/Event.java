package com.bq.plan;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

import com.bq.util.DB;

public class Event  {
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
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
	private String id;
	private String start_date;
	private String end_date;
	private String text;
	private String details;
	private String testpeople;
	private String engineer;
	private String content;
	private String state_id;

	public String getState_id() {
		return state_id;
	}
	public void setState_id(String state_id) {
		this.state_id = state_id;
	}
	public String getPlanname() {
		return planname;
	}
	public void setPlanname(String planname) {
		this.planname = planname;
	}

	public String getFdjxh() {
		return fdjxh;
	}
	public void setFdjxh(String fdjxh) {
		this.fdjxh = fdjxh;
	}
	public String getFdjbh() {
		return fdjbh;
	}
	public void setFdjbh(String fdjbh) {
		this.fdjbh = fdjbh;
	}
	private String planname;
	private String section_id;
	
	
	public String getSection_id() {
		return section_id;
	}
	public void setSection_id(String section_id) {
		this.section_id = section_id;
	}
	private String fdjxh;
	private String fdjbh;
	
	public static List<Event> getEvents(){
		List<Event> list = new ArrayList<Event>();
		Connection conn = null;
		ResultSet rs = null;
		try {
			conn = DB.getConn();
			String sql = "Select * from scheduler";
			rs = DB.executeQuery(conn, sql);
			while(rs.next()){
				Event e = new Event();
				e.setId(rs.getString("id"));
				e.setText(rs.getString("text"));		      
			    e.setStart_date(rs.getString("start_date"));
			    e.setEnd_date(rs.getString("end_date"));
			    e.setDetails(rs.getString("details"));
				list.add(e);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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


