package com.yedam.uriban.submittest.service;

import java.util.List;
import java.util.Map;

public interface SubmitTestService {
	List<SubmitTestVO> getSubmitTestList();
	
	public SubmitTestVO getSubmitTest(SubmitTestVO submitTestVO);
	
	public SubmitTestVO getSubmitTestWithHomework(SubmitTestVO submitTestVO);
	
	public int insertSubmitTestInfo(SubmitTestVO submitTestVO);
	
	public int updateSubmitTestInfo(SubmitTestVO submitTestVO);
	
	public int deleteSubmitTestInfo(int submitTestNo);
	
	List<SubmitTestVO> getPageList(Map<String, Object> map);
	
	int getCount(Map<String, Object> map);
}
