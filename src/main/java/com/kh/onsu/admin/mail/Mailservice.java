package com.kh.onsu.admin.mail;

public interface Mailservice {
	public boolean send(String subject, String text, String from, String to, String filePath, String ran);
}
