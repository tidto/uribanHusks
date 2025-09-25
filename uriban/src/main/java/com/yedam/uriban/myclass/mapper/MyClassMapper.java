package com.yedam.uriban.myclass.mapper;

import java.util.List;
import java.util.Map;

import com.yedam.uriban.member.service.MemberVO;
import com.yedam.uriban.myclass.service.MyClassMemberVO;
import com.yedam.uriban.myclass.service.MyClassVO;

public interface MyClassMapper {
	// 전체 조회
	public List<MyClassVO> getMyClassList();

	// 가입된 반만 조회
	public List<Map<String,Object>> getMyClass(MemberVO memberVO);
	
	/*
	 * // 학부모 가입된 반만 조회 public List<MyClassVO> getPrMyClass(String memId);
	 */

	// 단건 조회
	public MyClassVO getMyClassInfo(MyClassVO myClassVO);

	// 생성
	public int insertMyClass(MyClassVO myClassVO);

	// 수정
	public int updateMyClass(MyClassVO myClassVO);

	// 삭제
	public int deleteMyClass(MyClassVO myClassVO);

	// classMember생성
	public int insertClassMember(MyClassMemberVO myClassMemberVO);

}
