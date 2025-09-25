package com.yedam.uriban.survey.people.service;

import java.util.List;
import java.util.Map;

import com.yedam.uriban.survey.survey.service.SurveyVO;

public interface PeopleService {
	// 전체조회
	public List<PeopleVO> getPeopleAll(PeopleVO peopleVO);
	
	// 단건조회
	public PeopleVO getPeople(PeopleVO peopleVO);	
	
	// 업데이트 용 단건조회
	public PeopleVO selectPeople(PeopleVO peopleVO);
	
	// 응답자 구분조회
	public PeopleVO selectResponse(PeopleVO peopleVO);
	
	// 설문조사 삭제 시 응답 내역 확인용
	public int selectCntPeople(int survNo);
	
	// 등록
	public int insertPeopleInfo(PeopleVO peopleVO);
		
	// 수정
	public int updatePeopleInfo(PeopleVO peopleVO);	
	
	// 삭제
	public int deletePeopleInfo(int survNo);
}
