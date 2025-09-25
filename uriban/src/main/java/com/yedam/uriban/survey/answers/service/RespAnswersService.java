package com.yedam.uriban.survey.answers.service;

import java.util.List;

public interface RespAnswersService {
	// 전체조회
	public List<RespAnswersVO> getRespAnswersAll();
	
	// 학생의 답안 조회
	public List<RespAnswersVO> getRespAnswers(RespAnswersVO respAnswersVO);	
	
	// 학생의 답안 조회
	public List<RespAnswersVO> getRespAnswerAll(RespAnswersVO respAnswersVO);	
	
	// 등록
	public int insertRespAnswersInfo(RespAnswersVO respAnswersVO);
		
	// 수정
	public int updateRespAnswersInfo(RespAnswersVO respAnswersVO);	
	
	// 삭제
	public int deleteRespAnswersInfo(int survManNo);
}
