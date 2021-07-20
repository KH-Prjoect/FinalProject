package com.kh.bnpp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.bnpp.biz.FoodBiz;
import com.kh.bnpp.biz.LectureBiz;
import com.kh.bnpp.biz.MemberBiz;
import com.kh.bnpp.biz.PayBiz;
import com.kh.bnpp.dto.FoodDto;
import com.kh.bnpp.dto.LectureDto;
import com.kh.bnpp.dto.MemberDto;
import com.kh.bnpp.dto.PayDto;

@Controller
public class MypageController {
	
	private Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private MemberBiz m_biz;
	
	@Autowired
	private PayBiz p_biz;
	
	@Autowired
	private LectureBiz l_biz;
	
	@Autowired
	private FoodBiz f_biz;
	
	@RequestMapping("/mypage.do")
	public String mypage(String member_id) {
		MemberDto dto = m_biz.selectOne(member_id);
		
		if (dto.getMember_role().equals("M")) {
			return "redirect:mypage_student.do?member_id="+member_id;
		}
		return "redirect:mypage_teacher.do?member_id="+member_id;
		
	}
	
	@RequestMapping("/mypage_student.do")
	public String mypage_student(Model model, String member_id) {
		MemberDto m_dto = m_biz.selectOne(member_id);
		List<PayDto> p_list = p_biz.selectMyList(member_id);
		List<LectureDto> l_list = new ArrayList<LectureDto>();
		LectureDto l_dto = null;
		for (PayDto p_dto : p_list) {
			l_dto = l_biz.selectOne(p_dto.getLecture_num());
			l_list.add(l_dto);
		}
		List<FoodDto> f_list = f_biz.selectMyList(member_id);
		model.addAttribute("l_list", l_list);
		model.addAttribute("f_list", f_list);
		model.addAttribute("m_dto", m_dto);
		return "mypage_student";
	}
	
	@RequestMapping("/studentupdateres.do")
	public String studentupdateres(MemberDto dto) {
		if (m_biz.updatestudent(dto) > 0) {
			return "redirect:mypage.do?member_id="+dto.getMember_id();
		}
		System.out.println("수정실패(학생)");
		return "redirect:mypage.do?member_id="+dto.getMember_id();
	}
	
	@RequestMapping("/memberdelete.do")
	public String delete(String member_id, String member_password) {
		MemberDto dto = m_biz.selectOne(member_id);
		if (dto.getMember_pw().equals(member_password)) {
			if (m_biz.delete(dto) > 0) {
				System.out.println("회원탈퇴성공");
				return "index";
			}
			System.out.println("회원탈퇴실패");
			return "redirect:mypage.do?member_id="+member_id;
		}
		System.out.println("비번틀림");
		return "redirect:mypage.do?member_id="+member_id;
	}
	
}
