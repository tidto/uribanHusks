package com.yedam.uriban.homework.mapper;

import java.util.List;
import java.util.Map;

import com.yedam.uriban.homework.service.HomeworkVO;

public interface HomeworkMapper {
	public List<HomeworkVO> selectHomeworkList();
	
	public List<HomeworkVO> selectHomeworkListTest();
	
	public List<HomeworkVO> selectStudentHomeworkList(HomeworkVO homeworkVO);
	
	public HomeworkVO selectHomework(HomeworkVO homeworkVO);
	
	public int insertHomework(HomeworkVO homeworkVO);
	
	public int updateHomework(HomeworkVO homeworkVO);
	
	public int deleteHomework(int homeworkNo);
	
	public int deleteTestInHomework(int homeworkNo);
	
	List<HomeworkVO> getPageList(Map<String, Object> map);
	
	int getCount(Map<String, Object> map);
}