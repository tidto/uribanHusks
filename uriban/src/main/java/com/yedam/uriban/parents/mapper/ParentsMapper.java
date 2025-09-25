package com.yedam.uriban.parents.mapper;

import java.util.List;

import com.yedam.uriban.parents.service.ParentsVO;

public interface ParentsMapper {
	
	// 전체조회
	public List<ParentsVO> getParentsList(ParentsVO parentsVO);
	
	// 단건조회
	public ParentsVO getParentsInfo(ParentsVO parentsVO);
	
	// 입력
	public int insertParents(ParentsVO parentsVO);
	
	// 수정
	public int updateParents(ParentsVO parentsVO);
	
	// 삭제
	public int deleteParents(ParentsVO memberId);
	
	// 학부모 가입
	public int joinParents(ParentsVO parentsVO);
	
	// 설문 대상자 조회
	public List<ParentsVO> survParentsList(int classId);
	
}
