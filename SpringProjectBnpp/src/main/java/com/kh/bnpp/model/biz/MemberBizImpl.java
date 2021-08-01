
package com.kh.bnpp.model.biz;

import java.security.SecureRandom;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.bnpp.model.dao.MemberDao;
import com.kh.bnpp.model.dto.MemberDto;

import com.kh.bnpp.email.*;

@Service
public class MemberBizImpl implements MemberBiz{

	@Autowired
	private MemberDao dao;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Override
	public MemberDto login(MemberDto dto) {
		return dao.login(dto);
	}

	@Override
	public int insert(MemberDto dto) {
		
		if(dto.getMember_role() == null) {
			dto.setMember_role("M");
		}
		return dao.insert(dto);
	}

	@Override
	public int delete(MemberDto dto) {
		return dao.delete(dto);
	}
	
	@Override
	public String checkId(String checkID) {
		return dao.checkId(checkID);
	}

	@Override
	public String findId(MemberDto dto) {
		return dao.findId(dto);
	}

	@Override
	public String findPw(MemberDto dto) {
		return dao.findPw(dto);
	}
	
	@Override
	public List<MemberDto> selectList() {
		return dao.selectList();
	}

	@Override
	public MemberDto selectOne(String member_id) {
		return dao.selectOne(member_id);
	}
	
	@Override
	public int updatestudent(MemberDto dto) {
		return dao.updatestudent(dto);
	}
	
	@Override
	public int updateteacher(MemberDto dto) {
		return dao.updateteacher(dto);
	}

	@Override
	public List<MemberDto> findAllT(String category) {
		return dao.findAllT(category);
	}

	@Override
	public int updatepw(MemberDto dto) {
		
		return dao.updatepw(dto);
	}
	
	public String getRandomPassword(int size) { 
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 
				'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o'
				, 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '!', '@', '#', '$', '%', '^', '&' }; 
		
		StringBuffer sb = new StringBuffer(); 
		SecureRandom sr = new SecureRandom(); 
		sr.setSeed(new Date().getTime());
		System.out.println("sr에 setSeed한거 어케 새김? : " + sr);
		
		int idx = 0; 
		int len = charSet.length;
		
		for (int i=0; i<size; i++) { 
			// idx = (int) (len * Math.random());
			idx = sr.nextInt(len); 
			// 강력한 난수를 발생시키기 위해 SecureRandom을 사용한다. 
			sb.append(charSet[idx]); 
		} 
		
		return sb.toString(); 
	}

	@Override
	public int updateEmailPw(MemberDto dto) {
	    String temPw = getRandomPassword(10);
		//asdgfdgf
	    
		dto.setMember_pw(passwordEncoder.encode(temPw));
		String to = dto.getMember_email();
		String subject = "임시비밀번호를 발송해 드립니다!";
		String content = "Bon Appeti!" + "발송해드린 임시비밀번호"
						+"["+ temPw +"]"+"로 로그인하셔서 비밀번호를 변경해주세요!";
		
		try {
			MailSend.sendEmail(to, subject, content);
			System.out.println("메일 발송 성공!");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return dao.updatepw(dto);
	}
	
}