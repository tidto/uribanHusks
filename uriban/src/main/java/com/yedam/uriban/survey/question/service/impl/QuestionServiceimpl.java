package com.yedam.uriban.survey.question.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.uriban.survey.answers.mapper.SurvAnsMapper;
import com.yedam.uriban.survey.people.mapper.PeopleMapper;
import com.yedam.uriban.survey.question.mapper.QuestionMapper;
import com.yedam.uriban.survey.question.service.QuestionService;
import com.yedam.uriban.survey.question.service.QuestionVO;
@Service
public class QuestionServiceimpl implements QuestionService{
	@Autowired
	QuestionMapper questionMapper;
	
	@Autowired
	SurvAnsMapper survAnsMapper;
	
	@Autowired
	PeopleMapper peopleMapper;
	
	@Override
	public List<QuestionVO> getQuestionAll() {
		return questionMapper.selectQuestionList();
	}

	@Override
	public List<QuestionVO> getQuestion(QuestionVO questionVO) {
		List<QuestionVO> question = questionMapper.selectQuestionInfo(questionVO);
		
		for(QuestionVO VO : question) {
			int questionNo = VO.getQuestionNo();
			List<Map<String, Object>> list = survAnsMapper.selectChartAnswers(questionNo);
			
			VO.setAnswerMap(list);
		}
		return question;
	}
	
	@Override
	public void insertQuestion(List<QuestionVO> list) {
	}

	@Override
	public int updateQuestion(QuestionVO questionVO) {
		int result = questionMapper.updateQuestion(questionVO);
		
		if(result == 1) {
			return Integer.valueOf(questionVO.getQuestionNo());
		}else {
			return -1;
		}
	}

	@Override
	public int deleteQuestion(int questionNo) {
		int result = questionMapper.deleteQuestion(questionNo);
				
		if (result == 1) {
			return questionNo;
		} else {
			return -1;
		}
	}

	@Override
	public int deleteSelectSurvey(QuestionVO questionVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Map<String, Object> getChartQuestion(QuestionVO questionVO) {
		Map<String, Object> map = new HashMap<>(); 
		List<QuestionVO> question = questionMapper.selectQuestionInfo(questionVO);
		
		for(QuestionVO VO : question) {
			int questionNo = VO.getQuestionNo();
			List<Map<String, Object>> list = survAnsMapper.selectChartAnswers(questionNo);
			
			VO.setAnswerMap(list);
		}
		map.put("question", question);
		map.put("survey", peopleMapper.selectBarChart(questionVO.getSurvNo()));
		return map;
	}
}
