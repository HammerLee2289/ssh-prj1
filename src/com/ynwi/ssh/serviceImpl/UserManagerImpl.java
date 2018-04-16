package com.ynwi.ssh.serviceImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.mapping.Map;
import org.springframework.beans.BeanUtils;

import com.opensymphony.xwork2.ActionContext;
import com.ynwi.ssh.beans.Excuse;
import com.ynwi.ssh.beans.ExcuseSta;
import com.ynwi.ssh.beans.User;
import com.ynwi.ssh.dao.BaseDao;
import com.ynwi.ssh.dao.MemberDao;
import com.ynwi.ssh.forms.ExcuseForm;
import com.ynwi.ssh.forms.UserForm;
import com.ynwi.ssh.service.UserManager;
import com.ynwi.ssh.util.PageBean;

public class UserManagerImpl implements UserManager {

	private BaseDao dao;
	private MemberDao memberDao;

	public BaseDao getDao() {
		return dao;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	public MemberDao getMemberDao() {
		return memberDao;
	}

	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	@Override
	// 注册
	public void regUser(UserForm userForm) throws HibernateException {
		System.out.print(userForm);
		User user = new User();
		BeanUtils.copyProperties(userForm, user);
		System.out.println(user);
		dao.saveObject(user);
	}

	@Override
	// 登录
	public void loginUser(UserForm userForm) throws HibernateException {
		User user = new User();
		BeanUtils.copyProperties(userForm, user);
		User loginUser=dao.selectUser(user);
		ActionContext.getContext().getSession().put("loginUser", loginUser);
		//System.out.println(dao.selectUser(user));
	}
	
	@Override
	// 更新User
	public void updateUser(UserForm userForm) throws HibernateException {
		User user = new User();
		BeanUtils.copyProperties(userForm, user);
		dao.updateUser(user);
	}
	
	@Override
	// 查找User
	public User findUserByUserName(String username) throws HibernateException {
		return dao.findUserByUserName(username);
	}

	@Override
	// 新建excuse
	public void newExcuse(ExcuseForm excuseForm) {
		Excuse excuse = new Excuse();
		System.out.println(excuseForm);
		BeanUtils.copyProperties(excuseForm, excuse);
		excuseForm.equals(null);
		System.out.println(excuse);
		dao.saveObject(excuse);

	}

	@Override
	// 查询所有excuse
	public List<Excuse> getAllExcuse() {
		List<Excuse> list = dao.getAllExcuse();
		return list;
	}
	
	@Override
	// 查询所有user
	public List<User> getAllUserByName(String stuffName) {
		List<User> list = dao.getAllUserByName(stuffName);
		return list;
	}
	
	@Override
	// 查询所有员工请假申请
	public List<Excuse> getAllStuffExcuse() {
		List<Excuse> list = dao.getAllStuffExcuse();
		return list;
	}

	@Override
	// 根据条件查询excuse
	public List<Excuse> getExcuseByFilter(ExcuseForm excuse) {
		String hql;
		if (excuse == null
				|| (excuse.getName().length() == 0
						&& excuse.getType().length() == 0
						&& excuse.getDateTime().length() == 0 && excuse
						.getDateTimeEnd().length() == 0)) {
			hql = "from Excuse e where e.status=1 order by e.excuseId"; // 查询语句
			System.out.println(hql);
			// System.out.println(excuse);
		} else {
			hql = "from Excuse e where e.status=1 and"; // 查询语句
			hql += " e.name like '%" + excuse.getName() + "%'";
			hql += " and e.type like '%" + excuse.getType() + "%'";
			if (excuse.getDateTime().length() != 0
					&& excuse.getDateTime().length() != 0) {
				hql += " and e.dateTime>='" + excuse.getDateTime()
						+ "' and e.dateTime<='" + excuse.getDateTimeEnd() + "'";
			}
			hql += " order by e.excuseId";
			System.out.println(hql);
			// System.out.println(excuse);
		}
		List<Excuse> list = memberDao.getAllRow(hql);
		return list;
	}
	@Override
	// 根据条件查询excuseSta
	public List<ExcuseSta> getExcuseStaByFilter(ExcuseForm excuse) {
		String hql;
		if (excuse == null
				|| (excuse.getName().length() == 0
						&& excuse.getType().length() == 0
						&& excuse.getDateTime().length() == 0 && excuse
						.getDateTimeEnd().length() == 0)) {
			hql = "SELECT e.name, SUM(CASE WHEN e.type LIKE 'type1' THEN e.duration ELSE 0 END), SUM(CASE WHEN e.type LIKE 'type2' THEN e.duration ELSE 0 END), SUM(CASE WHEN e.type LIKE 'type3' THEN e.duration ELSE 0 END), SUM(CASE WHEN e.type<>'overtime' THEN e.duration ELSE 0 END), SUM(CASE WHEN e.type LIKE 'overtime' THEN e.duration ELSE 0 END) FROM Excuse e WHERE e.status=1 GROUP BY e.name"; // 查询语句
			System.out.println(hql);
			// System.out.println(excuse);
		} else {
			hql = "SELECT e.name, SUM(CASE WHEN e.type LIKE 'type1' THEN e.duration ELSE 0 END), SUM(CASE WHEN e.type LIKE 'type2' THEN e.duration ELSE 0 END), SUM(CASE WHEN e.type LIKE 'type3' THEN e.duration ELSE 0 END), SUM(CASE WHEN e.type<>'overtime' THEN e.duration ELSE 0 END), SUM(CASE WHEN e.type LIKE 'overtime' THEN e.duration ELSE 0 END) FROM Excuse e WHERE 1=1 AND"; // 查询语句
			hql += " e.name like '%" + excuse.getName() + "%'";
			hql += " and e.type like '%" + excuse.getType() + "%'";
			if (excuse.getDateTime().length() != 0
					&& excuse.getDateTime().length() != 0) {
				hql += " and e.dateTime>='" + excuse.getDateTime()
						+ "' and e.dateTime<='" + excuse.getDateTimeEnd() + "'";
			}
			hql += " group by e.name";
			System.out.println(hql);
			// System.out.println(excuse);
		}
		List<ExcuseSta> list = memberDao.getAllRow(hql);
		return list;
	}

	@Override
	// 根据excuseId删除excuse
	public void deleteExcuse(int excuseId) {
		// System.out.println(excuseId);
		dao.deleteExcuse(excuseId);

	}
	
	@Override
	// 同意员工请假
	public void agreeStuffExcuse(int excuseId) {
		// System.out.println(excuseId);
		dao.agreeStuffExcuse(excuseId);

	}

	@Override
	// 根据excuseId更新excuse
	public void updateExcuse(ExcuseForm excuse) {
		// TODO Auto-generated method stub
		dao.updateExcuse(excuse);

	}

	/**
	 * 分页查询
	 * 
	 * @param pageSize
	 *            每页显示多少记录
	 * @param currentPage
	 *            当前页
	 * @return 封装了分页信息的bean
	 */
	public PageBean queryForPage(int pageSize, int page, ExcuseForm excuse,
			int isSta) {
		String hql = "";
		String hql2 = "";
		if (excuse == null
				|| (excuse.getName().length() == 0
						&& excuse.getType().length() == 0
						&& excuse.getDateTime().length() == 0 && excuse
						.getDateTimeEnd().length() == 0)) {
			if (isSta == 0) {
				hql = "from Excuse e where e.status=1 order by e.excuseId"; // 查询语句
				System.out.println(hql);
			} else {
				hql = "SELECT e.name, SUM(CASE WHEN e.type LIKE 'type1' THEN e.duration ELSE 0 END), SUM(CASE WHEN e.type LIKE 'type2' THEN e.duration ELSE 0 END), SUM(CASE WHEN e.type LIKE 'type3' THEN e.duration ELSE 0 END), SUM(CASE WHEN e.type<>'overtime' THEN e.duration ELSE 0 END), SUM(CASE WHEN e.type LIKE 'overtime' THEN e.duration ELSE 0 END) FROM Excuse e WHERE e.status=1 GROUP BY e.name";//统计结果查询，不查询type=overtime的记录，overtime是加班记录 单独查询
				System.out.println(hql);
			}
		} else {
			if (isSta == 0) {
				hql = "from Excuse e where e.status=1 and"; // 查询语句
				hql2 = " order by e.excuseId";
			}
			else{
				hql = "SELECT e.name, SUM(CASE WHEN e.type LIKE 'type1' THEN e.duration ELSE 0 END), SUM(CASE WHEN e.type LIKE 'type2' THEN e.duration ELSE 0 END), SUM(CASE WHEN e.type LIKE 'type3' THEN e.duration ELSE 0 END), SUM(CASE WHEN e.type<>'overtime' THEN e.duration ELSE 0 END), SUM(CASE WHEN e.type LIKE 'overtime' THEN e.duration ELSE 0 END) FROM Excuse e WHERE 1=1 AND";//统计结果查询，不查询type=overtime的记录，overtime是加班记录 单独查询
				hql2 = " group by e.name";
			}
			hql += " e.name like '%" + excuse.getName() + "%'";
			hql += " and e.type like '%" + excuse.getType() + "%'";
			if (excuse.getDateTime().length() != 0
					&& excuse.getDateTime().length() != 0) {
				hql += " and e.dateTime>='" + excuse.getDateTime()
						+ "' and e.dateTime<='" + excuse.getDateTimeEnd() + "'";
			}
			hql += hql2;
			System.out.println(hql);
		}

		int allRow = memberDao.getAllRowCount(hql); // 总记录数
		int totalPage = PageBean.countTatalPage(pageSize, allRow); // 总页数
		final int offset = PageBean.countOffset(pageSize, page); // 当前页开始记录
		final int length = pageSize; // 每页记录数
		final int currentPage = PageBean.countCurrentPage(page); // 当前页
		List list = memberDao.queryForPage(hql, offset, length);
		if (isSta == 1) {
			List<ExcuseSta> staList = new ArrayList<ExcuseSta>(); // 解析list
																	// 查询excuseSta返回的list没有对应的实体类，需[解析]后放入List<ExcuseSta>
			HashMap map = new HashMap();
			for (Object obj : list) {
				if (obj instanceof Object[]) {
					Object[] array = (Object[]) obj;
					// map.put("name", array[0]);
					// map.put("duration", array[1]);
					ExcuseSta excuseSta = new ExcuseSta();
					excuseSta.setName(array[0].toString());
					excuseSta.setType1Duration(array[1].toString());
					excuseSta.setType2Duration(array[2].toString());
					excuseSta.setType3Duration(array[3].toString());
					excuseSta.setDurationSta(array[4].toString());
					excuseSta.setOvertimeDuration(array[5].toString());
					staList.add(excuseSta);
				}
			}
			// 把分页信息保存到Bean当中
			PageBean pageBean = new PageBean();
			pageBean.setPageSize(pageSize);
			pageBean.setCurrentPage(currentPage);
			pageBean.setAllRow(allRow);
			pageBean.setTotalPage(totalPage);
			pageBean.setList(staList);
			pageBean.init();
			return pageBean;

		}

		// 把分页信息保存到Bean当中
		PageBean pageBean = new PageBean();
		pageBean.setPageSize(pageSize);
		pageBean.setCurrentPage(currentPage);
		pageBean.setAllRow(allRow);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);
		pageBean.init();
		return pageBean;

	}
}