package com.yedam.uriban.album.down.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.uriban.album.down.service.DownHistoryService;
import com.yedam.uriban.album.down.service.DownHistoryVO;
import com.yedam.uriban.member.service.MemberVO;

/*
 * 구현: 장근렬
 * 구현일자: 2023-10-
 * 앨범 이미지 다운로드 이력 관리
 * */

@Controller
public class DownHistoryController {

	@Autowired
	DownHistoryService downHistoryService;
	
	@GetMapping("admin/downHistory")
	public String downHistory(Model model) {
		List<DownHistoryVO> histories = downHistoryService.getHistoryList();
		
		model.addAttribute("downList",histories);
		
		return "admin/downHistory";
	}
	
	@PostMapping("album/insertDownHistory")
	@ResponseBody 
	public int insertDownHistory(@RequestBody DownHistoryVO downVO, 
										 @AuthenticationPrincipal MemberVO member,
										 HttpServletRequest request){	
		String ip = request.getRemoteAddr();
		
		downVO.setUserId(member.getMemberId());
		downVO.setUserIp(ip);	
		
		int downNo = downHistoryService.insertHistory(downVO);
		
		return downNo;
	}
	
}
