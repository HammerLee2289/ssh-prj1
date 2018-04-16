package com.ynwi.ssh.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ynwi.ssh.beans.Excuse;
import com.ynwi.ssh.beans.ExcuseSta;
import com.ynwi.ssh.beans.User;
import com.ynwi.ssh.forms.ExcuseForm;
import com.ynwi.ssh.service.UserManager;
import com.ynwi.ssh.util.PageBean;
import com.ynwi.ssh.util.SendMail;

public class ExcuseAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private UserManager userManager;// 通过Spring创建业务层对象 使用set方法依赖注入
	private PageBean pageBean; // 封装了分页信息和数据内容的pageBean
	private List<User> listUser;// 用于储存pageBean当中被封装的User信息
	private int page = 1; // 表示从网页中返回的当前页的值 默认为1 表示默认显示第一页内容
	private int excuseId;
	private String stuffName;
	private String emailMsg;
	private ExcuseForm excuse;
	private SendMail sendMail;

	
	public String getEmailMsg() {
		return emailMsg;
	}

	public void setEmailMsg(String emailMsg) {
		this.emailMsg = emailMsg;
	}

	public String getStuffName() {
		return stuffName;
	}

	public void setStuffName(String stuffName) {
		this.stuffName = stuffName;
	}

	public SendMail getSendMail() {
		return sendMail;
	}

	public void setSendMail(SendMail sendMail) {
		this.sendMail = sendMail;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public List<User> getListUser() {
		return listUser;
	}

	public void setListUser(List<User> listUser) {
		this.listUser = listUser;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public ExcuseForm getExcuse() {
		return excuse;
	}

	public void setExcuse(ExcuseForm excuse) {
		this.excuse = excuse;
	}

	public int getExcuseId() {
		return excuseId;
	}

	public void setExcuseId(int excuseId) {
		this.excuseId = excuseId;
	}

	public UserManager getUserManager() {
		return userManager;
	}

	public void setUserManager(UserManager userManager) {
		this.userManager = userManager;
	}

	// 删除excuse
	public String deleteExcuse() {
		userManager.deleteExcuse(excuseId);
		return "success";
	}
	
	// 删除stuff excuse，并发送邮件
		public String deleteStuffExcuse() {
			//System.out.println(excuseId+stuffName+emailMsg);
			List<User> userList = new ArrayList<User>();
			userManager.deleteExcuse(excuseId);
			userList = userManager.getAllUserByName(stuffName);//通过请假name查找user，得到user的邮箱地址，发送反馈信息
			//System.out.println(userList.get(0).getEmailAddress());
			sendMail.sendMail(userList.get(0).getEmailAddress(), "请假申请反馈", "您的请假申请没有被批准，具体情况请与管理人员联系。未被批准的理由为："+emailMsg);
			return "success";
		}

	// 编辑excuse
	public String editExcuse() {
		
		userManager.updateExcuse(excuse);
		String name = excuse.getName();// 新建excuse执行完成，保存新建excuse的name，用于显示此name的所有excuse
		excuse.initExcuse();// 清空excuseForm，将name赋给excuseForm，用于showExcuse(条件仅有name限制，其他字段无限制，效果是保存tom的excuse后，显示tom以前的excuse)
		excuse.setName(name);
		return "success";
	}

	// 同意员工请假，并发送邮件
	public String agreeStuffExcuse() {
		List<User> userList = new ArrayList<User>();
		userManager.agreeStuffExcuse(excuseId);//根据excuseId查找excuse，将status置1，代表已经被同意的申请
		userList = userManager.getAllUserByName(stuffName);//通过请假name查找user，得到user的邮箱地址，发送反馈信息
		//System.out.println(userList.get(0).getEmailAddress());
		sendMail.sendMail(userList.get(0).getEmailAddress(), "请假申请反馈", "您的请假已被批准");
		return "success";
	}

	// 显示excuse
	public String showExcuse() {
		try {
			this.pageBean = userManager.queryForPage(10, page, excuse, 0);// 获取封装了分页信息和数据的pageBean
			// System.out.println(excuse);
			this.listUser = this.pageBean.getList(); // 获取数据
			ActionContext.getContext().getSession().put("list", this.listUser);
			List<Excuse> exportList = userManager.getExcuseByFilter(excuse);// 非分页查询，结果用于导出excel
			ActionContext.getContext().getSession()
					.put("exportList", exportList);// exportList存储了导出的excel数据
			findStuffExcuse();
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	// 显示统计结果
	public String showExcuseSta() {
		try {
			this.pageBean = userManager.queryForPage(10, page, excuse, 1);// 获取封装了分页信息和数据的pageBean
			// System.out.println(excuse);
			this.listUser = this.pageBean.getList(); // 获取数据
			ActionContext.getContext().getSession().put("list", this.listUser);
			List list = userManager.getExcuseStaByFilter(excuse);// 非分页查询，结果用于导出excel
			List<ExcuseSta> exportStaList = new ArrayList<ExcuseSta>();
			HashMap map = new HashMap();// 解析list
			for (Object obj : list) {
				if (obj instanceof Object[]) {
					Object[] array = (Object[]) obj;
					ExcuseSta excuseSta = new ExcuseSta();
					excuseSta.setName(array[0].toString());
					excuseSta.setType1Duration(array[1].toString());
					excuseSta.setType2Duration(array[2].toString());
					excuseSta.setType3Duration(array[3].toString());
					excuseSta.setDurationSta(array[4].toString());
					excuseSta.setOvertimeDuration(array[5].toString());
					exportStaList.add(excuseSta);
				}
			}// 解析完毕
			ActionContext.getContext().getSession()
					.put("exportStaList", exportStaList);// exportList存储了导出的excel数据

			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public String findStuffExcuse() {
		List list = userManager.getAllStuffExcuse();// 查找员工请假申请
		ActionContext.getContext().getSession().put("stuffExcuseList", list);// exportList存储了导出的excel数据
		return SUCCESS;
	}

	// 新建excuse
	public String newExcuse() {
		try {
			userManager.newExcuse(excuse);
			String name = excuse.getName();// 新建excuse执行完成，保存新建excuse的name，用于显示此name的所有excuse
			excuse.initExcuse();// 清空excuseForm，将name赋给excuseForm，用于showExcuse(条件仅有name限制，其他字段无限制，效果是保存tom的excuse后，显示tom以前的excuse)
			excuse.setName(name);
			return SUCCESS;

		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	// 导出Excuse
	public void exportExcuseDetail() {
		System.out.println("---execuse export---");
		try {
			HSSFWorkbook workbook = new HSSFWorkbook();
			HSSFSheet sheet = workbook.createSheet();
			HSSFRow row_title = sheet.createRow(0);
			HSSFCell cell_title1 = row_title.createCell(0);
			HSSFCell cell_title2 = row_title.createCell(1);
			HSSFCell cell_title3 = row_title.createCell(2);
			HSSFCell cell_title4 = row_title.createCell(3);
			HSSFCell cell_title5 = row_title.createCell(4);
			HSSFCell cell_title6 = row_title.createCell(5);
			cell_title1.setCellValue("姓名");// 姓名
			cell_title2.setCellValue("类型");// 类型
			cell_title3.setCellValue("缘由");// 缘由
			cell_title4.setCellValue("时间");// 时间
			cell_title5.setCellValue("其他1");// 其他1
			cell_title6.setCellValue("其他2");// 其他2

			// List<Excuse> excuseList = userManager.getAllExcuse();
			// List<Excuse> excuseList = userManager.getExcuseByFilter(excuse);
			// // 获取数据
			List<Excuse> excuseList = (List<Excuse>) ActionContext.getContext()
					.getSession().get("exportList");
			// System.out.println(excuseList+"000000");
			Excuse excuse = new Excuse();
			for (int i = 0; i < excuseList.size(); i++) {
				excuse = excuseList.get(i);
				HSSFRow row = sheet.createRow(i + 1);
				HSSFCell cell1 = row.createCell(0);
				HSSFCell cell2 = row.createCell(1);
				HSSFCell cell3 = row.createCell(2);
				HSSFCell cell4 = row.createCell(3);
				HSSFCell cell5 = row.createCell(4);
				HSSFCell cell6 = row.createCell(5);
				cell1.setCellValue(excuse.getName());// 姓名
				cell2.setCellValue(excuse.getType());// 类型
				cell3.setCellValue(excuse.getReason());// 缘由
				cell4.setCellValue(excuse.getDateTime());// 时间
				cell5.setCellValue(i);//
				cell6.setCellValue(i);//
			}
			HttpServletResponse response = ServletActionContext.getResponse();
			// 把响应头数据类型设置为任意二进制流，用于上传下载
			response.setContentType("application/octet-stream");
			// 告诉浏览器通过下载方式打开，并设置下载文件名
			response.setHeader("Content-Disposition", "attachment;fileName="//
					+ new String("请假明细.xls".getBytes(), "ISO8859-1"));
			ServletOutputStream sos = response.getOutputStream();
			workbook.write(sos);
			workbook.close();
			if (sos != null) {
				sos.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 导出ExcuseSta
	public void exportExcuseSta() {
		System.out.println("---execuseSta export---");
		try {
			HSSFWorkbook workbook = new HSSFWorkbook();
			HSSFSheet sheet = workbook.createSheet();
			HSSFRow row_title = sheet.createRow(0);
			HSSFCell cell_title1 = row_title.createCell(0);
			HSSFCell cell_title2 = row_title.createCell(1);
			HSSFCell cell_title3 = row_title.createCell(2);
			HSSFCell cell_title4 = row_title.createCell(3);
			HSSFCell cell_title5 = row_title.createCell(4);
			HSSFCell cell_title6 = row_title.createCell(5);
			cell_title1.setCellValue("姓名");// 姓名
			cell_title2.setCellValue("type1总计");// type1总天数
			cell_title3.setCellValue("type2总计");// type2总天数
			cell_title4.setCellValue("type3总计");// type3总天数
			cell_title5.setCellValue("总计");// 总天数
			cell_title6.setCellValue("总加班天数");// 加班总天数

			// List<Excuse> excuseList = userManager.getAllExcuse();
			// List<Excuse> excuseList = userManager.getExcuseByFilter(excuse);
			// // 获取数据
			List<ExcuseSta> excuseStaList = (List<ExcuseSta>) ActionContext
					.getContext().getSession().get("exportStaList");
			// System.out.println(excuseList+"000000");
			ExcuseSta excuseSta = new ExcuseSta();
			for (int i = 0; i < excuseStaList.size(); i++) {
				excuseSta = excuseStaList.get(i);
				HSSFRow row = sheet.createRow(i + 1);
				HSSFCell cell1 = row.createCell(0);
				HSSFCell cell2 = row.createCell(1);
				HSSFCell cell3 = row.createCell(2);
				HSSFCell cell4 = row.createCell(3);
				HSSFCell cell5 = row.createCell(4);
				HSSFCell cell6 = row.createCell(5);
				cell1.setCellValue(excuseSta.getName());// 姓名
				cell2.setCellValue(excuseSta.getType1Duration());// type1总天数
				cell3.setCellValue(excuseSta.getType2Duration());// type2总天数
				cell4.setCellValue(excuseSta.getType3Duration());// type3总天数
				cell5.setCellValue(excuseSta.getDurationSta());// 总天数
				cell6.setCellValue(excuseSta.getOvertimeDuration());// 加班总天数
			}
			HttpServletResponse response = ServletActionContext.getResponse();
			// 把响应头数据类型设置为任意二进制流，用于上传下载
			response.setContentType("application/octet-stream");
			// 告诉浏览器通过下载方式打开，并设置下载文件名
			response.setHeader("Content-Disposition", "attachment;fileName="//
					+ new String("请假统计.xls".getBytes(), "ISO8859-1"));
			ServletOutputStream sos = response.getOutputStream();
			workbook.write(sos);
			workbook.close();
			if (sos != null) {
				sos.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
