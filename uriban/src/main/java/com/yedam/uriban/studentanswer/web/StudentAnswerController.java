package com.yedam.uriban.studentanswer.web;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.uriban.member.service.MemberVO;
import com.yedam.uriban.studentanswer.service.StudentAnswerService;
import com.yedam.uriban.studentanswer.service.StudentAnswerVO;
import com.yedam.uriban.submittest.service.SubmitTestVO;
import com.yedam.uriban.testbank.service.TestBankService;
import com.yedam.uriban.testbank.service.TestBankVO;

/*
 * 구현: 장근렬
 * 구현일자: 2023-10-
 * 과제 제출 및 제추한 과제 확인 기능
 * */

@Controller
public class StudentAnswerController {
	
	@Autowired
	StudentAnswerService studentAnswerService;
	
	@Autowired
	TestBankService testBankService;	

	@GetMapping("studentAnswer/studentAnswerList")
	public String studentAnswerList(Model model, 
									int homeworkNo,
									String isDone, 
									String td,
									@AuthenticationPrincipal MemberVO member) {

		TestBankVO testBankVO = new TestBankVO();
		testBankVO.setHomeworkNo(homeworkNo);
		List<TestBankVO> bankList = testBankService.getTestBankList(testBankVO);

		SubmitTestVO submitVO = new SubmitTestVO();
		submitVO.setHomeworkNo(homeworkNo);
		submitVO.setMemberId(member.getMemberId());
		List<StudentAnswerVO> answerList = studentAnswerService.selectStudentAnswers(submitVO);
		
		model.addAttribute("testBankList", bankList);
		model.addAttribute("answerList", answerList);
		model.addAttribute("homeworkNo", homeworkNo);
		model.addAttribute("isDone", isDone);
		model.addAttribute("td", td);
		
		return "studentAnswer/studentAnswerList";
	}
	
	@PostMapping("studentAnswer/updateWrongMemo")
	@ResponseBody
	public void updateWrongMemo(@RequestBody List<StudentAnswerVO> list) {	
		studentAnswerService.updateWrongMemo(list);
	}
}
