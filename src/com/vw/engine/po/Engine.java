package com.vw.engine.po;

public class Engine {
	private int engineId;
	private String engineName;
	private String addByUser;
	private String addDatetime;
	public int getEngineId() {
		return engineId;
	}
	public void setEngineId(int engineId) {
		this.engineId = engineId;
	}
	public String getEngineName() {
		return engineName;
	}
	public void setEngineName(String engineName) {
		this.engineName = engineName;
	}
	
	public String getAddByUser() {
		return addByUser;
	}
	public void setAddByUser(String addByUser) {
		this.addByUser = addByUser;
	}
	public String getAddDatetime() {
		return addDatetime;
	}
	public void setAddDatetime(String addDatetime) {
		this.addDatetime = addDatetime;
	}

}
