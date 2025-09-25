package com.yedam.uriban.testanswer.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.uriban.testanswer.mapper.TestAnswerMapper;
import com.yedam.uriban.testanswer.service.TestAnswerService;
import com.yedam.uriban.testanswer.service.TestAnswerVO;

@Service
public class TestAnswerServiceImpl implements TestAnswerService {

	@Autowired
	TestAnswerMapper testAnswerMapper;  
	
	@Override
	public List<TestAnswerVO> getTestAnswerList() {
		return testAnswerMapper.selectTestAnswerList();
	}

	@Override
	public TestAnswerVO getTestAnswer(TestAnswerVO testAnswerVO) {
		return testAnswerMapper.selectTestAnswer(testAnswerVO);
	}

	@Override
	public int insertTestAnswerInfo(TestAnswerVO testAnswerVO) {
		return testAnswerMapper.insertTestAnswer(testAnswerVO) == 1 ? testAnswerVO.getAnswerNo() : -1;
	}

	@Override
	public int updateTestAnswerInfo(TestAnswerVO testAnswerVO) {
		return testAnswerMapper.updateTestAnswer(testAnswerVO) == 1 ? testAnswerVO.getAnswerNo() : -1;
	}

	@Override
	public int deleteTestAnsweInfor(int answerNo) {
		int result = testAnswerMapper.deleteTestAnswer(answerNo);
		
		if(result == 1) {
			return answerNo;
		} else {
			return -1;
		}
	}

	@Override
	public List<TestAnswerVO> getAnswers(TestAnswerVO testAnswerVO) {
		return testAnswerMapper.selectAnswers(testAnswerVO);
	}
}
