package com.yedam.uriban.homework.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.uriban.homework.mapper.HomeworkMapper;
import com.yedam.uriban.homework.service.HomeworkService;
import com.yedam.uriban.homework.service.HomeworkVO;
import com.yedam.uriban.test.mapper.TestMapper;
import com.yedam.uriban.test.service.TestVO;
import com.yedam.uriban.testanswer.mapper.TestAnswerMapper;

@Service
public class HomeworkServiceImpl implements HomeworkService {

	@Autowired
	HomeworkMapper homeworkMapper;
	
	@Autowired
	TestAnswerMapper testAnswerMapper;
	
	@Autowired
	TestMapper testMapper;
	
	@Override
	public List<HomeworkVO> getHomeworkList(HomeworkVO homeworkVO) {
		return homeworkMapper.selectHomeworkList();
	}
	
	@Override
	public List<HomeworkVO> getStudentHomeworkList(HomeworkVO homeworkVO) {
		return homeworkMapper.selectStudentHomeworkList(homeworkVO);
	}

	@Override
	public HomeworkVO getHomework(HomeworkVO homeworkVO) {
		return homeworkMapper.selectHomework(homeworkVO);
	}

	@Override
	public int insertHomeworkInfo(HomeworkVO homeworkVO) {
		int result = homeworkMapper.insertHomework(homeworkVO);
		
		if(result == 1) {
			return homeworkVO.getHomeworkNo();
		} else {
			return -1;
		}
		
	}

	@Override
	public int updateHomeworkInfo(HomeworkVO homeworkVO) {
		
		// 테스트 등록
		if(homeworkVO.getTestNo() != null) {
			// 테스트 삭제
			homeworkMapper.deleteTestInHomework(homeworkVO.getHomeworkNo());
			
			for (int i : homeworkVO.getTestNo()) {
				TestVO test = new TestVO();
				
				test.setHomeworkNo(homeworkVO.getHomeworkNo());
				test.setTestNo(i);
				testMapper.insertTest(test);
			}
		}
		
		// 과제 수정
		homeworkMapper.updateHomework(homeworkVO);
		return homeworkVO.getHomeworkNo();
	}
	

	@Override
	public int deleteHomeworkInfo(int homeworkNo) {
		homeworkMapper.deleteTestInHomework(homeworkNo);
		int result = homeworkMapper.deleteHomework(homeworkNo);
		
		if(result == 1) {
			return homeworkNo;
		} else {
			return -1;
		}
	}

	@Override
	public List<HomeworkVO> getPageList(Map<String, Object> map) {
		return homeworkMapper.getPageList(map);
	}

	@Override
	public int getCount(Map<String, Object> map) {
		return homeworkMapper.getCount(map);
	}

	@Override
	public List<HomeworkVO> getHomeworkListTest() {
		return homeworkMapper.selectHomeworkListTest();
	}

}