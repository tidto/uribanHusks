package com.yedam.uriban.testbank.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.yedam.uriban.common.CommonFileUpload;
import com.yedam.uriban.testanswer.mapper.TestAnswerMapper;
import com.yedam.uriban.testanswer.service.TestAnswerVO;
import com.yedam.uriban.testbank.mapper.TestBankMapper;
import com.yedam.uriban.testbank.service.TestBankService;
import com.yedam.uriban.testbank.service.TestBankVO;

@Service
public class TestBankServiceImpl implements TestBankService {

	@Autowired
	TestBankMapper testBankMapper;
	
	@Autowired
	TestAnswerMapper testAnswerMapper;
	
	@Autowired
	CommonFileUpload fileUpload;
	
	// Image 업로드 경로
	@Value("#{prop['file.testBank.upload.path']}")
	private String imagePath;
	
	@Override
	public List<TestBankVO> getTestBankList(TestBankVO testBankVO) {
		return testBankMapper.selectTestBankList(testBankVO);
	}

	@Override
	public TestBankVO getTestBank(TestBankVO testBankVO) {
		return testBankMapper.selectTestBank(testBankVO);
	}

	@Override
	public int insertTestBankInfo(TestBankVO testBankVO) {
		Map<String, String> map = fileUpload.saveFile(testBankVO.getTestImage(), imagePath);
		
		testBankVO.setTestImg(map.get("SavefileName"));
		
		testBankMapper.insertTestBank(testBankVO);
		
		
		for(String answer : testBankVO.getAnswers()) {
			if(answer != null && !answer.equals("")) {
				TestAnswerVO vo = new TestAnswerVO();
				vo.setTestAnswer(answer);
				vo.setTestNo(testBankVO.getTestNo());
				testAnswerMapper.insertTestAnswer(vo);
			}
		}
		
		return 0;
	}

	@Override
	public int updateTestBankInfo(TestBankVO testBankVO) {
		if(testBankVO.getAnswerList() != null) {
			for(TestAnswerVO answer : testBankVO.getAnswerList()) {
				testAnswerMapper.updateTestAnswer(answer);
			}
		}
		return testBankMapper.updateTestBank(testBankVO) == 1 ? testBankVO.getTestNo() : -1;
	}

	@Override
	public int deleteTestBankInfo(List<TestBankVO> testList) {
		int result=0;
		for(TestBankVO test:testList) {
			testAnswerMapper.deleteTestAnswer(test.getTestNo());
			result = testBankMapper.deleteTestBank(test.getTestNo());
		}
				
		if(result >= 1) {
			return result;
		} else {
			return -1;
		}
	}

	@Override
	public int deleteTestBankInfo(int testNo) {
		testAnswerMapper.deleteTestAnswer(testNo);
		int result = testBankMapper.deleteTestBank(testNo);
		
		if(result == 1) {
			return testNo;
		} else {
			return -1;
		}
	}

	
	@Override
	public List<TestBankVO> selectHomeworkTest(int homeworkNo) {
		return testBankMapper.selectHomeworkTest(homeworkNo);
	}

	@Override
	public List<TestBankVO> getPageList(Map<String, Object> map) {
		return testBankMapper.getPageList(map);
	}

	@Override
	public int getCount(Map<String, Object> map) {
		return testBankMapper.getCount(map);
	}

	@Override
	public String getCodeName(String subjectNo) {
		return testBankMapper.getCodeName(subjectNo);
	}
}