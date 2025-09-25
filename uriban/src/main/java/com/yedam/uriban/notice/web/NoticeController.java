package com.yedam.uriban.notice.web;
/*
 * 구현: 서민호
 * 구현일자: 2023-10-
 * 
 * */
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.uriban.member.service.MemberService;
import com.yedam.uriban.member.service.MemberVO;
import com.yedam.uriban.myclass.service.MyClassVO;
import com.yedam.uriban.notice.service.NoticeFileService;
import com.yedam.uriban.notice.service.NoticeFileUploadSerivce;
import com.yedam.uriban.notice.service.NoticeFileVO;
import com.yedam.uriban.notice.service.NoticeService;
import com.yedam.uriban.notice.service.NoticeTemplateService;
import com.yedam.uriban.notice.service.NoticeTemplateVO;
import com.yedam.uriban.notice.service.NoticeVO;

import lombok.extern.slf4j.Slf4j;

@Controller
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;
	
	@Autowired
	NoticeFileService noticeFileService;
	
	@Autowired
	NoticeFileUploadSerivce noticeFileUploadService;
	
	@Autowired
	NoticeTemplateService noticeTemplateService;
	
	@Autowired
	MemberService memberService;
	
	// F401 전체 조회
	@GetMapping("/notice/noticeF401List")
	public String noticeF401List(NoticeVO noticeVO, Model model, HttpServletRequest request) {
		// 클래스아이디 session으로 호출
		HttpSession session = request.getSession();
		MyClassVO vo = (MyClassVO)session.getAttribute("myClass");
		int classId = (Integer)session.getAttribute("ourClassId");
		session.setMaxInactiveInterval(1800);
		
		noticeVO.setClassId(classId);
		
		List<NoticeVO> list = noticeService.getNoticeF401List(noticeVO);
		model.addAttribute("noticeList", list);
		
		return "notice/noticeF401List";
	}
	
	// F402 전체 조회
	@GetMapping("/notice/noticeF402List")
	public String noticeF402List(NoticeVO noticeVO, Model model, HttpServletRequest request) {
		// 클래스아이디 session으로 호출
		HttpSession session = request.getSession();
		MyClassVO vo = (MyClassVO)session.getAttribute("myClass");
		int classId = (Integer)session.getAttribute("ourClassId");
		session.setMaxInactiveInterval(1800);
		
		noticeVO.setClassId(classId);
		
		List<NoticeVO> list = noticeService.getNoticeF402List(noticeVO);
		model.addAttribute("noticeList", list);
		
		return "notice/noticeF402List";
	}
	
	// 따로 단건조회X UPDATE model 전송 값
	@GetMapping("/notice/noticeInfo")
	public String noticeInfo(NoticeVO noticeVO, Model model) {
		NoticeVO findVO = noticeService.getNoticeInfo(noticeVO);
		model.addAttribute("noticeInfo", findVO);
		return "notice/noticeList";
	}
	
	// F401 등록 페이지
	@GetMapping("/notice/noticeF401Insert")
	public String noticeF401InsertPage() {
		return "notice/noticeF401Insert";
	}
	
	// F402 등록 페이지
	@GetMapping("/notice/noticeF402Insert")
	public String noticeF402InsertPage() {
		return "notice/noticeF402Insert";
	}
	
	
	// F401 등록 처리 + 파일 업로드 + 템플릿(공용)
	@PostMapping("/notice/noticeF401Insert")
	public String noticeF401InsertProcess(NoticeVO noticeVO, 
			                              NoticeTemplateVO tempVO, 
			                              HttpServletRequest request) {
		
		// 클래스아이디 session으로 호출
		HttpSession session = request.getSession();
		MyClassVO vo = (MyClassVO)session.getAttribute("myClass");
		int classId = (Integer)session.getAttribute("ourClassId");
		session.setMaxInactiveInterval(1800);
		
		noticeVO.setClassId(classId);
		
		// 공지등록
		noticeService.insertNoticeInfo(noticeVO);
		
		// 첨부파일 등록
		List<Map<String, Object>> fileInfos = noticeFileUploadService.uploadFile(noticeVO.getFiles());
		List<NoticeFileVO> fileList = new ArrayList<NoticeFileVO>();
		
		if(!fileInfos.isEmpty()) {
			
			for(Map<String, Object> fileInfo : fileInfos) {
				
				NoticeFileVO fileVO = new NoticeFileVO();
				
				fileVO.setNoticeNo(noticeVO.getNoticeNo());
				fileVO.setOriginalfileName(fileInfo.get("origin").toString());
				fileVO.setSavefileName(fileInfo.get("save").toString());
				fileList.add(fileVO);
			}
			noticeFileService.insertFileInfo(fileList);
		}
		
		// 템플릿 저장
		if(noticeVO.getTemplateAdd() != null) {
		
			noticeTemplateService.insertNoticeTemplate(tempVO);
		}

		session.setAttribute("noticeInsertComplete",noticeVO.getNoticeNo());
		
		return "redirect:noticeF401List";
	}
	
	// F402 등록 처리 + 파일 업로드 + 템플릿(공용)
	@PostMapping("/notice/noticeF402Insert")
	public String noticeF402InsertProcess(NoticeVO noticeVO, NoticeTemplateVO tempVO, HttpServletRequest request) {
		
		// 클래스아이디 session으로 호출
		HttpSession session = request.getSession();
		MyClassVO vo = (MyClassVO)session.getAttribute("myClass");
		int classId = (Integer)session.getAttribute("ourClassId");
		session.setMaxInactiveInterval(1800);
		
		noticeVO.setClassId(classId);
		
		// 공지등록
		noticeService.insertNoticeInfo(noticeVO);
		
		// 첨부파일 등록
		List<Map<String, Object>> fileInfos = noticeFileUploadService.uploadFile(noticeVO.getFiles());
		List<NoticeFileVO> fileList = new ArrayList<NoticeFileVO>();
		
		if(!fileInfos.isEmpty()) {
			
			for(Map<String, Object> fileInfo : fileInfos) {
				
				NoticeFileVO fileVO = new NoticeFileVO();
				
				fileVO.setNoticeNo(noticeVO.getNoticeNo());
				fileVO.setOriginalfileName(fileInfo.get("origin").toString());
				fileVO.setSavefileName(fileInfo.get("save").toString());
				fileList.add(fileVO);
			}
			noticeFileService.insertFileInfo(fileList);
			
		}
		
		// 템플릿 저장
		if(noticeVO.getTemplateAdd() != null) {
			noticeTemplateService.insertNoticeTemplate(tempVO);
		}
		
		return "redirect:noticeF402List";
	}
	
	// 템플릿 컨트롤러에서 F401 템플릿 불러들인 후 noticeInsert 기능 적용
	@PostMapping("/notice/templateToF401Notice")
	public String templateInsertProcess(NoticeVO noticeVO
														,NoticeTemplateVO tempVO
//														,@AuthenticationPrincipal MemberVO member
														,Model model
														,HttpServletRequest request) {

		// 클래스아이디 session으로 호출
		HttpSession session = request.getSession();
		MyClassVO vo = (MyClassVO)session.getAttribute("myClass");
		int classId = (Integer)session.getAttribute("ourClassId");
		session.setMaxInactiveInterval(1800);
		
		noticeVO.setClassId(classId);
		
		// member 로그인정보 어노테이션으로 받아오기
//		String memberId = member.getMemberId();
//		noticeVO.setMemberId(memberId);
		
		//공지등록
		noticeService.insertNoticeInfo(noticeVO);
		
		// 첨부파일 등록
		List<Map<String, Object>> fileInfos = noticeFileUploadService.uploadFile(noticeVO.getFiles());
		List<NoticeFileVO> fileList = new ArrayList<NoticeFileVO>();
		
		if(!fileInfos.isEmpty()) {
			
			for(Map<String, Object> fileInfo : fileInfos) {
				
				NoticeFileVO fileVO = new NoticeFileVO();
				
				fileVO.setNoticeNo(noticeVO.getNoticeNo());
				fileVO.setOriginalfileName(fileInfo.get("origin").toString());
				fileVO.setSavefileName(fileInfo.get("save").toString());
				fileList.add(fileVO);
			}
			noticeFileService.insertFileInfo(fileList);
			
		}
		
		//템플릿 수정
		if(noticeVO.getTemplateEdit() != null) {
		
			noticeTemplateService.updateNoticeTemplate(tempVO);
		}
		
		return "redirect:noticeF401List";
	}
	// 템플릿 컨트롤러에서 F402 템플릿 불러들인 후 noticeInsert 기능 적용
		@PostMapping("/notice/templateToF402Notice")
		public String templateF402InsertProcess(NoticeVO noticeVO
															,NoticeTemplateVO tempVO
//															,@AuthenticationPrincipal MemberVO member
															,Model model
															,HttpServletRequest request) {

			// 클래스아이디 session으로 호출
			HttpSession session = request.getSession();
			MyClassVO vo = (MyClassVO)session.getAttribute("myClass");
			int classId = (Integer)session.getAttribute("ourClassId");
			session.setMaxInactiveInterval(1800);
			
			noticeVO.setClassId(classId);
			
			// member 로그인정보 어노테이션으로 받아오기
//			String memberId = member.getMemberId();
//			noticeVO.setMemberId(memberId);
			
			//공지등록
			noticeService.insertNoticeInfo(noticeVO);
			
			// 첨부파일 등록
			List<Map<String, Object>> fileInfos = noticeFileUploadService.uploadFile(noticeVO.getFiles());
			List<NoticeFileVO> fileList = new ArrayList<NoticeFileVO>();
			
			if(!fileInfos.isEmpty()) {
				
				for(Map<String, Object> fileInfo : fileInfos) {
					
					NoticeFileVO fileVO = new NoticeFileVO();
					
					fileVO.setNoticeNo(noticeVO.getNoticeNo());
					fileVO.setOriginalfileName(fileInfo.get("origin").toString());
					fileVO.setSavefileName(fileInfo.get("save").toString());
					fileList.add(fileVO);
				}
				noticeFileService.insertFileInfo(fileList);
				
			}
			
			//템플릿 수정
			if(noticeVO.getTemplateEdit() != null) {
			
				noticeTemplateService.updateNoticeTemplate(tempVO);
			}
			
			return "redirect:noticeF402List";
		}
	
	// 공지 수정 페이지
	@GetMapping("/notice/noticeUpdate")
	public String noticeUpdatePage(NoticeVO noticeVO, Model model) {
		NoticeVO findVO = noticeService.getNoticeInfo(noticeVO);
		model.addAttribute("noticeList",findVO);
		return "notice/noticeUpdate";
	}
	
	// 공지 수정 실행
	@PostMapping("/notice/noticeUpdate")
	@ResponseBody
	public Map<String, Object> noticeUpdateProcess(@RequestBody NoticeVO noticeVO){
		Map<String, Object> map = new HashMap<>();
		int result = noticeService.updateNoticeInfo(noticeVO);
		
		if( result > -1) {
			map.put("result", true);
			map.put("noticeNo", result);
		}else {
			map.put("result", false);
		}
		return map;
	}
	
	// 공지 삭제 ajax - 파일은 트리거 삭제
	@PostMapping("/notice/noticeDelete")
	@ResponseBody
	public int noticeDelete(@RequestParam Integer noticeNo) {
		return noticeService.deleteNoticeInfo(noticeNo);
	}
}
