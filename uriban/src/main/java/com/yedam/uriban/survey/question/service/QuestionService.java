package com.yedam.uriban.survey.question.service;

import java.util.List;
import java.util.Map;

public interface QuestionService {
	// 전체조회
	public List<QuestionVO> getQuestionAll();
	
	// 단건조회
	public List<QuestionVO> getQuestion(QuestionVO questionVO);	
	
	// 등록
	public void insertQuestion(List<QuestionVO> list);
		
	// 수정
	public int updateQuestion(QuestionVO questionVO);	
	
	// 삭제
	public int deleteQuestion(int questionNo);
	
	// 한문제 삭제
	public int  deleteSelectSurvey(QuestionVO questionVO);
	
	// 차트 통계 데이터
	public Map<String, Object> getChartQuestion(QuestionVO questioVO);
}
