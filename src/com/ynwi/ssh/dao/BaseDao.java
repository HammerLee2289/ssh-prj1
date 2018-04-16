package com.ynwi.ssh.dao;

import java.util.List;

import org.hibernate.HibernateException;

import com.ynwi.ssh.beans.Excuse;
import com.ynwi.ssh.beans.User;
import com.ynwi.ssh.forms.ExcuseForm;

public interface BaseDao {

	public void saveObject(Object obj) throws HibernateException;// 保存对象

	public User selectUser(User user) throws HibernateException;// 登录
	
	public void updateUser(User user) throws HibernateException;// 更新User

	public List<Excuse> getAllExcuse() throws HibernateException;// 查找excuse所有记录
	
	public List<User> getAllUserByName(String stuffName) throws HibernateException;// 查找user所有记录
	
	public List<Excuse> getAllStuffExcuse() throws HibernateException;// 查找所有员工请假申请记录
	
	public List<Excuse> getExcuseByFilter() throws HibernateException;// 查找excuse所有记录

	public void deleteExcuse(int excuseId) throws HibernateException;// 根据excuseId删除excuse

	public void updateExcuse(ExcuseForm excuse) throws HibernateException;//根据excuseId更新excuse

	public void agreeStuffExcuse(int excuseId) throws HibernateException;//同意员工请假

	public User findUserByUserName(String username) throws HibernateException;//根据username查找user

}