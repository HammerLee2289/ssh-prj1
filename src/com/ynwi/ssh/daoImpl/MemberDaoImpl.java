package com.ynwi.ssh.daoImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import com.ynwi.ssh.beans.User;
import com.ynwi.ssh.dao.MemberDao;

public class MemberDaoImpl implements MemberDao {

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

	/**
	 * 查询所有的记录数
	 * 
	 * @param hql
	 *            查询条件
	 * @return 总记录数
	 */
	public int getAllRowCount(String hql) {
		return this.getCurrentSession().createQuery(hql).list().size();
	}

	/**
	 * 分页查询
	 * 
	 * @param hql
	 *            查询条件
	 * @param offset
	 *            开始记录
	 * @param length
	 *            一次查询几条记录
	 * @return 查询的记录集合
	 */
	@SuppressWarnings("unchecked")
	public List queryForPage(final String hql, final int offset,
			final int length) {
		Session session = this.getCurrentSession();
		Query q = session.createQuery(hql);
		q.setFirstResult(offset);
		q.setMaxResults(length);
		List list = q.list();
		session.close();
		return list;
	}
	
	public List getAllRow(String hql) {
		return this.getCurrentSession().createQuery(hql).list();
	}
}