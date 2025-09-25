package com.yedam.uriban.survey.survey.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.uriban.member.service.MemberVO;
import com.yedam.uriban.myclass.service.MyClassVO;
import com.yedam.uriban.survey.answers.service.RespAnswersService;
import com.yedam.uriban.survey.answers.service.RespAnswersVO;
import com.yedam.uriban.survey.people.mapper.PeopleMapper;
import com.yedam.uriban.survey.people.service.PeopleService;
import com.yedam.uriban.survey.people.service.PeopleVO;
import com.yedam.uriban.survey.question.service.QuestionService;
import com.yedam.uriban.survey.survey.service.SurveyService;
import com.yedam.uriban.survey.survey.service.SurveyVO;

import io.netty.handler.codec.http.HttpContentEncoder.Result;
@Controller
public class SurveyController {
	@Autowired
	SurveyService surveyService;
	
	@Autowired
	QuestionService questionService;
	
	@Autowired
	PeopleService peopleService;
	
	@Autowired
	PeopleMapper peopleMapper;
	
	@Autowired
	RespAnswersService respAnswersService;
	
	@GetMapping("survey/surveyList")
	public String surveyList(Model model, HttpServletRequest request,
							@AuthenticationPrincipal MemberVO memberVO) {
		MyClassVO vo = new MyClassVO();
		HttpSession session = request.getSession();
		if (request != null) {
			vo = (MyClassVO)session.getAttribute("myClass");
			if (vo != null) {
				model.addAttribute("classId", vo.getClassId());
			}
		}
		int classId = vo.getClassId();
		if("ROLE_A102".equals(memberVO.getAuthority())) {
			// 교사
			List<SurveyVO> tcList = surveyService.getSubmitList(classId);
			model.addAttribute("surveyList", tcList);
		} else {
			// 학생, 학부모
			String memberId = memberVO.getMemberId();
			SurveyVO surveyVO = new SurveyVO();
			surveyVO.setClassId(vo.getClassId());
			surveyVO.setMemberId(memberId);
			List<SurveyVO> List = surveyService.getPeopleList(surveyVO);
			model.addAttribute("peopleList", List);
		}
		session.setMaxInactiveInterval(1800);
		return "survey/surveyList";
	}
	
	@GetMapping("survey/surveyInsert")
	public String surveyInsertForm() {
		return "survey/surveyInsert";
	}
	
	@PostMapping("survey/surveyInsert")
	@ResponseBody
	public int surveyInsertProcess(@RequestBody SurveyVO surveyVO,
									HttpServletRequest request) {
		HttpSession session = request.getSession();
		MyClassVO vo = (MyClassVO)session.getAttribute("myClass");

		surveyVO.setClassId(vo.getClassId());
		int result = surveyService.insertSurveyInfo(surveyVO);
		
		session.setMaxInactiveInterval(1800);
		return result;
	}
	
	@GetMapping("survey/surveyUpdate")
	public String surveyUpdateInfo(SurveyVO surveyVO, Model model,
									HttpServletRequest request) {
		HttpSession session = request.getSession();
		MyClassVO vo = (MyClassVO)session.getAttribute("myClass");
		
		surveyVO.setClassId(vo.getClassId());
		SurveyVO findVO = surveyService.getSurvey(surveyVO);
		model.addAttribute("surveyInfo", findVO);
		
		session.setMaxInactiveInterval(1800);
		return "survey/surveyUpdate";
	}
	
	@PostMapping("survey/surveyUpdate")
	@ResponseBody
	public Map<String, Object> surveyUpdateProcess(@RequestBody SurveyVO surveyVO,
													HttpServletRequest request) {
		HttpSession session = request.getSession();
		MyClassVO vo = (MyClassVO)session.getAttribute("myClass");
		
		surveyVO.setClassId(vo.getClassId());
		
		Map<String, Object> map = new HashMap<>();
		
		int result = surveyService.updateSurveyInfo(surveyVO);
		map.put("result", result);
		
		session.setMaxInactiveInterval(1800);
		return map;
	}
	
	// 전체 삭제
	@PostMapping("survey/surveyDeleteAll")
	@ResponseBody
	public int surveyDelete(@RequestParam Integer survNo) {
		return surveyService.deleteSurveyInfo(survNo); 
	}
	
	// 체크한 문제 삭제
	@PostMapping("survey/surveyDelete")
	@ResponseBody
	public void questionSelDelete(@RequestBody SurveyVO surveyVO) {
		surveyService.deleteSelectSurvey(surveyVO);
	}
	
	// 설문지 응답 List
	@GetMapping("survey/surveyAnswerInsert")
	public String surveyAnswerInsertInfo(SurveyVO surveyVO, Model model) {
		SurveyVO findVO = surveyService.getSurvey(surveyVO);
		model.addAttribute("surveyInfo", findVO);
		return "survey/surveyAnswerInsert";
	}
	
	// 설문지 응답 내용 List
	@GetMapping("survey/surveyAnswerList")
	public String surveyAnswerList(PeopleVO peopleVO, RespAnswersVO responseVO, Model model) {
		// survNo를 찾기 위함
		PeopleVO findVO = peopleService.getPeople(peopleVO);
		int survNo = findVO.getSurvNo();
		
		// 설문지 보여줌
		SurveyVO surveyVO = new SurveyVO();
		surveyVO.setSurvNo(survNo);
		SurveyVO survVO = surveyService.getSurvey(surveyVO);
		
		// 설문조사의 대한 no 받기
		List<RespAnswersVO> resVO = respAnswersService.getRespAnswers(responseVO);
		
		model.addAttribute("surveyInfo", survVO);
		model.addAttribute("responseInfo", resVO);
		return "survey/surveyAnswerList";
	}
	
	// 수정 시 응답 유무
	@PostMapping("survey/surveyUpdateAll")
	@ResponseBody
	public int surveyUpdateAll(@RequestParam Integer survNo) {
		return surveyService.selectPeopleCnt(survNo); 
	}
	
	// 차트 보기 전 응답 유무
	@PostMapping("survey/surveyChartAll")
	@ResponseBody
	public int surveyChartAll(@RequestParam Integer survNo) {
		return surveyService.selectPeopleCnt(survNo); 
	}
}

