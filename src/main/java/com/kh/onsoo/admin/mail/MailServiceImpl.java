package com.kh.onsoo.admin.mail;

import java.io.File;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl implements Mailservice {

	
	
		private Logger logger = LoggerFactory.getLogger(MailServiceImpl.class);
	
		@Autowired
		private JavaMailSender javaMailSender;
		
		public void serJavaMailSender(JavaMailSender javaMailSender) {
			this.javaMailSender=javaMailSender;
		}
		
		
	@Override
	public boolean send(String subject, String text, String from, String to, String filePath, String ran) {
		
	
			MimeMessage message = javaMailSender.createMimeMessage();
		
		
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"UTF-8");
			helper.setSubject(subject);
			helper.setText(text, true);
			helper.setFrom(from);
			helper.setTo(to);
			
			
			if (filePath != null) {
				File file = new File(filePath);
				if (file.exists()) {
				helper.addAttachment(file.getName(), new File(filePath));
					}
				}
			
				javaMailSender.send(message);
				return true;

		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return false;
	}

}
