package com.yedam.uriban.survey.question.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yedam.uriban.member.service.MemberVO;
import com.yedam.uriban.survey.answers.service.RespAnswersService;
import com.yedam.uriban.survey.answers.service.SurvAnswersService;
import com.yedam.uriban.survey.people.service.PeopleService;
import com.yedam.uriban.survey.people.service.PeopleVO;
import com.yedam.uriban.survey.question.service.QuestionService;
import com.yedam.uriban.survey.question.service.QuestionVO;
@Controller
public class QuestionController {
	@Autowired
	QuestionService questionService;
	
	@Autowired
	PeopleService peopleService;
	
	@Autowired
	SurvAnswersService survAnswersService;
	
	@Autowired
	RespAnswersService respAnswersService;
	
	// 설문지 응답 내용 List
	@GetMapping("survey/surveyChart")
	public String surveyChartList(QuestionVO questionVO,
									PeopleVO peopleVO,
				                    Model model) throws JsonProcessingException {
		// object를 JSON으로 바꿔줌
		ObjectMapper objectMapper = new ObjectMapper();
		
		Map<String, Object> map = questionService.getChartQuestion(questionVO);
		
		// 자바 object를 jsonstring으로 변환
		String text = objectMapper.writeValueAsString(map.get("question"));
		// JSON 형식으로 보냄
		model.addAttribute("chartJson", text);
		
		// VO 형식으로 보냄
		model.addAttribute("chartList", map.get("question"));
		model.addAttribute("barChart", map.get("survey"));
		return "survey/surveyChart";
	}
}
