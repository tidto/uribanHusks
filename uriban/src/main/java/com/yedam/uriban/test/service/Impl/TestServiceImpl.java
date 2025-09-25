package com.yedam.uriban.test.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.uriban.test.mapper.TestMapper;
import com.yedam.uriban.test.service.TestService;
import com.yedam.uriban.test.service.TestVO;

@Service
public class TestServiceImpl implements TestService {

	@Autowired
	TestMapper testMapper;
	
	@Override
	public List<TestVO> getTestList() {
		return testMapper.selectTestList();
	}

	@Override
	public List<TestVO> getTest(TestVO testVO) {
		return testMapper.selectTest(testVO);
	}

	@Override
	public int insertTestInfo(TestVO testVO) {
		return testMapper.insertTest(testVO) == 1 ? testVO.getTestMngNo() : -1;
	}

	@Override
	public int updateTestInfo(TestVO testVO) {
		return testMapper.updateTest(testVO) == 1 ? testVO.getTestMngNo() : -1;
	}

	@Override
	public int deleteTestInfo(int testMngNo) {
		int result = testMapper.deleteTest(testMngNo);
		
		if(result == 1) {
			return testMngNo;
		} else {
			return -1;
		}
	}

	@Override
	public TestVO selectContainTest(TestVO testVO) {
		return testMapper.selectContainTest(testVO);
	}

	@Override
	public int deleteInputTestInfo(int testNo) {
		int result = testMapper.deleteInputTest(testNo);
		
		if(result == 1) {
			return testNo;
		} else {
			return -1;
		}
	}

}
