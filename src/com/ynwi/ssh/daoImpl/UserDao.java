package com.ynwi.ssh.daoImpl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.ynwi.ssh.beans.Excuse;
import com.ynwi.ssh.beans.User;
import com.ynwi.ssh.dao.BaseDao;
import com.ynwi.ssh.forms.ExcuseForm;

public class UserDao implements BaseDao {

	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	private Session getCurrentSession() {
		return sessionFactory.openSession();
		// return sessionFactory.getCurrentSession();

	}

	@Override
	public void saveObject(Object obj) throws HibernateException {
		this.getCurrentSession().save(obj);
	}
	
	//修改用户  
    public void updateUser(User user) throws HibernateException {  
    	System.out.println(user);
         Session session = this.getCurrentSession();  
         session.beginTransaction();  	
         String hql = ("update User u set u.password = ?,u.gender = ? ,u.emailAddress = ? ,u.address = ? ,u.tel = ? where u.username = ?");    
         Query query = session.createQuery(hql);  
         query.setParameter(0, user.getPassword());  
         query.setParameter(1, user.getGender());  
         query.setParameter(2, user.getEmailAddress());  
         query.setParameter(3, user.getAddress());
         query.setParameter(4, user.getTel());
         query.setParameter(5, user.getUsername());
         query.executeUpdate();  
         session.getTransaction().commit();               
    } 

	@SuppressWarnings("unchecked")
	@Override
	public User selectUser(User user) throws HibernateException {
		String hql = "from User where userName=? and password=?";
		Query query = this.getCurrentSession().createQuery(hql);
		query.setString(0, user.getUsername());
		query.setString(1, user.getPassword());
		List<User> list = query.list();
		if (list == null || list.size() == 0) {
			throw new RuntimeException("查询失败");
		}
		return list.get(0);
		// 查找User

	}
	
	@SuppressWarnings("unchecked")
	@Override
	public User findUserByUserName(String username) throws HibernateException {
		String hql = "from User where userName=?";
		Query query = this.getCurrentSession().createQuery(hql);
		query.setString(0, username);
		List<User> list = query.list();
		if (list == null || list.size() == 0) {	
			return null;
		}
		return list.get(0);
		// 查找User

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Excuse> getAllExcuse() throws HibernateException {
		Query query = this.getCurrentSession().createQuery("from Excuse");
		List<Excuse> list = query.list();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<User> getAllUserByName(String stuffName) throws HibernateException {
		Query query = this.getCurrentSession().createQuery("from User u where u.username='"+stuffName+"'");
		List<User> list = query.list();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Excuse> getAllStuffExcuse() throws HibernateException {
		Query query = this.getCurrentSession().createQuery("from Excuse e where e.status=0");
		List<Excuse> list = query.list();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Excuse> getExcuseByFilter() throws HibernateException {
		Query query = this.getCurrentSession().createQuery("from Excuse");
		List<Excuse> list = query.list();
		return list;
	}

	@Override
	public void deleteExcuse(int excuseId) throws HibernateException {
		this.getCurrentSession()
				.createQuery("delete Excuse e where e.excuseId=" + excuseId)
				.executeUpdate();

	}
	
	@Override
	public void agreeStuffExcuse(int excuseId) throws HibernateException {
		this.getCurrentSession()
				.createQuery("update Excuse e set e.status=1 where e.excuseId=" + excuseId)
				.executeUpdate();

	}

	@Override
	public void updateExcuse(ExcuseForm excuse) throws HibernateException {
		System.out.println(excuse);
		Session session = this.getCurrentSession();
		session.beginTransaction();
		String hql = ("update Excuse e set e.name = ?,e.type = ?,e.reason = ?,e.dateTime = ? ,e.duration = ?  where e.excuseId = ?");
		Query query = session.createQuery(hql);
		query.setParameter(0, excuse.getName());
		query.setParameter(1, excuse.getType());
		query.setParameter(2, excuse.getReason());
		query.setParameter(3, excuse.getDateTime());
		query.setParameter(4, excuse.getDuration());
		query.setParameter(5, excuse.getExcuseId());
		query.executeUpdate();
		session.getTransaction().commit();

	}

}