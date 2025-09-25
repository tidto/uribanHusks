package com.yedam.uriban.homework.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yedam.uriban.homework.service.HomeworkService;
import com.yedam.uriban.homework.service.HomeworkVO;
import com.yedam.uriban.homework.service.PageVO;
import com.yedam.uriban.myclass.service.MyClassVO;
import com.yedam.uriban.test.service.TestService;
import com.yedam.uriban.test.service.TestVO;
import com.yedam.uriban.testbank.service.TestBankService;
import com.yedam.uriban.testbank.service.TestBankVO;

/* 
 * 작성자 : 최성길
 * 작성일자 : 2023-10
 * 과제 관리 : 과제전체조회, 과제등록, 과제수정, 과제삭제
 * 			과제등록/삭제 시 문제(Test) 테이블에 함께 등록
 * 
 */

@Controller
public class HomeworkController {

	@Autowired
	HomeworkService homeworkService;

	@Autowired
	TestBankService testBankService;

	@Autowired
	TestService testService;

	// 과제목록조회 
	@GetMapping("/homework/homeworkList")
	public String homeworkList(@RequestParam(required = false, defaultValue = "1") int pageNo,
							   @RequestParam(required=false, value="type") String type,
								Model model,
								@RequestParam Map<String, Object> map,
								HttpSession session) {
		
		MyClassVO vo = (MyClassVO)session.getAttribute("myClass");

		map.put("classId", vo.getClassId());
		PageVO page = new PageVO(pageNo, 5, homeworkService.getCount(map));
		
		System.out.println("페이지 : " + page);
		map.put("startNo", page.getStartNo());
		map.put("endNo", page.getEndNo());
		List<HomeworkVO> pageList = homeworkService.getPageList(map);
		
		model.addAttribute("page", page);
		model.addAttribute("pageList", pageList);

		return "homework/homeworkList";
	}
	
	@GetMapping("/homework/homeworkInfo")
	public String homeworkInfo(HomeworkVO homeworkVO, Model model) {
		HomeworkVO findVO = homeworkService.getHomework(homeworkVO);
		model.addAttribute("homeworkInfo", findVO);
		return "homework/homeworkInfo";
	}

	@GetMapping("/homework/homeworkInsert")
	public String insertHomeworkForm() {
		return "homework/homeworkInsert";
	}

	@PostMapping("/homework/homeworkInsert")
	public String insertHomeworkProcess(HomeworkVO homeworkVO, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(1800);
		MyClassVO vo = (MyClassVO)session.getAttribute("myClass");
		
		homeworkVO.setClassId(vo.getClassId());
		homeworkService.insertHomeworkInfo(homeworkVO);
		
		if (homeworkVO.getTestNo() != null) {
			for (int i : homeworkVO.getTestNo()) {
				TestVO testVO = new TestVO();
				testVO.setHomeworkNo(homeworkVO.getHomeworkNo());
				testVO.setTestNo(i);
				testService.insertTestInfo(testVO);
			}
		}
		return "redirect:homeworkList";
	}

	@GetMapping("/homework/homeworkUpdate")
	public String updateHomeworkForm(HomeworkVO homeworkVO, TestBankVO testBankVO, Model model) {
		HomeworkVO findVO = homeworkService.getHomework(homeworkVO);
		System.out.println(testBankVO);
		model.addAttribute("homeworkInfo", findVO);
		model.addAttribute("testBank", testBankService.getTestBankList(testBankVO));
		return "homework/homeworkUpdate";
	}

	@PostMapping("/homework/homeworkUpdate")
	public String updateHomeworkProcess(HomeworkVO homeworkVO, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		MyClassVO vo = (MyClassVO)session.getAttribute("myClass");
		
		homeworkVO.setClassId(vo.getClassId());
		homeworkService.updateHomeworkInfo(homeworkVO);
		
		
		return "redirect:homeworkList";
	}

	@GetMapping("/homework/homeworkDelete")
	public String deleteHomework(@RequestParam Integer homeworkNo) {
		homeworkService.deleteHomeworkInfo(homeworkNo);
		return "redirect:homeworkList";
	}

}