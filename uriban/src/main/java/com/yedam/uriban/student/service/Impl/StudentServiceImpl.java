package com.yedam.uriban.student.service.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.uriban.album.album.service.AlbumVO;
import com.yedam.uriban.diary.mapper.DiaryMapper;
import com.yedam.uriban.diary.service.DiaryVO;
import com.yedam.uriban.student.mapper.StudentMapper;
import com.yedam.uriban.student.service.StudentService;
import com.yedam.uriban.student.service.StudentVO;

@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	StudentMapper studentMapper;

	@Override
	public List<StudentVO> getStudentList(StudentVO studentVO) {
		List<StudentVO> studentList = studentMapper.getStudentList(studentVO);
		return studentList;
	}

	@Override
	public StudentVO getStudentInfo(StudentVO studentVO) {
		return studentMapper.getStudentInfo(studentVO);
	}

	@Override
	public int InsertStudent(StudentVO studentVO) {
		studentVO.setStudentNo(studentMapper.getMaxNo());
		return studentMapper.insertStudent(studentVO) == 1 ? 1 : -1;
	}

	@Override
	public Map<String, String> UpdateStudent(StudentVO studentVO) {
		Map<String, String> map = new HashMap<>();

		map.put("아이디", studentVO.getMemberId());

		int result = studentMapper.updateStudent(studentVO);
		if (result == 1) {
			map.put("결과", "Success");
		} else {
			map.put("결과", "fail");
		}
		return map;
	}

	@Override
	public int DeleteStudent(StudentVO studentVO) {
		return studentMapper.deleteStudent(studentVO);
	}

	@Override
	public Integer studentJoin(StudentVO studentVO) {
		
		return studentMapper.studentJoin(studentVO);
		
	}
}