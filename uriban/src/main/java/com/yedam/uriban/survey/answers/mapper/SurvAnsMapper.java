package com.yedam.uriban.survey.answers.mapper;

import java.util.List;
import java.util.Map;

import com.yedam.uriban.survey.answers.service.SurvAnswersVO;

public interface SurvAnsMapper {
	// 전체 조회
	public List<SurvAnswersVO> selectSurvAnswersList();
	
	// 질문에 답변 List
	public List<Map<String, Object>> selectChartAnswers(int questionNo);
	
	// 등록
	public int insertSurvAnswers(SurvAnswersVO survAnswersVO);
	
	// 수정
	public int updateSurvAnswers(SurvAnswersVO survAnswersVO);
		
	// 삭제
	public int deleteSurvAnswers(int questionNo);
	
	// 선택 삭제
	public int deleteSelAnswers(int questionNo);
	
	// 보기 삭제
	public int deleteAnswers(int answerNo);

}
