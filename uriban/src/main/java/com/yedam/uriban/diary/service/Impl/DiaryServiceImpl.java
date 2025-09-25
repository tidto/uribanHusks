package com.yedam.uriban.diary.service.Impl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.uriban.diary.mapper.DiaryMapper;
import com.yedam.uriban.diary.service.DiaryService;
import com.yedam.uriban.diary.service.DiaryVO;
import com.yedam.uriban.student.mapper.StudentMapper;
import com.yedam.uriban.student.service.StudentVO;

@Service
public class DiaryServiceImpl implements DiaryService{

	@Autowired
	DiaryMapper	diaryMapper;
	
	@Autowired
	StudentMapper studentMapper;
	

	
	@Override
	public List<StudentVO> getStudentList() {
		List<StudentVO> list = studentMapper.getStudentList();
		return list;
	}
	
	@Override
	public List<DiaryVO> getDiaryInfo(DiaryVO diaryVO) {
		return diaryMapper.getDiaryInfo(diaryVO);
	}

	@Override
	public int InsertDiary(DiaryVO diaryVO) {
		return diaryMapper.insertDiary(diaryVO) == 1 ? diaryVO.getDiaryNo() : -1;
	}

	@Override
	public int UpdateDiary(DiaryVO diaryVO) {
		return diaryMapper.updateDiary(diaryVO) == 1 ? diaryVO.getDiaryNo() : -1;
	}

	@Override
	public int DeleteDiary(int diaryNo) {
		return diaryMapper.deleteDiary(diaryNo) == 1 ? diaryNo : -1;
	}
	
}
