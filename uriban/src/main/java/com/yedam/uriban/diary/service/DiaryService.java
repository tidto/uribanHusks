package com.yedam.uriban.diary.service;

import java.util.List;

import com.yedam.uriban.student.service.StudentVO;


public interface DiaryService {
	
	//학생리스트
	public List<StudentVO> getStudentList();

	// 단건조회
	public List<DiaryVO> getDiaryInfo(DiaryVO diaryVO);

	// 일지등록
	public int InsertDiary(DiaryVO diaryVO);
	
	// 일지수정
	public int UpdateDiary(DiaryVO DiaryVO);
	
	// 일지삭제
	public int DeleteDiary(int diaryNo);
	
}
