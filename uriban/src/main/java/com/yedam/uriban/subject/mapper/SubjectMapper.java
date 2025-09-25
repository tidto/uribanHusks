package com.yedam.uriban.subject.mapper;

import java.util.List;

import com.yedam.uriban.subject.service.SubjectVO;

public interface SubjectMapper {
	List<SubjectVO> selectSubjectList();
	
	public SubjectVO selectSubject(SubjectVO subjectVO);
	
	public int insertSubject(SubjectVO subjectVO);
	
	public int updateSubject(SubjectVO subjectVO);
	
	public int deleteSubject(int subjectNo);
}
