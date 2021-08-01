package com.kh.bnpp.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.bnpp.model.biz.ClassBiz;
import com.kh.bnpp.model.biz.MemberBiz;
import com.kh.bnpp.model.dto.ClassDetailDto;
import com.kh.bnpp.model.dto.ClassDto;
import com.kh.bnpp.model.dto.MemberDto;


@Controller
public class TeacherController {

	private Logger logger = org.slf4j.LoggerFactory.getLogger(TeacherController.class);
	
	@Autowired
	private MemberBiz mBiz;
	
	@Autowired
	private ClassBiz cBiz;
	
	
	@RequestMapping("/teacherList.do")
	public String teacherAllList(Model model, @RequestParam("category") String category) {
		
		logger.info("[teacherController] : 강사 페이지로 이동");
		
		//카테고리(한식,중식 등등)가져오기
		System.out.println(category);
		model.addAttribute("category", category);
		
		//해당 카테고리에 속한 강사 가져오기
		System.out.println(mBiz.findAllT(category));
		model.addAttribute("list", mBiz.findAllT(category));
		
		
		return "teacher";
	}
	
	@RequestMapping("/classform.do")
	public String classFrom(@RequestParam(value="category", required = false) String category) {
		
		System.out.println("category 받아옴? : " + category);
		
		logger.info("[teacherController] : 강의 등록 페이지로 이종");
		return "classinsertform";
	}
	
	@RequestMapping("/classres.do")
	public String classRes(ClassDto dto, @RequestParam(value="file", required = false) MultipartFile fm, @RequestParam("category") String category, Model model, HttpServletRequest request) {
		
		logger.info("[teacherController] : 강의 등록 res");
		System.out.println("ClassDto 잘 가져왐? : " + dto);
		System.out.println("Category 잘 가져왐? : " + category);
		System.out.println("강의 입력하는 teacher id : " + dto.getTeacher_id());
		
		//여기부터 동영상 업로드
			
		
				
		//동영상 파일 업로드
		if (!fm.getOriginalFilename().isEmpty()) {
			
			String uploadRealPath = request.getSession().getServletContext().getRealPath("/resources/upload/video");
			
			File dir = new File(uploadRealPath);
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			// 파일명
			String originalFile = fm.getOriginalFilename();
			System.out.println("파일명이 뭔데? : " + originalFile);

			// 파일명 중 확장자만 추출 //lastIndexOt(".") - 뒤에 .위치의 인덱스 번호
			String originalFileExt = originalFile.substring(originalFile.lastIndexOf("."));
			// pen.png
			// lastIndexOf(".") = 3
			// substring(lastIndexOf(".") = 3) = .png

			// UUID클래스 - (특수문자를 포함한)문자를 랜덤으로 생성, 중복된 이름으로 저장되지 않도록 하기 위해서
			// db에 저장될 file의 이름 + .확장자
			String saveFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExt;
			System.out.println("DB에 저장될 file의 이름 : " + saveFileName);
			String fullPathName = uploadRealPath + "/" + saveFileName;
			
			try {
				fm.transferTo(new File(uploadRealPath + "/" + saveFileName));
				dto.setClass_media_name(saveFileName);
				dto.setClass_media_path(fullPathName);
				System.out.println("강의 추가할 떄 강의 동영상 추가 성공!");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		//여기까지 동영상 파일 업로드
		
		int res = cBiz.insert(dto);
		
		if(res > 0) {
			System.out.println("teacherController 강의 등록 성공");
			model.addAttribute("msg", "강의 등록 성공!");
			model.addAttribute("url", "main.do");
		}else{
			System.out.println("teacherController 강의 등록 성공");
			model.addAttribute("msg", "강의 등록 실패");
			model.addAttribute("url", "main.do");
		}
		
		return "alert";
	}
	
	@RequestMapping("/classdetailteacher.do")
	public String classDetailTeacher(@RequestParam(value="teacher_id") String teacher_id, Model model) {
		
		logger.info("[teacherController] : 선택한 강사 detail + class list 창으로 가기");
		
		List<ClassDetailDto> list = new ArrayList<ClassDetailDto>();
		MemberDto dto = new MemberDto();
		
		list = cBiz.selectList(teacher_id);		//강의 목록들 리스트로 뽑아옴
		dto = mBiz.selectOne(teacher_id);		//강사 사진 가지고 올 수 있음
		
		model.addAttribute("list", list);
		model.addAttribute("dto", dto);
		
		return "classteacher";
	}
	
	@RequestMapping("/classdetail.do")
	public String classDetail(@RequestParam(value="class_num") int class_num, Model model) {
		
		logger.info("[teacherController] : 결제진행할 class_num 가지고 classDto가지고 classdetailpay.jsp로 가자");
		
		ClassDto dto = cBiz.selectOne(class_num);
		
		model.addAttribute("dto", dto);
		
		return "classdetailpay";
	}
	
}