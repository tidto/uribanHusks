package com.yedam.uriban.subject.service;

import java.util.List;

public interface SubjectService {
	List<SubjectVO> getSubjectList();
	
	public SubjectVO getSubject(SubjectVO subjectVO);
	
	public int insertSubjectInfo(SubjectVO subjectVO);
	
	public int deleteSubjectInfo(int subjectNo);
}
