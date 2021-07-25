package com.kh.bnpp.controller;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.bnpp.model.biz.MemberBiz;


@Controller
public class TeacherController {

	private Logger logger = org.slf4j.LoggerFactory.getLogger(TeacherController.class);
	
	@Autowired
	private MemberBiz mBiz;
	
	@RequestMapping("/teacherList.do")
	public String teacherAllList(Model model, @RequestParam("category") String category) {
		
		//카테고리(한식,중식 등등)가져오기
		System.out.println(category);
		model.addAttribute("category", category);
		
		//해당 카테고리에 속한 강사 가져오기
		model.addAttribute("list", mBiz.findAllT(category));
		
		return "teacher";
	}
	
}
