package com.yedam.uriban.survey.survey.service;

import java.util.List;

public interface SurveyService {
	// 전체조회
	public List<SurveyVO> getSurveyAll();
	
	// 단건조회
	public SurveyVO getSurvey(SurveyVO surveyVO);	
	
	// 등록 시 surveyList에 제출 완료 변경
	public List<SurveyVO> getSubmitList(int classId);
	
	// 수정 시 응답 유무
	public int selectPeopleCnt(int survNo);
	
	// 학생, 학부모 리스트
	public List<SurveyVO> getPeopleList(SurveyVO surveyVO);
	
	// 등록
	public int insertSurveyInfo(SurveyVO surveyVO);
	
	// 수정
	public int updateSurveyInfo(SurveyVO surveyVO);	
	
	// 전체 삭제
	public int deleteSurveyInfo(int survNo);
	
	// 선택 삭제
	public void deleteSelectSurvey(SurveyVO surveyVO);
	
	public List<SurveyVO> getSurveyAllTop(SurveyVO surveyVO);
}
