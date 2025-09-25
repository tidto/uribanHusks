package com.yedam.uriban.student.service;

import java.util.List;
import java.util.Map;

public interface StudentService {
	// 전체조회
	public List<StudentVO> getStudentList(StudentVO studentVO);

	// 단건조회
	public StudentVO getStudentInfo(StudentVO studentVO);

	// 등록
	public int InsertStudent(StudentVO studentVO);

	// 수정
	public Map<String, String> UpdateStudent(StudentVO studentVO);

	// 삭제
	public int DeleteStudent(StudentVO memberId);
	
	// 학생 나의 반 가입
	public Integer studentJoin(StudentVO studentVO);

	
}