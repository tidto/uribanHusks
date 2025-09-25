package com.yedam.uriban.testanswer.mapper;

import java.util.List;

import com.yedam.uriban.testanswer.service.TestAnswerVO;

public interface TestAnswerMapper {
	List<TestAnswerVO> selectTestAnswerList();
	
	public List<TestAnswerVO> selectAnswers(TestAnswerVO testAnswerVO);
	
	public TestAnswerVO selectTestAnswer(TestAnswerVO testAnswerVO);
	
	public int insertTestAnswer(TestAnswerVO testAnswerVO);
	
	public int updateTestAnswer(TestAnswerVO testAnswerVO);
	
	public int deleteTestAnswer(int answerNo);
}
