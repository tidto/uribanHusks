package com.yedam.uriban.test.mapper;

import java.util.List;

import com.yedam.uriban.test.service.TestVO;

public interface TestMapper {
	List<TestVO> selectTestList();
	
	public List<TestVO> selectTest(TestVO testVO);
	
	public TestVO selectContainTest(TestVO testVO);
	
	public int insertTest(TestVO testVO);
	
	public int insertSelectedTest(TestVO testVO);
	
	public int updateTest(TestVO testVO);
	
	public int deleteTest(int testMngNo);
	
	public int deleteInputTest(int testNo);
}
