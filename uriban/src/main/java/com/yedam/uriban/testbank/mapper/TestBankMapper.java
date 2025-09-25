package com.yedam.uriban.testbank.mapper;

import java.util.List;
import java.util.Map;

import com.yedam.uriban.testbank.service.TestBankVO;

public interface TestBankMapper {
	public List<TestBankVO> selectTestBankList(TestBankVO testBankVO);
	
	public TestBankVO selectTestBank(TestBankVO testBankVO);
	
	public List<TestBankVO> selectHomeworkTest(int homeworkNo); 
	
	public int insertTestBank(TestBankVO testBankVO);
	
	public int updateTestBank(TestBankVO testBankVO);
	
	public int deleteTestBank(int testNo);
	
	public String getCodeName(String subjectNo);
	
	//paging
	public List<TestBankVO> getPageList(Map<String, Object> map);
	
	int getCount(Map<String, Object> map);
}
