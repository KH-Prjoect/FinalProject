package com.kh.bnpp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.bnpp.model.biz.PayBiz;
import com.kh.bnpp.model.dto.PayDto;

@Controller
public class PayController {

	@Autowired
	private PayBiz biz;
	
	@RequestMapping("/paytest.do")
	public String paytest() {
		return "paytest";
	}
	@RequestMapping("/paytest2.do")
	public String paytest2(Model model, PayDto dto) {
		model.addAttribute("dto", dto);
		return "payment";
	}
	
	@RequestMapping("/mypaylist.do")
	public String selectMyList(Model model, String member_id) {
		model.addAttribute("list", biz.selectMyList(member_id));	
		return "mypaylist";
	}
	
	@RequestMapping("/paylist.do")
	public String selectList(Model model) {
		model.addAttribute("list", biz.selectList());	
		return "paylist";
	}
	
	@RequestMapping("/payselect.do")
	public String selectOne(Model model, int pay_num) {
		
		model.addAttribute("dto", biz.selectOne(pay_num));
		return "payselect";
	}
	
	@RequestMapping("/payinsert.do")
	public String insert() {
		return "payinsert";
	}
	
	@RequestMapping("/payinsertres.do")
	public String insertres(PayDto dto) {
		
		if (biz.insert(dto) > 0) {
			return "redirect:paylist.do";
		}
		
		return "redirect:payinsert.do";
	}
	
	@RequestMapping("/payupdate.do")
	public String update(Model model, int pay_num) {
		
		model.addAttribute("dto", biz.selectOne(pay_num));
		
		return "payupdate";
	}
	
	@RequestMapping("/payupdateres.do")
	public String updateres(PayDto dto) {
		
		if (biz.update(dto) > 0) {
			return "redirect:payselect.do?pay_num="+dto.getPay_num();
		}
		
		return "redirect:payupdate.do?pay_num="+dto.getPay_num();
	}
	
	@RequestMapping("/paydelete.do")
	public String delete(int pay_num) {
		
		if (biz.delete(pay_num) > 0) {
			return "redirect:paylist.do";
		}
		
		return "redirect:payselect.do?pay_num="+pay_num;
	}
	
}
