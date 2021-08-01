package com.kh.bnpp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.bnpp.model.biz.ClassBiz;
import com.kh.bnpp.model.biz.MemberBiz;
import com.kh.bnpp.model.biz.PayBiz;
import com.kh.bnpp.model.dto.ClassDto;
import com.kh.bnpp.model.dto.MemberDto;
import com.kh.bnpp.model.dto.PayDto;

@Controller
public class PayController {

	private Logger logger = LoggerFactory.getLogger(PayController.class);
	
	@Autowired
	private PayBiz biz;
	
	@Autowired
	private ClassBiz c_biz;
	
	@Autowired
	private MemberBiz m_biz;
	
	@RequestMapping("/paytest.do")
	public String paytest(Model model, PayDto dto) {
		model.addAttribute("dto", dto);
		return "payment";
	}
	
	@RequestMapping("/paysuccess.do")
	public String paysuccess(Model model, String member_id, int class_num) {
		ClassDto c_dto = c_biz.selectOne(class_num);
		PayDto p_dto = new PayDto(c_dto.getClass_price(), member_id, c_dto.getClass_num(),
									c_dto.getClass_title(), c_dto.getMember_category());
		
		if (biz.insert(p_dto) > 0) {
			logger.info("결제 내역 추가 성공");
			return "redirect:classdetailteacher.do?teacher_id="+c_dto.getTeacher_id();
		}
		logger.info("결제 내역 추가 실패");
		return "redirect:classdetailteacher.do?teacher_id="+c_dto.getTeacher_id();
	}
	
}

