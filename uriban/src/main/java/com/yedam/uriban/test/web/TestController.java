package com.yedam.uriban.test.web;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
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

import com.yedam.uriban.homework.service.HomeworkService;
import com.yedam.uriban.homework.service.HomeworkVO;
import com.yedam.uriban.homework.service.PageVO;
import com.yedam.uriban.member.service.MemberVO;
import com.yedam.uriban.myclass.service.MyClassVO;
import com.yedam.uriban.studentanswer.service.StudentAnswerService;
import com.yedam.uriban.studentanswer.service.StudentAnswerVO;
import com.yedam.uriban.test.service.TestService;
import com.yedam.uriban.test.service.TestVO;
import com.yedam.uriban.testbank.service.PagingVO;
import com.yedam.uriban.testbank.service.TestBankService;
import com.yedam.uriban.testbank.service.TestBankVO;

/*
 * 구현: 장근렬
 * 구현일자: 2023-10-
 * 
 * */

@Controller
public class TestController {

	@Autowired
	TestService testService;

	@Autowired
	HomeworkService homeworkService;

	@Autowired
	TestBankService testBankService;

	@Autowired
	StudentAnswerService studentAnswerService;

	@GetMapping("/test/testList")
	public String testList(@RequestParam(required = false, defaultValue = "1") int pageNo, String subjectNo,
			@RequestParam Map<String, Object> map, Model model, HttpServletRequest request,
			@AuthenticationPrincipal MemberVO member) {

		map.put("subjectNo", subjectNo);

		HttpSession session = request.getSession();
		MyClassVO vo = (MyClassVO) session.getAttribute("myClass");
		session.setMaxInactiveInterval(1800);
		
		map.put("classId", vo.getClassId());
		map.put("student", "student");
		map.put("memberId", member.getMemberId());

		PageVO page = new PageVO(pageNo, 10, homeworkService.getCount(map));

		map.put("startNo", page.getStartNo());
		map.put("endNo", page.getEndNo());

		List<HomeworkVO> pageList = homeworkService.getPageList(map);

		model.addAttribute("page", page);
		model.addAttribute("pageList", pageList);

		return "test/testList";
	}

	@PostMapping("/test/deleteInputTest")
	@ResponseBody
	public int deleteTestBank(@RequestBody List<TestVO> testNo) {
		int result = 0;

		for (TestVO vo : testNo) {
			testService.deleteInputTestInfo(vo.getTestNo());
		}
		return result;
	}

	@GetMapping("/test/addSelectedTest")
	public String addSeletedTest(@RequestParam(required = false, defaultValue = "1") int pageNo,
								 @AuthenticationPrincipal MemberVO member,
								 Model model,
								 String subjectNo) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("subjectNo", subjectNo);
		map.put("memberId", member.getMemberId());
		
		PagingVO page = new PagingVO(pageNo, 8, testBankService.getCount(map));
		
		map.put("startNo", page.getStartNo());
		map.put("endNo", page.getEndNo());
		List<TestBankVO> pageList = testBankService.getPageList(map);
		subjectNo = testBankService.getCodeName(subjectNo);
		model.addAttribute("subjectNo", subjectNo);
		model.addAttribute("page", page);
		model.addAttribute("pageList", pageList);

		return "test/addSelectedTest";
	}

	@GetMapping("/test/wrongnote")
	public String wrongnote(Model model, 
							@AuthenticationPrincipal MemberVO member,
							@RequestParam(required = false, defaultValue = "1") int pageNo, 
							@RequestParam Map<String, Object> map) throws Exception {


		map.put("correctOrWrong", "wrong");
		map.put("memberId", member.getMemberId());
		
		PagingVO page = new PagingVO(pageNo, 6, studentAnswerService.getCount(map));

		map.put("startNo", page.getStartNo());
		map.put("endNo", page.getEndNo());

		List<StudentAnswerVO> pageList = studentAnswerService.getPageList(map);

		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy");
		String formatedNow = now.format(formatter);
		String formateYear = now.format(formatter2);
		String firstDay = formateYear + "-01-01";
		String lastDay = formateYear + "-12-31";
		String formatedNow2 = AddDate(formatedNow,0,-1,0);
		
		model.addAttribute("firstDay",firstDay);
		model.addAttribute("lastDay",lastDay);
		model.addAttribute("formatedNow",formatedNow);
		model.addAttribute("formatedNow2",formatedNow2);
		
		model.addAttribute("page", page);
		model.addAttribute("pageList", pageList);

		return "test/wrongnote";	
		
	}
	
	private static String AddDate(String strDate, int year, int month, int day) throws Exception {
		
        SimpleDateFormat dtFormat = new SimpleDateFormat("yyyy-MM-dd");
        
		Calendar cal = Calendar.getInstance();
        
		Date dt = dtFormat.parse(strDate);
        
		cal.setTime(dt);
        
		cal.add(Calendar.YEAR,  year);
		cal.add(Calendar.MONTH, month);
		cal.add(Calendar.DATE,  day);
        
		return dtFormat.format(cal.getTime());
	}

}
