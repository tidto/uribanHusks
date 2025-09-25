package com.yedam.uriban.testanswer.service;

import java.util.List;

public interface TestAnswerService {
	List<TestAnswerVO> getTestAnswerList();
	
	public List<TestAnswerVO> getAnswers(TestAnswerVO testAnswerVO);
	
	public TestAnswerVO getTestAnswer(TestAnswerVO testAnswerVO);
	
	public int insertTestAnswerInfo(TestAnswerVO testAnswerVO);
	
	public int updateTestAnswerInfo(TestAnswerVO testAnswerVO);
	
	public int deleteTestAnsweInfor(int answerNo);
}
