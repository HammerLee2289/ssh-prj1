package com.ynwi.ssh.forms;

import java.sql.Date;

public class ExcuseForm {
	@Override
	public String toString() {
		return "ExcuseForm [excuseId=" + excuseId + ", name=" + name
				+ ", type=" + type + ", reason=" + reason + ", dateTime="
				+ dateTime + ", dateTimeEnd=" + dateTimeEnd + ", duration="
				+ duration + ", status=" + status + "]";
	}
	private int excuseId;
	private String name;
	private String type;
	private String reason;
	private String dateTime;
	private String dateTimeEnd;
	private float duration;
	private int status;
	
	public float getDuration() {
		return duration;
	}
	public void setDuration(float duration) {
		this.duration = duration;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getDateTimeEnd() {
		return dateTimeEnd;
	}
	public void setDateTimeEnd(String dateTimeEnd) {
		this.dateTimeEnd = dateTimeEnd;
	}
	public int getExcuseId() {
		return excuseId;
	}
	public void setExcuseId(int excuseId) {
		this.excuseId = excuseId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getDateTime() {
		return dateTime;
	}
	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}
	
	public void initExcuse(){ //初始化excuse
		this.name = "";
		this.type = "";
		this.dateTime = "";
	}
	
	

}
