package com.ynwi.ssh.beans;

public class Mail {
	private String address;
	private String tittle;
	private String content;
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTittle() {
		return tittle;
	}
	public void setTittle(String tittle) {
		this.tittle = tittle;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "Mail [address=" + address + ", tittle=" + tittle
				+ ", contentString=" + content + "]";
	}
	
	
}
