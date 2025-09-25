package com.yedam.uriban.survey.survey.mapper;

import java.util.List;

import com.yedam.uriban.survey.survey.service.SurveyVO;

public interface SurveyMapper {
	// 전체 조회
	public List<SurveyVO> selectSurveyList();
	
	// 단건 조회
	public SurveyVO selectSurveyInfo(SurveyVO surveyVO);
	
	// 등록
	public int insertSurvey(SurveyVO surveyVO);
	
	// 등록 시 surveyList에 제출 완료 변경
	public List<SurveyVO> getSubmitList(int classId);
	
	// 등록 시 surveyList에 제출 완료 변경
	public List<SurveyVO> getPeopleList(SurveyVO surveyVO);
	
	// 수정
	public int updateSurvey(SurveyVO surveyVO);
		
	// 삭제
	public int deleteSurvey(int survNo);
	
	// 선택 삭제
	public int deleteSelectSurvey(int survNo);
	
	public List<SurveyVO> selectSurveyListTop(SurveyVO surveyVO);
	
	// 수정 시 응답 유무
	public int selectPeopleCnt(int survNo);
}
