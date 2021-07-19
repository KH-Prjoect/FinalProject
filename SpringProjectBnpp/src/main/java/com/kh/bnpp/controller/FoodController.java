package com.kh.bnpp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.bnpp.biz.FoodBiz;
import com.kh.bnpp.dto.FoodDto;

@Controller
public class FoodController {

	@Autowired
	private FoodBiz biz;
	
	@RequestMapping("/foodlist.do")
	public String selectList(Model model) {
		model.addAttribute("list", biz.selectList());	
		return "foodlist";
	}
	
	@RequestMapping("/myfoodlist.do")
	public String selectMyList(Model model, String member_id) {
		model.addAttribute("list", biz.selectMyList(member_id));	
		return "myfoodlist";
	}
	
	@RequestMapping("/foodselect.do")
	public String selectOne(Model model, int food_num) {
		model.addAttribute("dto", biz.selectOne(food_num));
		return "foodselect";
	}
	
	@RequestMapping("/foodinsert.do")
	public String insert() {
		return "foodinsert";
	}
	
	@RequestMapping("/foodinsertres.do")
	public String insertres(FoodDto dto) {
		if (biz.insert(dto) > 0) {
			return "redirect:myfoodlist.do?member_id="+dto.getMember_id();
		}
		return "redirect:foodinsert.do";
	}
	
	@RequestMapping("/foodlifeupdate.do")
	public String lifeupdate(Model model, int food_num) {
		model.addAttribute("dto", biz.selectOne(food_num));
		return "foodlifeupdate";
	}
	
	@RequestMapping("/foodlifeupdateres.do")
	public String lifeupdateres(FoodDto dto) {
		if (biz.updateLife(dto) > 0) {
			return "redirect:foodselect.do?food_num="+dto.getFood_num();
		}
		return "redirect:foodlifeupdate.do?food_num="+dto.getFood_num();
	}
	
	@RequestMapping("/fooddelete.do")
	public String delete(int food_num) {
		String member_id = biz.selectOne(food_num).getMember_id();
		if (biz.delete(food_num) > 0) {
			return "redirect:myfoodlist.do?member_id="+member_id;
		}
		return "redirect:foodselect.do?food_num="+food_num;
	}
	
}
