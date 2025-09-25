package com.yedam.uriban.survey.answers.mapper;

import java.util.List;

import com.yedam.uriban.survey.answers.service.RespAnswersVO;

public interface RespAnsMapper {
	// 전체 조회
	public List<RespAnswersVO> selectRespAnswersList();
	
	// 학생의 답안 조회
	public List<RespAnswersVO> selectRespAnswersInfo(RespAnswersVO respAnswersVO);
	
	// 전체 답안 조회
	public List<RespAnswersVO> selectAnswerAll(RespAnswersVO respAnswersVO);
	
	// 등록
	public int insertRespAnswers(RespAnswersVO respAnswersVO);
	
	// 수정
	public int updateRespAnswers(RespAnswersVO respAnswersVO);
		
	// 삭제
	public int deleteRespAnswers(int responseNo);
}
