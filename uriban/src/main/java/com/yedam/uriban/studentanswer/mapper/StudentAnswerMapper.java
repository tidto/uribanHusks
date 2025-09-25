package com.yedam.uriban.studentanswer.mapper;

import java.util.List;
import java.util.Map;

import com.yedam.uriban.studentanswer.service.StudentAnswerVO;
import com.yedam.uriban.submittest.service.SubmitTestVO;

public interface StudentAnswerMapper {
	List<StudentAnswerVO> selectStudentAnswerList();
	
	public StudentAnswerVO selectStudentAnswer(StudentAnswerVO studentAnswerVO);
	
	public List<StudentAnswerVO> selectStudentAnswers(SubmitTestVO submitVO);
	
	public int insertStudentAnswer(StudentAnswerVO studentAnswerVO);
	
	public int updateStudentAnswer(StudentAnswerVO studentAnswerVO);
	
	public int updateWrongMemo(StudentAnswerVO studentAnswerVO);
	
	public int deleteStudentAnswer(int studentAnswerNo);
	
	//paging
	public List<StudentAnswerVO> getPageList(Map<String, Object> map);
	
	int getCount(Map<String, Object> map);
}
