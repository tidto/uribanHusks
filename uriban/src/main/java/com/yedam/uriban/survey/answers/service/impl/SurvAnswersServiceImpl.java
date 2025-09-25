package com.yedam.uriban.survey.answers.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.uriban.survey.answers.mapper.SurvAnsMapper;
import com.yedam.uriban.survey.answers.service.SurvAnswersService;
import com.yedam.uriban.survey.answers.service.SurvAnswersVO;
@Service
public class SurvAnswersServiceImpl implements SurvAnswersService{
	@Autowired
	SurvAnsMapper survAnsMapper;
	
	@Override
	public List<SurvAnswersVO> getSurvAnswersAll() {
		return survAnsMapper.selectSurvAnswersList();
	}

	
	@Override
	public void insertSurvAnswers(List<SurvAnswersVO> list) {
	}

	@Override
	public int updateSurvAnswers(SurvAnswersVO survAnswersVO) {
		return 0;
	}

	@Override
	public int deleteSurvAnswers(int survManNo) {
		return 0;
	}

	@Override
	public int deleteSelAnswers(SurvAnswersVO survAnswersVO) {
		return 0;
	}

	@Override
	public int deleteAnswers(int answerNo) {
		int result = survAnsMapper.deleteAnswers(answerNo);
		
		if (result == 1) {
			return result;
		} else {
			return -1;
		}
		
	}

	@Override
	public List<SurvAnswersVO> getSurvAnswers(int questionNo) {
		// TODO Auto-generated method stub
		return null;
	}



	
}
