package com.yedam.uriban.myclass.service;

import java.util.List;
import java.util.Map;

import com.yedam.uriban.member.service.MemberVO;

public interface MyClassService {
	// 전체조회
	public List<MyClassVO> getMyClassList();
	
	//내 반만 조회
	public List<Map<String,Object>> getMyClass(MemberVO memberVO);
	
	// 단건조회
	public MyClassVO getMyClassInfo(MyClassVO myClassVO);

	// 등록
	public int insertMyClass(MyClassVO myClassVO);

	// 수정
	public Map<String, String> updateMyClass(MyClassVO myClassVO);

	// 삭제
	public int deleteMyClass(MyClassVO myClassVO);
}
 