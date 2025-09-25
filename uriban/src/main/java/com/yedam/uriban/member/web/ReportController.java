package com.yedam.uriban.member.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.uriban.member.service.ReportService;
import com.yedam.uriban.member.service.ReportVO;

@Controller
public class ReportController {

	@Autowired
	ReportService reportService;

	// 신고내역 목록
	@GetMapping("admin/rptList")
	public String getReportList(Model model) {
		model.addAttribute("rptList", reportService.getReportList());
		return "admin/rptList";
	}

	// 신고내역 상세
	@GetMapping("report/info")
	public String getReportInfo(ReportVO reportVO, Model model) {
		model.addAttribute("rptInfo", reportService.getReportInfo(reportVO));
		return "admin/reportInfo";
	}


	// 신고내역 생성 - 프로세스
	@RequestMapping(value = "report/reportInsert", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String reportProcess(@RequestBody ReportVO reportVO) {
		int check = reportService.insertReport(reportVO);

		String result = null;
		if (check == -1) {
			result = "fail";
		} else {
			result = "success";
		}
		return result;

	}

	// 신고 상태 수정
	@RequestMapping(value = "report/reportUpdate", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String reportUpdate(@RequestBody Map<String, Object> map) {

		int check = reportService.updateReport(map);
		
		String result = null;
		if (check == -1) {
			result = "fail";
		} else {
			result = "success";
		}

		return result;

	}



}
