package com.yedam.uriban.testbank.service;

import java.util.List;
import java.util.Map;

public interface TestBankService {
	public List<TestBankVO> getTestBankList(TestBankVO testBankVO);
	
	public List<TestBankVO> selectHomeworkTest(int homeworkNo); 
	
	public TestBankVO getTestBank(TestBankVO testBankVO);
	
	public int insertTestBankInfo(TestBankVO testBankVO);
	
	public int updateTestBankInfo(TestBankVO testBankVO);
	
	public int deleteTestBankInfo(List<TestBankVO> testList);
	
	public int deleteTestBankInfo(int testNo);
	
	public String getCodeName(String subjectNo);
	
	//paging
	public List<TestBankVO> getPageList(Map<String, Object> map);
	
	int getCount(Map<String, Object> map);
}