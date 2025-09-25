package com.yedam.uriban.schedule.web;

import java.util.List;
import java.util.Objects;

import com.yedam.uriban.member.service.MemberVO;
import com.yedam.uriban.myclass.service.MyClassVO;
import com.yedam.uriban.notice.service.NoticeService;
import com.yedam.uriban.notice.service.NoticeVO;
import net.sf.json.JSONArray;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.uriban.schedule.service.CalendarVO;
import com.yedam.uriban.schedule.service.ScheduleService;
import com.yedam.uriban.schedule.service.ScheduleVO;

import javax.servlet.http.HttpSession;

@Controller
public class ScheduleController {
	@Autowired
	ScheduleService scheduleService;

	@Autowired
	NoticeService noticeService;
	@GetMapping("scheduleList")
	public String scheduleList(Model model, @AuthenticationPrincipal MemberVO member) {

		String auth = member.getAuthority();
		model.addAttribute("auth",auth);
		List<ScheduleVO> list = scheduleService.getScheduleAll();
		model.addAttribute("scheduleList", list);
		return "schedule/scheduleList";
	}
	
	@GetMapping("ajaxCalList")
	@ResponseBody
	public List<CalendarVO> calendarList(CalendarVO calendarVO, HttpSession session, @AuthenticationPrincipal MemberVO member){
		String auth = member.getAuthority();
		calendarVO.setAuthority(auth);
		MyClassVO myClassVO = (MyClassVO)session.getAttribute("myClass");
		calendarVO.setClassId(String.valueOf(myClassVO.getClassId()));
		List<CalendarVO> list =  scheduleService.getCalList(calendarVO);

		if(!"A102".equals(auth)){
			return list;
		}
		for(CalendarVO vo : list){
			String body = StringUtils.defaultIfEmpty(vo.getBody(),"");
			String id = vo.getId();
			String editHtml = "<br><div class=\"toastui-calendar-popup-section toastui-calendar-section-button\">" +
					"<button type=\"button\" class=\"toastui-calendar-edit-button\">" +
					"<span class=\"toastui-calendar-icon toastui-calendar-ic-edit\"></span>" +
					"<span class=\"toastui-calendar-content\">" +
					"<span class=\"toastui-calendar-template-popupEdit\">" +
					"<a id=\"btnScheduleUpdateForm\" data-schedule-no=\""+id+"\" data-toggle=\"modal\" data-target=\"#scheduleUpdateModal\">수정</a>" +
					"</span>" +
					"</span>" +
					"</button>" +
					"<div class=\"toastui-calendar-vertical-line\"></div>" +
					"<button type=\"button\" class=\"toastui-calendar-delete-button\">" +
					"<span class=\"toastui-calendar-icon toastui-calendar-ic-delete\"></span>" +
					"<span class=\"toastui-calendar-content\"><span class=\"toastui-calendar-template-popupDelete\">" +
					"<a id=\"btnScheduleDelete\" data-schedule-no=\""+id+"\">삭제</a>" +
					"</span></span></button></div>";
			body +=editHtml;
			vo.setBody(body);
		}
		return list;
	
	}
	
	@GetMapping("scheduleInfo")
	public String scheduleInfo(ScheduleVO scheduleVO, Model model) {
		model.addAttribute("scheduleInfo", scheduleService.getSchedule(scheduleVO));
		return "schedule/scheduleInfo"; 
	}


	@GetMapping("scheduleInsert")
	public String scheduleInsertForm(Model model, HttpSession session, @RequestParam(required = false) Integer noticeNo) {
		model.addAttribute("scheduleNo", scheduleService.getNewNo());


		MyClassVO vo = (MyClassVO) session.getAttribute("myClass");

		NoticeVO noticeVO = new NoticeVO();
		noticeVO.setClassId(vo.getClassId());


		List<NoticeVO> noticeList = noticeService.getNoticeF401List(noticeVO);
		JSONArray noticeListArray = JSONArray.fromObject(noticeList);
		model.addAttribute("noticeList", noticeListArray);
		if (Objects.nonNull(noticeNo)) {
			noticeVO.setNoticeNo(noticeNo);
			noticeVO = noticeService.getNoticeInfo(noticeVO);
			model.addAttribute("noticeVO", noticeVO);
		}
		return "schedule/scheduleInsert";
	}
	
	@PostMapping("scheduleInsert")
	public String scheduleInsertProcess(ScheduleVO scheduleVO, HttpSession session, @AuthenticationPrincipal MemberVO member) {

		MyClassVO vo = (MyClassVO)session.getAttribute("myClass");
		scheduleVO.setClassId(String.valueOf(vo.getClassId()));

		String name = member.getMemberName();
		scheduleVO.setScheduleWriter(name);
		scheduleService.insertScheduleInfo(scheduleVO);
		return "redirect:scheduleList";
	}
	
	@PostMapping("scheduelUpdate")
	@ResponseBody
	public CalendarVO scheduleUpdate(ScheduleVO scheduleVO) {
		scheduleService.updateScheduleInfo(scheduleVO);
		CalendarVO calendarVO = scheduleService.getCalendarEvent(scheduleVO);
		String body = StringUtils.defaultIfEmpty(calendarVO.getBody(),"");
		String id = calendarVO.getId();
		String editHtml = "<br><div class=\"toastui-calendar-popup-section toastui-calendar-section-button\">" +
				"<button type=\"button\" class=\"toastui-calendar-edit-button\">" +
				"<span class=\"toastui-calendar-icon toastui-calendar-ic-edit\"></span>" +
				"<span class=\"toastui-calendar-content\">" +
				"<span class=\"toastui-calendar-template-popupEdit\">" +
				"<a id=\"btnScheduleUpdateForm\" data-schedule-no=\""+id+"\" data-toggle=\"modal\" data-target=\"#scheduleUpdateModal\">수정</a>" +
				"</span>" +
				"</span>" +
				"</button>" +
				"<div class=\"toastui-calendar-vertical-line\"></div>" +
				"<button type=\"button\" class=\"toastui-calendar-delete-button\">" +
				"<span class=\"toastui-calendar-icon toastui-calendar-ic-delete\"></span>" +
				"<span class=\"toastui-calendar-content\"><span class=\"toastui-calendar-template-popupDelete\">" +
				"<a id=\"btnScheduleDelete\" data-schedule-no=\""+id+"\">삭제</a>" +
				"</span></span></button></div>";
		body +=editHtml;
		calendarVO.setBody(body);
		return calendarVO;
	}
	
	@GetMapping("scheduelDelete")
	@ResponseBody
	public String scheduleDelete(@RequestParam Integer scheduleNo) {
		scheduleService.deleteScheduleInfo(scheduleNo);
		return "SUCCESS";
	}

	@GetMapping("scheduleUpdateForm")
	public String scheduleUpdateForm(ScheduleVO scheduleVO, Model model, HttpSession session) {
		model.addAttribute("scheduleVO", scheduleService.getSchedule(scheduleVO));

		MyClassVO vo = (MyClassVO)session.getAttribute("myClass");

		NoticeVO noticeVO = new NoticeVO();
		noticeVO.setClassId(vo.getClassId());


		List<NoticeVO> noticeList = noticeService.getNoticeF401List(noticeVO);
		JSONArray noticeListArray = JSONArray.fromObject(noticeList);
		model.addAttribute("noticeList", noticeListArray);

		return "popup/scheduleUpdateForm";
	}



}
