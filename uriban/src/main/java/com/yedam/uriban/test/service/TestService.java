package com.yedam.uriban.test.service;

import java.util.List;

public interface TestService {
	List<TestVO> getTestList();
	
	public List<TestVO> getTest(TestVO testVO);
	
	public TestVO selectContainTest(TestVO testVO);
	
	public int insertTestInfo(TestVO testVO);
	
	public int updateTestInfo(TestVO testVO);
	
	public int deleteTestInfo(int testMngNo);
	
	public int deleteInputTestInfo(int testNo);
}
