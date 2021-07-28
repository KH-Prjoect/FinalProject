
package com.kh.bnpp.model.dao;

import java.util.List;

import com.kh.bnpp.model.dto.MemberDto;

public interface MemberDao {
	
	String NAMESPACE = "member.";
	
	public MemberDto login(MemberDto dto);	//�α���
	public int insert(MemberDto dto);		//ȸ������
	public int delete(MemberDto dto);		//ȸ��Ż��
	public String checkId(String checkID);	//���̵� �ߺ�Ȯ��
	public String findId(MemberDto dto); //���̵� ã��
	public String findPw(MemberDto dto); //��й�ȣ ã��
	public List<MemberDto> findAllT(String category); //ī�װ����� ���� ����Ʈ ã��

	public List<MemberDto> selectList();
	public MemberDto selectOne(String member_id);
	public int updatestudent(MemberDto dto);
	public int updateteacher(MemberDto dto);
	public int updatepw(MemberDto dto);
	
}
