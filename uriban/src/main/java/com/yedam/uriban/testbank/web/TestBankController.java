package com.yedam.uriban.testbank.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.yedam.uriban.testanswer.service.TestAnswerService;
import com.yedam.uriban.testbank.service.PagingVO;
import com.yedam.uriban.testbank.service.TestBankService;
import com.yedam.uriban.testbank.service.TestBankVO;

import lombok.extern.slf4j.Slf4j;

/* 
 * 작성자 : 최성길
 * 작성일자 : 2023-10
 * 문제은행 관리 : 문제전체조회, 문제등록,문제수정, 문제삭제
 * 
 */

@Controller
@Slf4j
public class TestBankController {
	
	@Autowired
	TestBankService testBankService;
	
	@Autowired
	TestAnswerService testAnswerService;
	
	// 문제은행 목록
	@GetMapping("/testBank/testBankList")
	public String testBankList(@RequestParam(required = false, defaultValue = "1") int pageNo,
											Model model,
											String subjectNo,
											HttpSession session) {
		
		Map<String, Object> map = new HashMap<>();
		session.setMaxInactiveInterval(1800);
		// memberId값
		MyClassVO vo = (MyClassVO)session.getAttribute("myClass");
		map.put("memberId", vo.getMemberId());
		
		//paging 처리
		map.put("subjectNo", subjectNo);
		PagingVO page = new PagingVO(pageNo, 9, testBankService.getCount(map));

		map.put("startNo", page.getStartNo());
		map.put("endNo", page.getEndNo());
		List<TestBankVO> pageList = testBankService.getPageList(map);
		model.addAttribute("page", page);
		model.addAttribute("pageList", pageList);

		return "testBank/testBankList";
	}
	
	@GetMapping("/testBank/testBankInfo")
	public String testBankInfo(TestBankVO testBankVO, Model model) {
		TestBankVO findVO = testBankService.getTestBank(testBankVO);
		model.addAttribute("testBankInfo", findVO);
		return "testBank/testBankInfo";
	}
	
	//  문제추가(직접출제)
	@GetMapping("/testBank/testBankInsert")
	public String insertTestBankForm() {
		return "testBank/testBankInsert";
	}
	
	@PostMapping("/testBank/testBankInsert")
	@ResponseBody
	public TestBankVO insertTestBankProcess(TestBankVO testBankVO, @AuthenticationPrincipal MemberVO memberVO) {
		
		testBankVO.setMemberId(memberVO.getMemberId());
		testBankService.insertTestBankInfo(testBankVO);
		//return으로 multipart 필드가 넘어가지 않음으로 인한 초기화
		testBankVO.setTestImage(null);
		testBankVO.setCommentImage(null);
		
		return testBankVO;
		
	}
	
	@GetMapping("/testBank/testBankUpdate")
	public String updateTestBankForm(TestBankVO testBankVO) {
		testBankService.updateTestBankInfo(testBankVO);
		return "testBank/testBankUpdate";
	}
	
	@PostMapping("/testBank/testBankUpdate")
	@ResponseBody
	public Map<String, Object> updateTestBankProcess(@RequestBody TestBankVO testBankVO){
		Map<String, Object> map= new HashMap<>();
		int result = testBankService.updateTestBankInfo(testBankVO);
		map.put("result", result);
		return map;
	}
	
	//단건삭제
	@GetMapping("/testBank/testBankDelete")
	public String deleteTestBankForm(@RequestParam Integer testNo) {

		testBankService.deleteTestBankInfo(testNo);
		return "redirect:testBankList";
	}
	
	//선택삭제
	@PostMapping("/testBank/testBankDelete")
	@ResponseBody
	public int deleteTestBank(@RequestBody List<TestBankVO> testList) {
		int result = 0;
		
		testBankService.deleteTestBankInfo(testList);
		
		return result;
	}
	
}