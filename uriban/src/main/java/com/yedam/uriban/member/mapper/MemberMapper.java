package com.yedam.uriban.member.mapper;

import java.util.List;

import com.yedam.uriban.member.service.MemberVO;

public interface MemberMapper {
	// 전체 조회
	public List<MemberVO> getMemberList();

	// 단건 조회
	public MemberVO getMemberInfo(MemberVO memberVO);

	// 회원 가입
	public int insertMember(MemberVO memberVO);

	// 아이디 중복체크
	public int idCheck(String memberId);

	// 수정 - 교사 권한
	public int updateMemberAuth(MemberVO memberVO);

	// 수정 - 유저 정보
	public int updateMemberInfo(MemberVO memberVO);

	// 회원 탈퇴
	public int deleteMember(MemberVO memberVO);

	// 로그인
	public MemberVO signIn(MemberVO memberVO);

	// 시큐리티 로그인
	public MemberVO getUser(String username);
	
	// 신고횟수 증가
	public int updateMemBan(MemberVO memberVO);
	
	// 밴 체크
	public String banCheck(String memberId);
}
