package com.yedam.uriban.survey.question.mapper;

import java.util.List;

import com.yedam.uriban.survey.question.service.QuestionVO;
import com.yedam.uriban.survey.survey.service.SurveyVO;

public interface QuestionMapper {
	// 전체 조회
	public List<QuestionVO> selectQuestionList();
	
	// 문제 차트 조회
	public List<QuestionVO> selectQuestionInfo(QuestionVO questionVO);
	// 등록
	public int insertQuestion(QuestionVO questionVO);
	
	// 수정
	public int updateQuestion(QuestionVO questionVO);
		
	// 삭제
	public int deleteQuestion(int questionNo);
	
	// 선택 삭제
	public int deleteSelectQuestion(int questionNo);
}
