package com.kh.bnpp;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class TestEncode {
	
	public static void main(String[] args) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String pwd = "123";
		String encodedPwd = passwordEncoder.encode(pwd);
		System.out.println(pwd+"을 암호화 하겠습니다.");
		System.out.println(pwd + ">>>" + encodedPwd);
		
		if(passwordEncoder.matches("123", "$2a$10$UKbDbX8S092oaetwlLeaCeTTR6LttsuVdXpJvzHUBfPXiYDrf0Xlq") == true) {
			System.out.println("true");
		} else {
			System.out.println("f");
		}
	}
}
