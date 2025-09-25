package com.yedam.uriban.ban.member.service;

import java.util.List;

public interface ClassMemberService {
	
	// 메일에 보낼 클래스 명단 리스트
		public List<ClassMemberVO> getIdList(ClassMemberVO memberVO);
}
