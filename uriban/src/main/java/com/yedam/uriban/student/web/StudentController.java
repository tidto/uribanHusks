package com.yedam.uriban.student.web;

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

import com.yedam.uriban.code.service.CodeService;
import com.yedam.uriban.myclass.service.MyClassVO;
import com.yedam.uriban.student.service.StudentService;
import com.yedam.uriban.student.service.StudentVO;

/* 
 * 작성자 : 고보성
 * 작성일자 : 2023-10
 * 과제 관리 : 학생 정보 등록, 조회, 수정, 삭제						
 * 			학생이 자신의 반에 가입
 */

@Controller
public class StudentController {

	@Autowired
	StudentService studentService;

	@Autowired
	CodeService codeService;
	
	// 전체 조회
	@GetMapping("student/studentList")
	public String getStudentList(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(1800);
		
		StudentVO stuVO = new StudentVO();
		stuVO.setClassId((int)session.getAttribute("ourClassId"));
		
		List<StudentVO> list = studentService.getStudentList(stuVO);
		model.addAttribute("studentList", list);
		return "student/studentList";
	}

	// 단건 조회
	@GetMapping("student/studentInfo")
	public String getStudentInfo(StudentVO studentVO, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(1800);
		
		StudentVO stuVO = new StudentVO();
		stuVO.setClassId((int)session.getAttribute("ourClassId"));
		
		List<StudentVO> list = studentService.getStudentList(stuVO);
		
		model.addAttribute("studentList", list);
		model.addAttribute("studentInfo", studentService.getStudentInfo(studentVO));
		return "student/studentInfo";
	}

	// 학생 등록 페이지 GET
	@GetMapping("student/studentInsert")
	public String studentInsertForm() {
		return "student/studentInsert";
	}

	// 학생 등록 처리 POST
	@PostMapping("student/studentInsert")
	public String studentInsertProcess(StudentVO studentVO, RedirectAttributes attr) {

		int check = studentService.InsertStudent(studentVO);
		System.out.println(studentVO.getMemberId());

		String result = null;
		if (check == -1) {
			result = "등록에 실패했습니다.";
			attr.addFlashAttribute("result", result);
			return "redirect:studentList";
		} else {
			result = "등록되었습니다.";
			attr.addFlashAttribute("result", result);
			return "redirect:studentList";
		}
	}

	// 학생 정보 수정 GET
	@GetMapping("student/studentUpdate")
	public String studentUpdateForm(StudentVO studentVO, Model model) {
		StudentVO findVO = studentService.getStudentInfo(studentVO);
		model.addAttribute("studentInfo", findVO);
		model.addAttribute("G2", codeService.getCodeList("G2"));
		System.out.println(findVO);
		return "student/studentUpdate";
	}

	// 학생 정보 수정 - Process
	@ResponseBody
	@PostMapping("student/studentUpdate")
	public Map<String, String> studentUpdateProcess(@RequestBody StudentVO studentVO) {
		return studentService.UpdateStudent(studentVO);
	}



	// 목록 삭제 POST
	@PostMapping("student/studentDelete")
	@ResponseBody
	public int studentDelete(StudentVO studentVO) {
		return studentService.DeleteStudent(studentVO);
	}

	// 학생 가입
	@GetMapping("student/studentJoin")
	public String studentJoinForm(StudentVO studentVO, Model model) {
		StudentVO findVO = studentService.getStudentInfo(studentVO);
		model.addAttribute("students", findVO);
		model.addAttribute("G2", codeService.getCodeList("G2"));
		System.out.println(findVO);
		return "student/studentJoin";
	}

	// 학생 가입 - Process
	@ResponseBody
	@PostMapping("student/studentJoin")
	public Integer studentJoinProcess(@RequestBody StudentVO studentVO) {
		studentService.studentJoin(studentVO);
		return studentVO.getResult();
	}

}