package com.yedam.uriban.studentanswer.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.uriban.studentanswer.mapper.StudentAnswerMapper;
import com.yedam.uriban.studentanswer.service.StudentAnswerService;
import com.yedam.uriban.studentanswer.service.StudentAnswerVO;
import com.yedam.uriban.submittest.service.SubmitTestVO;

@Service
public class studentAnswerServiceImpl implements StudentAnswerService {

	@Autowired
	StudentAnswerMapper studentAnswerMapper;
	
	@Override
	public List<StudentAnswerVO> getStudentAnswerList() {
		return studentAnswerMapper.selectStudentAnswerList();
	}

	@Override
	public StudentAnswerVO getStudentAnswer(StudentAnswerVO studentAnswerVO) {
		return studentAnswerMapper.selectStudentAnswer(studentAnswerVO);
	}

	@Override
	public int insertStudentAnswerInfo(StudentAnswerVO studentAnswerVO) {
		return studentAnswerMapper.insertStudentAnswer(studentAnswerVO) == 1 ? studentAnswerVO.getStudentAnswerNo() : -1;
	}

	@Override
	public int updateStudentAnswerInfo(StudentAnswerVO studentAnswerVO) {
		return studentAnswerMapper.updateStudentAnswer(studentAnswerVO) == 1 ? studentAnswerVO.getStudentAnswerNo() : -1;
	}

	@Override
	public int deleteStudentAnswerInfo(int studentAnswerNo) {
		int result = studentAnswerMapper.deleteStudentAnswer(studentAnswerNo);
		if(result == 1) {
			return studentAnswerNo;
		} else {
			return -1;
		}
	}

	@Override
	public List<StudentAnswerVO> selectStudentAnswers(SubmitTestVO submitVO) {
		return studentAnswerMapper.selectStudentAnswers(submitVO);
	}

	@Override
	public List<StudentAnswerVO> getPageList(Map<String, Object> map) {
		return studentAnswerMapper.getPageList(map);
	}

	@Override
	public int getCount(Map<String, Object> map) {
		return studentAnswerMapper.getCount(map);
	}

	@Override
	public int updateWrongMemo(List<StudentAnswerVO> list) {
		for(StudentAnswerVO vo : list) {
			studentAnswerMapper.updateWrongMemo(vo);
		}
		return 0;
	}
}
