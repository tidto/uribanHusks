package com.yedam.uriban.notice.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.uriban.notice.service.NoticeTemplateService;
import com.yedam.uriban.notice.service.NoticeTemplateVO;

/*
 * 구현: 서민호
 * 구현일자: 2023-10-
 * 
 * */

@Controller
public class NoticeTemplateController {

	@Autowired
	NoticeTemplateService noticeTemplateService;
	
	// 선생 개인 템플릿 다건 조회
	@GetMapping("/notice/templateList")
	public String templateList(String memberId,Model model) {
		List<NoticeTemplateVO> list = noticeTemplateService.getNoticeTemplateList(memberId);
		model.addAttribute("templateList", list);
		return "notice/templateList";
	}
	
	// 단건 값 noticeinsert 값 삽입
	@GetMapping("/notice/templateToNotice")
	public String templateToNoicePage(NoticeTemplateVO tempVO, Model model) {
		NoticeTemplateVO findVO = noticeTemplateService.getNoticeTemplateInfo(tempVO);
		model.addAttribute("templateInfo", findVO);		
		return "notice/templateToNotice";
	}
	
	
	// 템플릿 적용
	// 선택 업데이트는 noticeController에서 처리
	@GetMapping("/notice/templateInsert")
	public String templateInsertPage() {
		return "notice/noticeInsert";
	}

	// 템플릿 삭제
	@PostMapping("/notice/templateDelete")
	@ResponseBody
	public int tempalteDelete(@RequestParam Integer templateNo) {
		return noticeTemplateService.deleteNoticeTemplate(templateNo);
	}
}
