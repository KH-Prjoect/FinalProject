package com.kh.bnpp.controller;


import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.bnpp.model.biz.MemberBiz;
import com.kh.bnpp.model.dto.MemberDto;

@Controller
public class FindIdPwController {

	private Logger logger = LoggerFactory.getLogger(FindIdPwController.class);
	
	@Autowired
	private MemberBiz biz;
	
	@RequestMapping("/findIdPw.do")
	public String findIdPwForm() {
		
		logger.info("[아이디 비밀번호 찾기 창으로 이동]");
		
		return "findidpwform";
	}
	
	@RequestMapping("/findId.do")
	@ResponseBody
	public String findId(@ModelAttribute("findMemberId") MemberDto ControllerDto) {
		
		//ModelAttribute를 사용해보기
		
		logger.info("[FindIdPwController] : 아이디찾기 진입");
		
		System.out.println("[FindIdPwController] findId() 받아온 Dto : " + ControllerDto);
		//ModelAttribute로 받으면 넘겨준 파라미터값이랑 setter함수를 비교해서 1:1로 객체에 바인딩 해주는데
		//안넘어 온 값은 null로 넣어서 객체 생성해줌
		
		String member_id = biz.findId(ControllerDto);
		
		System.out.println("[FindIdPwController] 최종적으로 받아온 id : " + member_id);
		
		return member_id;
	}
	
	@RequestMapping("/findPw.do")
	@ResponseBody
	public Map<String, Boolean> findPw(@RequestBody MemberDto dto) {
		
		//json형태의 http body내용을 java object로 변환!! 시켜주는 RequestBody 사용해보기
		
		logger.info("[FindIdPwController] : 비밀번호찾기 진입");
		
		System.out.println("[FindIdPwController] findId() 받아온 아이디 : " + dto.getMember_id());
		System.out.println("[FindIdPwController] findId() 받아온 이메일 : " + dto.getMember_email());
		
		String isPw = biz.findPw(dto);
		System.out.println("있는 아이디, 이메일인지 0이면 없고 1이면 있음 : " + isPw);
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		boolean check = false;
		int res = 0;
		if(isPw.equals("1")) {
			System.out.println("해당 pw 강제변경 준비완료!");
			res = biz.updateEmailPw(dto);
			if(res > 0) {
				check = true;
			}else {
				System.out.println("pw변경 및 이메일 발송 실패!");
			}
		}
		
		map.put("check", check);
		//System.out.println("[FindIdPwController] 최종적으로 받아온 pw : " + member_pw);
		
		return map;
	}
	
	
}
