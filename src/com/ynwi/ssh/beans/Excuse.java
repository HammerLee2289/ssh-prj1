package com.ynwi.ssh.beans;

public class Excuse {
	private int excuseId;
	private String name;
	private String type;
	private String reason;
	private String dateTime;
	private float duration;
	private float durationSta;
	private int status;
	
	public Excuse(){};
	
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public float getDurationSta() {
		return durationSta;
	}
	public void setDurationSta(float durationSta) {
		this.durationSta = durationSta;
	}
	public float getDuration() {
		return duration;
	}
	public void setDuration(float duration) {
		this.duration = duration;
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
	
	@Override
	public String toString() {
		return "Excuse [excuseId=" + excuseId + ", name=" + name + ", type="
				+ type + ", reason=" + reason + ", dateTime=" + dateTime
				+ ", duration=" + duration + ", durationSta=" + durationSta
				+ ", status=" + status + "]";
	}

}
