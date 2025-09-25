package com.yedam.uriban.homework.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.yedam.uriban.homework.service.HomeworkService;
import com.yedam.uriban.homework.service.HomeworkVO;

@Controller
public class StudentHomeworkController {
	@Autowired
	HomeworkService homeworkService;
	
	@GetMapping("/studentAnswer/studentHomeworkList")
	public String studentHomeworkList(HomeworkVO homeworkVO, Model model) {
		//session 정보 변경
		homeworkVO.setTestSubject("C202");
		homeworkVO.setClassId(1);
		List<HomeworkVO> list = homeworkService.getStudentHomeworkList(homeworkVO);
		model.addAttribute("studentHomeworkList", list);
		return "studentAnswer/studentHomeworkList";
	}
}
