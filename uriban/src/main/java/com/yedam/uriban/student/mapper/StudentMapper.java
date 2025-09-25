package com.yedam.uriban.student.mapper;

import java.util.List;

import com.yedam.uriban.student.service.StudentVO;

public interface StudentMapper {
	// 전체조회
	public List<StudentVO> getStudentList(StudentVO studentVO);

	// 단건조회
	public StudentVO getStudentInfo(StudentVO studentVO);

	// 등록
	public int insertStudent(StudentVO studentVO);

	// 등록
	public int getMaxNo();
	
	// 수정
	public int updateStudent(StudentVO studentVO);

	// 삭제
	public int deleteStudent(StudentVO studentVO);
	
	// 학생 클래스 등록
	public Integer studentJoin(StudentVO studentVO);
	
	// 전체 응답 명단조회
	public List<StudentVO> survStudentList(int classId);

	public List<StudentVO> getStudentList();

}