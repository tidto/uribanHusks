package com.yedam.uriban.member.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.yedam.uriban.member.service.BanService;

@Controller
public class BanController {

	@Autowired
	BanService banService;

	// 제한 이력 조회
	@GetMapping("admin/banList")
	public String getBanList(Model model) {
		model.addAttribute("banList", banService.getBanList());
		return "admin/banList";
	}
	
	

}
