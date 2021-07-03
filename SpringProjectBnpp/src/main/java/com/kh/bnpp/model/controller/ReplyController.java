package com.kh.bnpp.model.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.bnpp.model.biz.ReplyBiz;
import com.kh.bnpp.model.dto.ReplyDto;

@Controller
public class ReplyController {

	@Autowired
	private ReplyBiz rbiz;

	@RequestMapping("/replylist.do")
	public String replylistRes(Model model,int br_num) {
		model.addAttribute("replylist",rbiz.reply_selectList(br_num));
		
		return "rboardselect";
	}
	
	@RequestMapping("/replyinsert.do")
	public String replyinsertRes(ReplyDto rdto) {

		if (rbiz.reply_insert(rdto) > 0) {
			return "redirect:select.do?br_num=" + rdto.getBr_num();
		}

		System.out.println("ReplyDto : " + rdto);
		System.out.println("글번호 : " + rdto.getBr_num());
		System.out.println("작성 : " + rdto.getReply_member_id());
		System.out.println("내용 : " + rdto.getReply_content());

		return "redirect:select.do?br_num=" + rdto.getBr_num();
	}

}
