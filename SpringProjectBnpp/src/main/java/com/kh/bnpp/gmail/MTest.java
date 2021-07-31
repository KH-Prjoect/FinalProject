package com.kh.bnpp.gmail;

public class MTest {

	public static void main(String[] args) {
		// mail test
		String to = "insub2004@naver.com";
		String subject = "test (제목)";
		String content = "test123 (내용)";
		
		try {
			MailSend.sendEmail(to, subject, content);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
