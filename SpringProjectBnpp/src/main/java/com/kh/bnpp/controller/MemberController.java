package com.kh.bnpp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.bnpp.model.biz.MemberBiz;
import com.kh.bnpp.model.dto.MemberDto;

@Controller
public class MemberController {

	@Autowired
	private MemberBiz biz;
	
	@RequestMapping("/memberlist.do")
	public String selectList(Model model) {
		model.addAttribute("list", biz.selectList());	
		return "memberlist";
	}
	
	@RequestMapping("/memberselect.do")
	public String selectOne(Model model, String member_id) {
		model.addAttribute("dto", biz.selectOne(member_id));
		return "memberselect";
	}
	
	@RequestMapping("/studentupdate.do")
	public String studentupdate(Model model, String member_id) {
		model.addAttribute("dto", biz.selectOne(member_id));
		return "studentupdate";
	}
	
	
}
