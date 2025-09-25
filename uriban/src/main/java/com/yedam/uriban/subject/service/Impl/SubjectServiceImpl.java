package com.yedam.uriban.subject.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.uriban.subject.mapper.SubjectMapper;
import com.yedam.uriban.subject.service.SubjectService;
import com.yedam.uriban.subject.service.SubjectVO;

@Service
public class SubjectServiceImpl implements SubjectService {

	@Autowired
	SubjectMapper subjectMapper;
	
	@Override
	public List<SubjectVO> getSubjectList() {
		return subjectMapper.selectSubjectList();
	}

	@Override
	public SubjectVO getSubject(SubjectVO subjectVO) {
		return subjectMapper.selectSubject(subjectVO);
	}

	@Override
	public int insertSubjectInfo(SubjectVO subjectVO) {
		return subjectMapper.insertSubject(subjectVO) == 1 ? subjectVO.getSubjectNo() : -1;
	}

	@Override
	public int deleteSubjectInfo(int subjectNo) {
		int result = subjectMapper.deleteSubject(subjectNo);
		
		if(result == 1) {
			return subjectNo;
		} else {
			return -1;
		}
	}

}
