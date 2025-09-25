package com.yedam.uriban.survey.people.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.uriban.survey.answers.service.RespAnswersService;
import com.yedam.uriban.survey.answers.service.RespAnswersVO;
import com.yedam.uriban.survey.people.service.PeopleService;
import com.yedam.uriban.survey.people.service.PeopleVO;
import com.yedam.uriban.survey.question.service.QuestionService;
import com.yedam.uriban.survey.survey.service.SurveyService;
import com.yedam.uriban.survey.survey.service.SurveyVO;

@Controller
public class PeopleController {
	@Autowired
	PeopleService peopleService;
	
	@Autowired
	SurveyService surveyService;
	
	@Autowired
	QuestionService questionService;
	
	@Autowired
	RespAnswersService respAnswersService;
	
	@GetMapping("survey/surveyCustList")
	public String peopleList(PeopleVO peopleVO, Model model){
		List<PeopleVO> findList = peopleService.getPeopleAll(peopleVO);
		int survNo = peopleVO.getSurvNo();
		
		// 문제 가져오기 위함
		SurveyVO surveyVO = new SurveyVO();
		surveyVO.setSurvNo(survNo);
		
		// 전체 답안을 가져옴
		List<RespAnswersVO> answerList = new ArrayList<RespAnswersVO>();
		for(PeopleVO VO : findList) {
			int survManNo = VO.getSurvManNo();
			
			RespAnswersVO responseVO = new RespAnswersVO();
			responseVO.setSurvManNo(survManNo);
			answerList =respAnswersService.getRespAnswers(responseVO);
			
			VO.setRespAnswer(answerList);
		}
		
		// 응답 리스트
		model.addAttribute("peopleList", findList);
		// 응답 인원 통계 차트
		model.addAttribute("surveyChart", surveyService.getSurvey(surveyVO));
		// 응답 내역
		model.addAttribute("answerChart", answerList);
		return "survey/surveyCustList";
	}
	
	@PostMapping("survey/surveyAnswerInsert")
	@ResponseBody
	public Map<String, Object> surveyAnswerUpdateProcess(@RequestBody PeopleVO peopleVO){
		Map<String, Object> map = new HashMap<>();
		int result = peopleService.updatePeopleInfo(peopleVO);
		map.put("result", result);
		
		return map;
	}
}
