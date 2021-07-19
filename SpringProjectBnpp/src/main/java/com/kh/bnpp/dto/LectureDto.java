package com.kh.bnpp.dto;

public class LectureDto {

	private int lecture_num;
	private String lecture_name;
	private String member_id;
	private String member_name;
	private String lecture_category;
	private String lecture_content;
	private int lecture_price;
	public LectureDto() {
	}
	public LectureDto(int lecture_num, String lecture_name, String member_id, String member_name,
			String lecture_category, String lecture_content, int lecture_price) {
		this.lecture_num = lecture_num;
		this.lecture_name = lecture_name;
		this.member_id = member_id;
		this.member_name = member_name;
		this.lecture_category = lecture_category;
		this.lecture_content = lecture_content;
		this.lecture_price = lecture_price;
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
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getLecture_category() {
		return lecture_category;
	}
	public void setLecture_category(String lecture_category) {
		this.lecture_category = lecture_category;
	}
	public String getLecture_content() {
		return lecture_content;
	}
	public void setLecture_content(String lecture_content) {
		this.lecture_content = lecture_content;
	}
	public int getLecture_price() {
		return lecture_price;
	}
	public void setLecture_price(int lecture_price) {
		this.lecture_price = lecture_price;
	}
	
}
