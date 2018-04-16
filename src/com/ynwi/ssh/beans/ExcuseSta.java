package com.ynwi.ssh.beans;

public class ExcuseSta {
	private int excuseId;
	private String name;
	private String durationSta;
	private String type;
	private String reason;
	private String dateTime;
	private float duration;
	private String type1Duration;
	private String type2Duration;
	private String type3Duration;
	private String overtimeDuration;
	private int status;
	
	public String getType1Duration() {
		return type1Duration;
	}
	public void setType1Duration(String type1Duration) {
		this.type1Duration = type1Duration;
	}
	public String getType2Duration() {
		return type2Duration;
	}
	public void setType2Duration(String type2Duration) {
		this.type2Duration = type2Duration;
	}
	public String getType3Duration() {
		return type3Duration;
	}
	public void setType3Duration(String type3Duration) {
		this.type3Duration = type3Duration;
	}
	public String getOvertimeDuration() {
		return overtimeDuration;
	}
	public void setOvertimeDuration(String overtimeDuration) {
		this.overtimeDuration = overtimeDuration;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getExcuseId() {
		return excuseId;
	}
	public void setExcuseId(int excuseId) {
		this.excuseId = excuseId;
	}
	
	public String getDateTime() {
		return dateTime;
	}
	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}
	public float getDuration() {
		return duration;
	}
	public void setDuration(float duration) {
		this.duration = duration;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDurationSta() {
		return durationSta;
	}
	public void setDurationSta(String string) {
		this.durationSta = string;
	}
	@Override
	public String toString() {
		return "ExcuseSta [excuseId=" + excuseId + ", name=" + name
				+ ", durationSta=" + durationSta + ", type=" + type
				+ ", reason=" + reason + ", dateTime=" + dateTime
				+ ", duration=" + duration + ", type1Duration=" + type1Duration
				+ ", type2Duration=" + type2Duration + ", type3Duration="
				+ type3Duration + ", overtimeDuration=" + overtimeDuration
				+ ", status=" + status + "]";
	}
	
	
}
