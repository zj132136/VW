package com.bq.maintain;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.bq.util.DB;

public class Maintain {
	public String getMaintainNum() {
		return maintainNum;
	}
	public void setMaintainNum(String maintainNum) {
		this.maintainNum = maintainNum;
	}
	public String getEquipmentNum() {
		return equipmentNum;
	}
	public void setEquipmentNum(String equipmentNum) {
		this.equipmentNum = equipmentNum;
	}
	public String getEquipmentName() {
		return equipmentName;
	}
	public void setEquipmentName(String equipmentName) {
		this.equipmentName = equipmentName;
	}
	public String getEquipmentType() {
		return equipmentType;
	}
	public void setEquipmentType(String equipmentType) {
		this.equipmentType = equipmentType;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getMaintainRequestPeople() {
		return maintainRequestPeople;
	}
	public void setMaintainRequestPeople(String maintainRequestPeople) {
		this.maintainRequestPeople = maintainRequestPeople;
	}
	public String getMaintainRequestTime() {
		return maintainRequestTime;
	}
	public void setMaintainRequestTime(String maintainRequestTime) {
		this.maintainRequestTime = maintainRequestTime;
	}
	public String getExperInfo() {
		return experInfo;
	}
	public void setExperInfo(String experInfo) {
		this.experInfo = experInfo;
	}
	public String getMalfunction() {
		return malfunction;
	}
	public void setMalfunction(String malfunction) {
		this.malfunction = malfunction;
	}
	public String getRepairTime() {
		return repairTime;
	}
	public void setRepairTime(String repairTime) {
		this.repairTime = repairTime;
	}
	private String maintainNum;
	private String equipmentNum;
	private String equipmentName;
	private String equipmentType;
	private String department;
	private String maintainRequestPeople;
	private String maintainRequestTime;
	private String experInfo;
	private String malfunction;
	private String repairTime;
	
	public static int count(){
		
		Connection conn = null;
		int i =0;
		ResultSet rs = null;	
			try {
				conn = DB.getConn();	
				String sql ="select * from maintain ";
				rs = DB.executeQuery(conn, sql);
					
				while(rs.next()) {	
					
					if((rs.getString("repairPeople")==null || rs.getString("repairPeople") ==""|| rs.getString("repairPeople").length()==0) && rs.getString("maintainRequestPeople")!=null && rs.getString("maintainRequestPeople") !=""&& rs.getString("maintainRequestPeople").length()!=0){
				
					
						i ++;			
					}	
				}				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				DB.closeRs(rs);
				DB.closeConn(conn);
				
			}
			return i;	
		    
	}
}
