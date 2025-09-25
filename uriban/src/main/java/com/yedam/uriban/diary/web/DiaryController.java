package com.yedam.uriban.diary.web;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.uriban.album.album.service.AlbumVO;
import com.yedam.uriban.code.service.CodeService;
import com.yedam.uriban.diary.service.DiaryService;
import com.yedam.uriban.diary.service.DiaryVO;
import com.yedam.uriban.myclass.service.MyClassVO;
import com.yedam.uriban.student.service.StudentService;
import com.yedam.uriban.student.service.StudentVO;

/* 
 * 작성자 : 고보성
 * 작성일자 : 2023-10
 * 과제 관리 : 학생일지 학생 리스트 조회,
 * 			학생 개인별 일지 등록, 삭제			
 * 
 */

@Controller
public class DiaryController {
	
	@Autowired
	DiaryService diaryService;
	
	@Autowired
	StudentService studentService; 
	
	@Autowired
	CodeService codeService;
	
	
	@GetMapping("diary/diaryStudentList")
	public String getDiaryStudentList(Model model,
	                                   HttpServletRequest request) {
	    
	    HttpSession session = request.getSession();
	    session.setMaxInactiveInterval(1800);
	    
	    StudentVO stuVO = new StudentVO();
	    stuVO.setClassId((int) session.getAttribute("ourClassId"));
	    
	    List<StudentVO> list = studentService.getStudentList(stuVO);
	    
	    model.addAttribute("studentList", list);
	    
	    return "diary/diaryStudentList";
	}

	
	@GetMapping("diary/diaryInfo")
	public String diaryInfo(DiaryVO diaryVO, StudentVO studentVO, Model model
			 ) {
		
		StudentVO VOfind = studentService.getStudentInfo(studentVO);
		List<DiaryVO> find = diaryService.getDiaryInfo(diaryVO);
		
		model.addAttribute("diaryInfo",find);
		model.addAttribute("studentInfo",VOfind);
		
		return "diary/diaryInfo";
	}
	
	@GetMapping("diary/diaryInsert")
	public String diaryInsertForm() {
		return "dairy/diaryInsert";
	}
	
	@PostMapping("diary/diaryInsert")
	@ResponseBody
	public DiaryVO diaryInsertProcess(@RequestBody DiaryVO diaryVO) {
		diaryService.InsertDiary(diaryVO);
		return diaryVO;
	}
	
	@GetMapping("diary/diaryUpdate")
	public String diaryUpdateForm(DiaryVO diaryVO, Model model) {
		List<DiaryVO> find = diaryService.getDiaryInfo(diaryVO);
		model.addAttribute("diaryStudentList", find);
		return "diary/diaryUpdate";
	}
	
	@PostMapping("diary/diaryUpdate")
	@ResponseBody
	 public Map<String, Object> diaryUpdateProcess(@RequestBody DiaryVO diaryVO){
		Map<String, Object> map = new HashMap<>();
		
		int result = diaryService.UpdateDiary(diaryVO);
		
		if(result > -1) {
			map.put("result", true);
			map.put("diaryNo", result);
		} else {
			map.put("result", false);
		}
		return map;
	}
	
	@PostMapping("diary/diaryDelete")
	@ResponseBody
	public int diaryDelete(Integer diaryNo) {
		return diaryService.DeleteDiary(diaryNo);
	}
	
}
