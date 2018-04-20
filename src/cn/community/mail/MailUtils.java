package cn.community.mail;

import java.io.IOException;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

public class MailUtils {
	public static Session createSession(String host, final String username, final String password) {
		Properties prop = new Properties();
		prop.setProperty("mail.host", host);// 指定主机
		prop.setProperty("mail.smtp.auth", "true");// 指定验证为true

		// 创建验证器
		Authenticator auth = new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		};
		
		// 获取session对象
		return Session.getInstance(prop, auth);
	}
	
	/**
	 * 发送指定的邮件
	 * 
	 * @param mail
	 */
	public static void send(Session session, final Mail mail) throws MessagingException,
			IOException {

		MimeMessage msg = new MimeMessage(session);// 创建邮件对象
		msg.setFrom(new InternetAddress(mail.getFrom()));// 设置发件人
		msg.addRecipients(RecipientType.TO, mail.getToAddress());// 设置收件人

		// 设置抄送
		String cc = mail.getCcAddress();
		if (!cc.isEmpty()) {
			msg.addRecipients(RecipientType.CC, cc);
		}

		// 设置暗送
		String bcc = mail.getBccAddress();
		if (!bcc.isEmpty()) {
			msg.addRecipients(RecipientType.BCC, bcc);
		}

		msg.setSubject(mail.getSubject());// 设置主题

		MimeMultipart parts = new MimeMultipart();// 创建部件集对象

		MimeBodyPart part = new MimeBodyPart();// 创建一个部件
		part.setContent(mail.getContent(), "text/html;charset=utf-8");// 设置邮件文本内容
		parts.addBodyPart(part);// 把部件添加到部件集中
		
		///////////////////////////////////////////

		// 添加附件
		List<AttachBean> attachBeanList = mail.getAttachs();// 获取所有附件
		if (attachBeanList != null) {
			for (AttachBean attach : attachBeanList) {
				MimeBodyPart attachPart = new MimeBodyPart();// 创建一个部件
				attachPart.attachFile(attach.getFile());// 设置附件文件
				attachPart.setFileName(MimeUtility.encodeText(attach
						.getFileName()));// 设置附件文件名
				String cid = attach.getCid();
				if(cid != null) {
					attachPart.setContentID(cid);
				}
				parts.addBodyPart(attachPart);
			}
		}

		msg.setContent(parts);// 给邮件设置内容
		Transport.send(msg);// 发邮件
	}
}
