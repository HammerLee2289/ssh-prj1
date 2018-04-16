package com.ynwi.ssh.action;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ynwi.ssh.beans.Mail;
import com.ynwi.ssh.beans.User;
import com.ynwi.ssh.forms.UserForm;
import com.ynwi.ssh.service.UserManager;
import com.ynwi.ssh.util.SendMail;

public class UserAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	private UserForm user;
	private String username;

	private UserManager userManager;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public UserForm getUser() {
		return user;
	}

	public void setUser(UserForm user) {
		this.user = user;
	}

	public void setUserManager(UserManager userManager) {
		this.userManager = userManager;
	}

	public String register() {// 注册
		try {
			userManager.regUser(user);
			return SUCCESS;

		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public String login() {// 登录
		try {
			userManager.loginUser(user);
			return SUCCESS;

		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public String update() {// 更新
		try {
			userManager.updateUser(user);
			ActionContext.getContext().getSession().put("loginUser", user);
			return SUCCESS;

		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public String findUserByName() throws IOException {// 查找User ajax弹出员工个人信息卡
		User user = userManager.findUserByUserName(username);
		System.out.println(user);
		//ActionContext.getContext().getSession().put("userCard", user);// 点击员工姓名，弹出员工信息卡片，上记录着员工信息
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().println("<h3>");
		response.getWriter().println("<strong id='userCard-username'>"+user.getUsername()+"</strong>");
		response.getWriter().println("</h3>");
		response.getWriter().println("<p id='userCard-address'>");
		response.getWriter().println("<i class='fa fa-map-marker'></i>");
		response.getWriter().println("</p>");
		response.getWriter().println("<address>");
		response.getWriter().println("<strong>"+user.getAddress()+"</strong><br>");
		response.getWriter().println("E-mail:"+user.getEmailAddress()+"<br>");
		response.getWriter().println("Weibo:<br>");
		response.getWriter().println("<abbr title='Phone'>Tel:"+user.getTel()+"</abbr>");
		response.getWriter().println("</address>");
		return NONE;
	}

	public String checkUsername() throws IOException {// ajax用户名查重
		User user = userManager.findUserByUserName(username);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		if (user != null) {
			// 存在
			System.out.println("用户名已经存在");
			response.getWriter().println("<font color='red'>用户已经存在</font>");
		} else {
			System.out.println("用户名可以使用");
			response.getWriter().println("<font color='green'>用户名可以使用</font>");
		}
		return NONE;
	}
}