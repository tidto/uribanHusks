package com.yedam.uriban.survey.answers.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.yedam.uriban.survey.answers.service.RespAnswersService;
import com.yedam.uriban.survey.people.service.PeopleService;

@Controller
public class RespAnsController {
	@Autowired
	RespAnswersService respAnswersService;
	
	@Autowired
	PeopleService peopleService;
}
