package com.yedam.uriban.myclass.web;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.uriban.album.image.service.ImageService;
import com.yedam.uriban.album.image.service.ImageVO;
import com.yedam.uriban.homework.service.HomeworkService;
import com.yedam.uriban.homework.service.HomeworkVO;
import com.yedam.uriban.homework.service.PageVO;
import com.yedam.uriban.member.service.MemberService;
import com.yedam.uriban.member.service.MemberVO;
import com.yedam.uriban.myclass.service.MyClassService;
import com.yedam.uriban.myclass.service.MyClassVO;
import com.yedam.uriban.notice.service.NoticeService;
import com.yedam.uriban.notice.service.NoticeVO;
import com.yedam.uriban.student.service.StudentService;
import com.yedam.uriban.student.service.StudentVO;
import com.yedam.uriban.survey.survey.service.SurveyService;
import com.yedam.uriban.survey.survey.service.SurveyVO;

import reactor.core.publisher.Mono;

/*
 * 구현: 장근렬, 김태산, 고보성
 * 구현일자: 2023-10-
 * 
 * */


@Controller
public class MyClassController {

	@Autowired
	MyClassService myClassService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	ImageService imageService;

	@Autowired
	StudentService studentService;
	
	@Autowired

	NoticeService noticeService;
	
	@Autowired
	HomeworkService homeworkService;
	
	@Autowired
	SurveyService surveyService;

	
	// 전체조회
	@GetMapping("myClass/myClassList")
	public String GetMyClassList(Model model) {
		model.addAttribute("myClassList", myClassService.getMyClassList());
		return "myclass/myClassList";
	}
	
	// 단건조회
	@GetMapping("myClass/myClassInfo")
	public String getMyClassInfo(MyClassVO myClassVO, Model model) {
		model.addAttribute("myClassInfo", myClassService.getMyClassInfo(myClassVO));
		return "myclass/myClassInfo";
	}

	// 등록GET
	@GetMapping("myClass/myClassInsert")
	public String getMyClassInsertForm(Model model) {
		return "myclass/myClassInsert";
	}

	// 등록 POST
	@PostMapping("myClass/myClassInsert")
	public String getMyClassInsertProcess(MyClassVO myClassVO, RedirectAttributes attr) {
		int check = myClassService.insertMyClass(myClassVO);

		String result = null;
		if (check == -1) {
			result = "정상적으로 입력되지 않았습니다.";
		} else {
			result = "정상적으로 입력되었습니다.";
		}
		attr.addFlashAttribute("result", result);
		return "redirect:/myhome";
	}

	// 수정GET
	@GetMapping("myClass/myClassUpdate")
	public String myClassUpdateForm(MyClassVO myClassVO, Model model) {
		MyClassVO findVO = myClassService.getMyClassInfo(myClassVO);
		model.addAttribute("myClassUpdate", findVO);
		return "myclass/myClassUpdate";
	}

	// 수정 POST
	@PostMapping("myClass/myClassUpdate")
	@ResponseBody
	public Map<String, String> myClassUpdateProcess(@RequestBody MyClassVO myClassVO) {
		return myClassService.updateMyClass(myClassVO);
	}

	// 삭제
	
	// 우리반으로 이동
	@GetMapping("myClass/myClassHome")

	public String myClassHome(MyClassVO myClassVO, 
							  HttpServletRequest request, 
							  Model model,
							  @RequestParam(required = false, defaultValue = "1") int pageNo,
							  @AuthenticationPrincipal MemberVO member) {
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(1800);
		
		myClassVO = myClassService.getMyClassInfo(myClassVO);
		session.setAttribute("myClass", myClassVO);
		session.setAttribute("ourClassId", myClassVO.getClassId());
		session.setMaxInactiveInterval(1800);


		//Album
		List<ImageVO> images = imageService.getImageListWithClass(myClassVO.getClassId());
		model.addAttribute("images",images);
		
		//Notice
		NoticeVO noticeVO = new NoticeVO();
		noticeVO.setClassId(myClassVO.getClassId());
		noticeVO.setNoticeType("F401");
		List<NoticeVO> noticeList = noticeService.getNoticeListMain(noticeVO);
		model.addAttribute("noticeList",noticeList);
		noticeVO.setNoticeType("F402");
		noticeList = noticeService.getNoticeListMain(noticeVO);
		model.addAttribute("noticeList2",noticeList);
		
		//Homework
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("classId", myClassVO.getClassId());
		map.put("student", "student");
		map.put("memberId", member.getMemberId());
		PageVO page = new PageVO(pageNo, 5, homeworkService.getCount(map));
		map.put("startNo", page.getStartNo());
		map.put("endNo", page.getEndNo());
		List<HomeworkVO> pageList = homeworkService.getPageList(map);
		model.addAttribute("page", page);
		model.addAttribute("pageList", pageList);
		
		//Survey
		SurveyVO survVO = new SurveyVO();
		survVO.setClassId(myClassVO.getClassId());
		List<SurveyVO> list = surveyService.getSurveyAllTop(survVO);
		model.addAttribute("surveyList", list);
		
		return "myclass/myClassHome";
	}
	
	// 밥테스트
	@GetMapping("/Test")
	public String testWebClient(Model model) {
//	    Mono<String> response = webClientService.fetchMealData();
//	    model.addAttribute("response", response.block());

	    return "bab/test";
	}
	
	
	
}
