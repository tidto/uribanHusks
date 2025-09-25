package com.yedam.uriban.parents.web;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.uriban.myclass.service.MyClassService;
import com.yedam.uriban.myclass.service.MyClassVO;
import com.yedam.uriban.parents.service.ParentsService;
import com.yedam.uriban.parents.service.ParentsVO;
import com.yedam.uriban.student.service.StudentService;

/* 
 * 작성자 : 고보성
 * 작성일자 : 2023-10
 * 과제 관리 : 학부모 정보 등록, 조회 수정, 삭제						
 * 			자녀반에 정보 등록
 */

@Controller
public class ParentsController {

	@Autowired
	ParentsService parentsService;

	@Autowired
	StudentService studentService;
	
	@Autowired
	MyClassService myClassService; 

	// 전체조회
	@GetMapping("parents/parentsList")
	public String getParentsList(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(1800);
		
		ParentsVO parVO = new ParentsVO();
		parVO.setClassId((int)session.getAttribute("ourClassId"));
		
		List<ParentsVO> list = parentsService.getParentsList(parVO);
		model.addAttribute("parentsList", list);
		return "parents/parentsList";
	}

	// 단건조회
	@GetMapping("parents/parentsInfo")
	public String getParentsInfo(ParentsVO parentsVO, Model model) {
		model.addAttribute("parentsInfo", parentsService.getParentsInfo(parentsVO));
		return "parents/parentsInfo";
	}

	// 등록 GET
	@GetMapping("parents/parentsInsert")
	public String getParentsInsertForm() {
		return "parents/parentsInsert";
	}

	// 등록 POST
	@PostMapping("parents/parentsInsert")
	public String getParentsInfoProcess(ParentsVO parentsVO, RedirectAttributes attr) {

		int check = parentsService.insertParents(parentsVO);

		String result = null;
		if (check == -1) {
			result = "정상적으로 입력되지 않았습니다.";
		} else {
			result = "정상적으로 입력되었습니다.";
		}
		attr.addFlashAttribute("result", result);
		return "redirect:parentsList";
	}

	// 수정
	@GetMapping("parents/parentsUpdate")
	public String parentsUpdateForm(ParentsVO parentsVO, Model model) {
		ParentsVO findVO = parentsService.getParentsInfo(parentsVO);
		model.addAttribute("parentsInfo", findVO);
		return "parents/parentsUpdate";
	}

	// 수정Process
	@PostMapping("parents/parentsUpdate")
	@ResponseBody
	public Map<String, String> parentsUpdateProcess(@RequestBody ParentsVO parentsVO) {
		return parentsService.updateParents(parentsVO);
	}


	// 삭제 POST
	@PostMapping("parents/parentsDelete")
	@ResponseBody
	public int parentsDelete(ParentsVO memberId, MyClassVO myClassVO, Model model) {
		model.addAttribute("classId", myClassService.getMyClassInfo(myClassVO));
		return parentsService.deleteParents(memberId);
	}

	// 학부모 가입
	@GetMapping("parents/parentsJoin")
	public String getParentsJoinForm(MyClassVO myClassVO, Model model) {
		model.addAttribute("classId", myClassService.getMyClassInfo(myClassVO));
		return "parents/parentsJoin";
	}

	// 학부모 가입
	@PostMapping("parents/parentsJoin")
	public String getParentsJoinProcess(ParentsVO parentsVO, RedirectAttributes attr) {
	    int check = parentsService.joinParents(parentsVO);

	    String result;
	    if (check == 0) {
	        result = "가입이 실패했습니다. 정보를 확인해주세요.";
	        attr.addFlashAttribute("result1", result);
	        return "redirect:/myClass/myClassList"; // 정상적으로 입력되지 않았을 때의 경로
	    } else {
	        result = "가입이 완료되었습니다.";
	        attr.addFlashAttribute("result1", result);
	        return "redirect:/myhome"; // 정상적으로 입력되었을 때의 경로
	    }
	}

}
