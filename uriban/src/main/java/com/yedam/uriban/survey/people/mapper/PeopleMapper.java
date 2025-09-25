package com.yedam.uriban.survey.people.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.yedam.uriban.survey.people.service.PeopleVO;
import com.yedam.uriban.survey.survey.service.SurveyVO;

public interface PeopleMapper {
	// 전체 조회
	public List<PeopleVO> selectPeopleList(PeopleVO peopleVO);
	
	// 단건 조회
	public PeopleVO selectPeopleInfo(PeopleVO peopleVO);
	
	// 업데이트 용 단건조회
	public PeopleVO selectPeople(PeopleVO peopleVO);

	// 응답자 구분조회
	public PeopleVO selectResponse(PeopleVO peopleVO);
	
	// 응답 인원 바차트
	public Map<String, Object> selectBarChart(int survNo);
	
	// 설문조사 삭제 시 응답 내역 확인용
	public int selectCntPeople(int survNo);
	
	// 등록
	public int insertPeople(PeopleVO peopleVO);
	
	// 수정
	public int updatePeople(PeopleVO peopleVO);
		
	// 삭제
	public int deletePeople(int survNo);
}
