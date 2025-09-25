package com.yedam.uriban.member.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.uriban.member.service.CertService;
import com.yedam.uriban.member.service.CertVO;

@Controller
public class CertController {

	@Autowired
	CertService certService;

	// 신청 내역 조회
	@GetMapping("admin/applyList")
	public String getApplyList(Model model) {
		model.addAttribute("applyList", certService.getCertList());
		return "admin/applyList";
	}
	
	// 교원 자격 수정
	@PostMapping("admin/certUpdate")
	@ResponseBody
	public String certUpdate(@RequestBody CertVO certVO) {
		int chk = certService.certUpdate(certVO);
		String result = "fail";
		if(chk > 0) {
			result = "success";
		}
		return result;
	}
}
