package com.kh.bnpp.sms;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;

public class smsTest {

	public static void main(String[] args) {
		/*
		String phone = "01064244977";
		String content = "메시지테스트";
		try {
			SMS.sendSMS(phone, content);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		*/
		
		try {
			
			if (!SMS.compareDate("2022-08-01").equals("0")) {
				System.out.println(SMS.compareDate("2022-07-31"));
			} else
			{
				System.out.println("아님");
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	
}