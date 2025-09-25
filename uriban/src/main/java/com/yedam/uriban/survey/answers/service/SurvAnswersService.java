package com.yedam.uriban.survey.answers.service;

import java.util.List;
import java.util.Map;

public interface SurvAnswersService {
	// 전체조회
	public List<SurvAnswersVO> getSurvAnswersAll();
	
	// 답안 통계 차트
	public List<SurvAnswersVO> getSurvAnswers(int questionNo);	
	
	// 등록
	public void insertSurvAnswers(List<SurvAnswersVO> list);
	
	// 수정
	public int updateSurvAnswers(SurvAnswersVO survAnswersVO);	
	
	// 삭제
	public int deleteSurvAnswers(int survManNo);
	
	// 선택 삭제
	public int deleteSelAnswers(SurvAnswersVO survAnswersVO);
	
	// 보기 삭제
	public int deleteAnswers(int answerNo);
}
