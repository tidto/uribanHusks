package com.yedam.uriban.submittest.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.uriban.studentanswer.mapper.StudentAnswerMapper;
import com.yedam.uriban.studentanswer.service.StudentAnswerVO;
import com.yedam.uriban.submittest.mapper.SubmitTestMapper;
import com.yedam.uriban.submittest.service.SubmitTestService;
import com.yedam.uriban.submittest.service.SubmitTestVO;
import com.yedam.uriban.testbank.mapper.TestBankMapper;
import com.yedam.uriban.testbank.service.TestBankVO;

@Service
public class SubmitTestServiceImpl implements SubmitTestService {

	@Autowired
	SubmitTestMapper submitTestMapper; 
	
	@Autowired
	StudentAnswerMapper studentAnswerMapper;
	
	@Autowired
	TestBankMapper testBankMapper;
	
	@Override
	public List<SubmitTestVO> getSubmitTestList() {
		return submitTestMapper.selectSubmitTestList();
	}

	@Override
	public SubmitTestVO getSubmitTest(SubmitTestVO submitTestVO) {
		return submitTestMapper.selectSubmitTest(submitTestVO);
	}

	@Override
	public int insertSubmitTestInfo(SubmitTestVO submitTestVO) {			
		submitTestMapper.insertSubmitTest(submitTestVO);
		int correctCnt = 0;
		int totCnt = 0;
		int totScore = 0;
		int correctScore = 0;
		double totalScore = 0;
		String answerPercent = "";
		
		for(StudentAnswerVO studentAnswerVO : submitTestVO.getAnswer()) {
			studentAnswerVO.setSubmitTestNo(submitTestVO.getSubmitTestNo());
			
			TestBankVO bankVO = new TestBankVO();
			bankVO.setTestNo(studentAnswerVO.getAnswerNo());
			bankVO = testBankMapper.selectTestBank(bankVO);
		
			if(bankVO.getTestCorrect().equals(studentAnswerVO.getStudentAnswer())) {
				studentAnswerVO.setCorrectOrWrong("C401");
				correctCnt++;
				correctScore += bankVO.getTestScore();
				totScore += bankVO.getTestScore();
			}else {
				studentAnswerVO.setCorrectOrWrong("C402");
				totScore += bankVO.getTestScore();
			}
			
			studentAnswerMapper.insertStudentAnswer(studentAnswerVO);
			totCnt++;
		}
		
		totalScore = ((double)correctScore/(double)totScore) *100.0;
		totScore = (int)Math.ceil(totalScore);
		
		answerPercent = correctCnt + "/" + totCnt;
		
		SubmitTestVO submitVO = new SubmitTestVO();
		submitVO.setTotalScore(totScore);
		submitVO.setAnswerPercent(answerPercent);
		submitVO.setSubmitTestNo(submitTestVO.getSubmitTestNo());
		submitTestMapper.updateSubmitTest(submitVO);
		
		return 1;
	}

	@Override
	public int updateSubmitTestInfo(SubmitTestVO submitTestVO) {
		return submitTestMapper.updateSubmitTest(submitTestVO) == 1 ? submitTestVO.getSubmitTestNo() : -1;
	}

	@Override
	public int deleteSubmitTestInfo(int submitTestNo) {
		int result = submitTestMapper.deleteSubmitTest(submitTestNo);
		
		if(result == 1) {
			return submitTestNo;
		} else {
			return -1;
		}
	}

	@Override
	public SubmitTestVO getSubmitTestWithHomework(SubmitTestVO submitTestVO) {
		return submitTestMapper.selectSubmitTestWithHomework(submitTestVO);
		
		
	}

	@Override
	public List<SubmitTestVO> getPageList(Map<String, Object> map) {
		return submitTestMapper.getPageList(map);
	}

	@Override
	public int getCount(Map<String, Object> map) {
		return submitTestMapper.getCount(map);
	}
}
