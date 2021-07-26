
package com.kh.bnpp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.bnpp.model.biz.FoodBiz;
import com.kh.bnpp.model.biz.LectureBiz;
import com.kh.bnpp.model.biz.MemberBiz;
import com.kh.bnpp.model.biz.PayBiz;
import com.kh.bnpp.model.dto.FoodDto;
import com.kh.bnpp.model.dto.FoodListDto;
import com.kh.bnpp.model.dto.LectureDto;
import com.kh.bnpp.model.dto.MemberDto;
import com.kh.bnpp.model.dto.PayDto;

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
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping("/mypage.do")
	public String mypage(String member_id) {
		MemberDto dto = m_biz.selectOne(member_id);
		
		if (dto.getMember_role().equals("M")) {
			return "redirect:mypage_student.do?member_id="+member_id;
		} else if (dto.getMember_role().equals("T")) {
			return "redirect:mypage_teacher.do?member_id="+member_id;
		} else {
			return "redirect:mypage_admin.do?member_id="+member_id;
		}
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
	
	@RequestMapping("/mypage_teacher.do")
	public String mypage_teacher(Model model, String member_id) {
		MemberDto m_dto = m_biz.selectOne(member_id);
		List<LectureDto> l_list = l_biz.selectMyList(member_id);
		List<FoodDto> f_list = f_biz.selectMyList(member_id);
		model.addAttribute("l_list", l_list);
		model.addAttribute("f_list", f_list);
		model.addAttribute("m_dto", m_dto);
		return "mypage_teacher";
	}
	
	@RequestMapping("/studentupdateres.do")
	public String studentupdateres(MemberDto dto) {
		dto.setMember_pw(passwordEncoder.encode(dto.getMember_pw()));
		if (m_biz.updatestudent(dto) > 0) {
			return "redirect:mypage.do?member_id="+dto.getMember_id();
		}
		return "redirect:mypage.do?member_id="+dto.getMember_id();
	}
	
	@RequestMapping("/teacherupdateres.do")
	public String teacherupdateres(MemberDto dto) {
		dto.setMember_pw(passwordEncoder.encode(dto.getMember_pw()));
		if (m_biz.updateteacher(dto) > 0) {
			return "redirect:mypage.do?member_id="+dto.getMember_id();
		}
		return "redirect:mypage.do?member_id="+dto.getMember_id();
	}
	
	@RequestMapping(value = "/foodlifeupdateres.do", method = RequestMethod.POST)
	public String lifeupdateres(FoodListDto food_list, String member_id) {
		int num = 0;
		int k;
		List<FoodDto> f_list = food_list.getFood_list();
		for (FoodDto dto : f_list) {
			k = f_biz.updateLife(dto);
			num += k;
		}
			
		if (num > f_list.size()) {
			// logger.info("음식 수정 성공");
			return "redirect:mypage.do?member_id="+member_id;
		}
		// logger.info("음식 수정 실패");
		return "redirect:mypage.do?member_id="+member_id;
	}
	
	@RequestMapping("/memberdelete.do")
	public String delete(String member_id, String member_password) {
		MemberDto dto = m_biz.selectOne(member_id);
		if (dto.getMember_pw().equals(member_password)) {
			if (m_biz.delete(dto) > 0) {
				logger.info("회원탈퇴성공");
				return "index";
			}
			logger.info("회원탈퇴실패");
			return "redirect:mypage.do?member_id="+member_id;
		}
		logger.info("비번틀림");
		return "redirect:mypage.do?member_id="+member_id;
	}
	
}

