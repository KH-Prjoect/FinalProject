package com.kh.bnpp.sms;

import java.io.UnsupportedEncodingException;

public class smsTest {

	public static void main(String[] args) {
		String phone = "01064244977";
		String content = "메시지테스트";
		try {
			SMS.sendSMS(phone, content);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
