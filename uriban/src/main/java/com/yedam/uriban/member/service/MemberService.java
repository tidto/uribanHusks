package com.yedam.uriban.member.service;

import java.util.List;
import java.util.Map;

public interface MemberService {
		// 전체 조회
		public List<MemberVO> getMemberList();
		
		// 단건 조회
		public MemberVO getMemberInfo(MemberVO memberVO);
		
		// 회원 가입
		public int insertMember(MemberVO memberVO);
		
		// 아이디 중복체크
		public int idCheck(String memberId);
		
		// 수정 - 유저
		public Map<String, String> updateMemberInfo(MemberVO memberVO);
		
		// 수정 - 관리자
		public Map<String, String> updateMember(MemberVO memberVO);
		
		// 회원 탙퇴
		public int deleteMember(MemberVO memberVO);
		
		// 밴 체크
		public int banCheck(String memberId);
		
		
}
