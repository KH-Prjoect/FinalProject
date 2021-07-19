package com.kh.bnpp.dto;

import java.util.Date;

public class PayDto {

	private int pay_num;
	private Date pay_date;
	private int pay_price;
	private String pay_step;
	private String member_id;
	private int lecture_num;
	private String lecture_name;
	private String lecture_category;
	private String pay_method;
	public PayDto() {
	}
	
	public PayDto(int pay_price, String member_id, String lecture_name, String pay_method) {
		super();
		this.pay_price = pay_price;
		this.member_id = member_id;
		this.lecture_name = lecture_name;
		this.pay_method = pay_method;
	}

	public PayDto(int pay_num, Date pay_date, int pay_price, String pay_step, String member_id, int lecture_num,
			String lecture_name, String lecture_category) {
		this.pay_num = pay_num;
		this.pay_date = pay_date;
		this.pay_price = pay_price;
		this.pay_step = pay_step;
		this.member_id = member_id;
		this.lecture_num = lecture_num;
		this.lecture_name = lecture_name;
		this.lecture_category = lecture_category;
	}
	
	public PayDto(int pay_num, Date pay_date, int pay_price, String pay_step, String member_id, int lecture_num,
			String lecture_name, String lecture_category, String pay_method) {
		super();
		this.pay_num = pay_num;
		this.pay_date = pay_date;
		this.pay_price = pay_price;
		this.pay_step = pay_step;
		this.member_id = member_id;
		this.lecture_num = lecture_num;
		this.lecture_name = lecture_name;
		this.lecture_category = lecture_category;
		this.pay_method = pay_method;
	}
	public String getPay_method() {
		return pay_method;
	}
	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}
	public int getPay_num() {
		return pay_num;
	}
	public void setPay_num(int pay_num) {
		this.pay_num = pay_num;
	}
	public Date getPay_date() {
		return pay_date;
	}
	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}
	public int getPay_price() {
		return pay_price;
	}
	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
	}
	public String getPay_step() {
		return pay_step;
	}
	public void setPay_step(String pay_step) {
		this.pay_step = pay_step;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getLecture_num() {
		return lecture_num;
	}
	public void setLecture_num(int lecture_num) {
		this.lecture_num = lecture_num;
	}
	public String getLecture_name() {
		return lecture_name;
	}
	public void setLecture_name(String lecture_name) {
		this.lecture_name = lecture_name;
	}
	public String getLecture_category() {
		return lecture_category;
	}
	public void setLecture_category(String lecture_category) {
		this.lecture_category = lecture_category;
	}
	
}
