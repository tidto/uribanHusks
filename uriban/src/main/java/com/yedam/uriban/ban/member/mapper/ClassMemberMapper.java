package com.yedam.uriban.ban.member.mapper;

import java.util.List;

import com.yedam.uriban.ban.member.service.ClassMemberVO;

public interface ClassMemberMapper {

	// 메일에 보낼 클래스 명단 리스트
	public List<ClassMemberVO> selectIdList(ClassMemberVO memberVO);
}
