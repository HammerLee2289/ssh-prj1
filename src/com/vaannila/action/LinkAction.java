package com.vaannila.action;

import com.opensymphony.xwork2.ActionSupport;
import com.ynwi.ssh.service.UserManager;

public class LinkAction extends ActionSupport {

	private static final long serialVersionUID = -2613425890762568273L;
	private UserManager userManager;
	

	public UserManager getUserManager() {
		return userManager;
	}

	public void setUserManager(UserManager userManager) {
		this.userManager = userManager;
	}

	public String home()
	{
		return "home";		
	}
	
	public String faq()
	{
		return "faq";		
	}
	
	public String userAccount()
	{
		return "userAccount";		
	}
}
