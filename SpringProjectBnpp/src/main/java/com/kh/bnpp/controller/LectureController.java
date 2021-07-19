package com.kh.bnpp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.bnpp.biz.LectureBiz;
import com.kh.bnpp.dto.LectureDto;

@Controller
public class LectureController {

	@Autowired
	private LectureBiz biz;
	
	@RequestMapping("/lecturelist.do")
	public String selectList(Model model) {
		model.addAttribute("list", biz.selectList());	
		return "lecturelist";
	}
	
	@RequestMapping("/lectureselect.do")
	public String selectOne(Model model, int lecture_num) {
		
		model.addAttribute("dto", biz.selectOne(lecture_num));
		return "lectureselect";
	}
	
	@RequestMapping("/lectureinsert.do")
	public String insert() {
		return "lectureinsert";
	}
	
	@RequestMapping("/lectureinsertres.do")
	public String insertres(LectureDto dto) {
		
		if (biz.insert(dto) > 0) {
			return "redirect:lecturelist.do";
		}
		
		return "redirect:lectureinsert.do";
	}
	
	@RequestMapping("/lectureupdate.do")
	public String update(Model model, int lecture_num) {
		
		model.addAttribute("dto", biz.selectOne(lecture_num));
		
		return "lectureupdate";
	}
	
	@RequestMapping("/lectureupdateres.do")
	public String updateres(LectureDto dto) {
		
		if (biz.update(dto) > 0) {
			return "redirect:lectureselect.do?lecture_num="+dto.getLecture_num();
		}
		
		return "redirect:lectureupdate.do?lecture_num="+dto.getLecture_num();
	}
	
	@RequestMapping("/lecturedelete.do")
	public String delete(int lecture_num) {
		
		if (biz.delete(lecture_num) > 0) {
			return "redirect:lecturelist.do";
		}
		
		return "redirect:lectureselect.do?lecture_num="+lecture_num;
	}
	
}
