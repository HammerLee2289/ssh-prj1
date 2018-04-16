package com.ynwi.ssh.service;

import java.util.List;

import com.ynwi.ssh.beans.Excuse;
import com.ynwi.ssh.beans.ExcuseSta;
import com.ynwi.ssh.beans.User;
import com.ynwi.ssh.forms.ExcuseForm;
import com.ynwi.ssh.forms.UserForm;
import com.ynwi.ssh.util.PageBean;

public interface UserManager {

	public void regUser(UserForm user);

	public void loginUser(UserForm user);
	
	public void updateUser(UserForm user);

	public void newExcuse(ExcuseForm excuse);

	public void deleteExcuse(int excuseId);

	public List<Excuse> getAllExcuse();
	
	public List<User> getAllUserByName(String stuffName);

	public void updateExcuse(ExcuseForm excuse);

	/**
	 * 分页查询
	 * 
	 * @param pageSize
	 *            每页显示多少记录
	 * @param currentPage
	 *            当前页
	 * @return 封装了分页信息的bean
	 */
	public PageBean queryForPage(int pageSize, int page, ExcuseForm excuse, int isSta);

	List<Excuse> getExcuseByFilter(ExcuseForm excuse);

	List<ExcuseSta> getExcuseStaByFilter(ExcuseForm excuse);

	public List getAllStuffExcuse();//插叙员工请假申请

	public void agreeStuffExcuse(int excuseId);

	public User findUserByUserName(String username);

}