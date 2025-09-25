package com.yedam.uriban.submittest.mapper;

import java.util.List;
import java.util.Map;

import com.yedam.uriban.homework.service.HomeworkVO;
import com.yedam.uriban.submittest.service.SubmitTestVO;

public interface SubmitTestMapper {
	List<SubmitTestVO> selectSubmitTestList();
	
	public SubmitTestVO selectSubmitTest(SubmitTestVO submitTestVO);
	
	public SubmitTestVO selectSubmitTestWithHomework(SubmitTestVO submitTestVO);
	
	public int insertSubmitTest(SubmitTestVO submitTestVO);
	
	public int updateSubmitTest(SubmitTestVO submitTestVO);
	
	public int deleteSubmitTest(int submitTestNo);
	
	List<SubmitTestVO> getPageList(Map<String, Object> map);
	
	int getCount(Map<String, Object> map);
}
