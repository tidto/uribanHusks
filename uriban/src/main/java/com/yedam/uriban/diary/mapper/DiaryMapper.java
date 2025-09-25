package com.yedam.uriban.diary.mapper;

import java.util.List;

import com.yedam.uriban.diary.service.DiaryVO;
import com.yedam.uriban.student.service.StudentVO;

public interface DiaryMapper {

	// 학생 조회
	public List<StudentVO> getStudentList(StudentVO studentVO);

	// 단건조회
	public List<DiaryVO> getDiaryInfo(DiaryVO diaryVO);

	// 일지 등록
	public int insertDiary(DiaryVO diaryVO);

	// 일지 수정
	public int updateDiary(DiaryVO diaryVO);

	// 일지 삭제
	public int deleteDiary(int diaryNo);
	
	// 월별로 조회하기
	public List<DiaryVO> selectDiaryMonth(DiaryVO diaryVO);

}
