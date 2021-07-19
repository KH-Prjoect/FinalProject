package com.kh.bnpp.dto;

import java.util.Date;

public class MemberDto2 {

	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_email;
	private String member_phone;
	private String member_address;
	private String member_role;
	private String member_category;
	private String member_certi;
	private String member_career;
	private Date member_regdate;
	public MemberDto2() {
	}
	public MemberDto2(String member_id, String member_pw, String member_name, String member_email, String member_phone,
			String member_address, String member_role, String member_category, String member_certi,
			String member_career, Date member_regdate) {
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_name = member_name;
		this.member_email = member_email;
		this.member_phone = member_phone;
		this.member_address = member_address;
		this.member_role = member_role;
		this.member_category = member_category;
		this.member_certi = member_certi;
		this.member_career = member_career;
		this.member_regdate = member_regdate;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_address() {
		return member_address;
	}
	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}
	public String getMember_role() {
		return member_role;
	}
	public void setMember_role(String member_role) {
		this.member_role = member_role;
	}
	public String getMember_category() {
		return member_category;
	}
	public void setMember_category(String member_category) {
		this.member_category = member_category;
	}
	public String getMember_certi() {
		return member_certi;
	}
	public void setMember_certi(String member_certi) {
		this.member_certi = member_certi;
	}
	public String getMember_career() {
		return member_career;
	}
	public void setMember_career(String member_career) {
		this.member_career = member_career;
	}
	public Date getMember_regdate() {
		return member_regdate;
	}
	public void setMember_regdate(Date member_regdate) {
		this.member_regdate = member_regdate;
	}
	
}
