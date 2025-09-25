package com.yedam.uriban.homework.service;

import java.util.List;
import java.util.Map;

public interface HomeworkService {
	public List<HomeworkVO> getHomeworkList(HomeworkVO homeworkVO);
	
	public List<HomeworkVO> getHomeworkListTest();
	
	public List<HomeworkVO> getStudentHomeworkList(HomeworkVO homeworkVO);
	
	public HomeworkVO getHomework(HomeworkVO homeworkVO);
	
	public int insertHomeworkInfo(HomeworkVO homeworkVO);
	
	public int updateHomeworkInfo(HomeworkVO homeworkVO);
	
	public int deleteHomeworkInfo(int homeworkNO);
	
	List<HomeworkVO> getPageList(Map<String, Object> map);
	
	int getCount(Map<String, Object> map);
}