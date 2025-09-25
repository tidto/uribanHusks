package com.yedam.uriban.studentanswer.service;

import java.util.List;
import java.util.Map;

import com.yedam.uriban.submittest.service.SubmitTestVO;

public interface StudentAnswerService {
	List<StudentAnswerVO> getStudentAnswerList();
	
	public StudentAnswerVO getStudentAnswer(StudentAnswerVO studentAnswerVO);
	
	public List<StudentAnswerVO> selectStudentAnswers(SubmitTestVO submitVO);
	
	public int insertStudentAnswerInfo(StudentAnswerVO studentAnswerVO);
	
	public int updateStudentAnswerInfo(StudentAnswerVO studentAnswerVO);
	
	public int updateWrongMemo(List<StudentAnswerVO> studentAnswerVO);
	
	public int deleteStudentAnswerInfo(int studentAnswerNo);
	
	//paging
	public List<StudentAnswerVO> getPageList(Map<String, Object> map);
	
	int getCount(Map<String, Object> map);
}
