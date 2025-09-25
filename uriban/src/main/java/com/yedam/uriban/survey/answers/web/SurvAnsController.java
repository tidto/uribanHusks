package com.yedam.uriban.survey.answers.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.uriban.survey.answers.service.SurvAnswersService;
import com.yedam.uriban.survey.answers.service.SurvAnswersVO;

@Controller
public class SurvAnsController {
	@Autowired
	SurvAnswersService survAnswersService;
	
	@PostMapping("survey/answerDelete")
	@ResponseBody
	public int answerDelete(@RequestBody SurvAnswersVO survAnswersVO) {
		int answerNo = survAnswersVO.getAnswerNo();
		
		System.out.println(answerNo);
		return survAnswersService.deleteAnswers(answerNo) == 1 ? 1 : -1;
	}
}
