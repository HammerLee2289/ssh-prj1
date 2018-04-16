package com.ynwi.ssh.util;

import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

public class SendMail {
	private MailSender mailSender;
	private SimpleMailMessage mailMessage;

	public SendMail() {

	}

	public SimpleMailMessage getMailMessage() {
		return mailMessage;
	}

	public void setMailMessage(SimpleMailMessage mailMessage) {
		this.mailMessage = mailMessage;
	}

	public MailSender getMailSender() {
		return mailSender;
	}

	public void setMailSender(MailSender mailSender) {
		this.mailSender = mailSender;
	}

	public void sendMail(String emailAddress, String tittle, String content) {
		SimpleMailMessage message = new SimpleMailMessage(mailMessage);
		message.setTo(emailAddress);
		// 设置email内容
		message.setSubject(tittle);
		message.setText(content);
		
		try {
			mailSender.send(message);
		} catch (MailException e) {
			// TODO Auto-generated catch block
			System.out.println("O . 发送Email失败了.");
			e.printStackTrace();
		}
	}
}