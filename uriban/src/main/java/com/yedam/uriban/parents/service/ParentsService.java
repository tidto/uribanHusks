package com.yedam.uriban.parents.service;

import java.util.List;
import java.util.Map;

public interface ParentsService {
	// 전체조회
	public List<ParentsVO> getParentsList(ParentsVO parentsVO);

	// 단건조회
	public ParentsVO getParentsInfo(ParentsVO parentsVO);

	// 입력
	public int insertParents(ParentsVO parentsVO);

	// 수정
	public Map<String, String> updateParents(ParentsVO parentsVO);

	// 삭제
	public int deleteParents(ParentsVO memberId);

	// 학부모 가입
	public int joinParents(ParentsVO parentsVO);
}
