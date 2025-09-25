package com.yedam.uriban.album.down.detail.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.uriban.album.down.detail.service.DownDetailHistoryService;
import com.yedam.uriban.album.down.detail.service.DownDetailHistoryVO;

@Controller
public class DownDetailHistoryController {

	@Autowired
	DownDetailHistoryService downDetailHistoryService;
	
	@GetMapping("admin/downDetailHistory")
	public String downDetailHistory(int downNo, Model model) {
		
		List<DownDetailHistoryVO> detailVO = downDetailHistoryService.getDownDetailHistoryInfoWithDownNo(downNo);
		
		model.addAttribute("detailHistory",detailVO);
		
		return "admin/downDetailHistroy";
	}
	
	@PostMapping("album/insertDownDetailHistory")
	@ResponseBody 
	Map<String,Object> insertDownHistory(@RequestBody DownDetailHistoryVO downDetailVO){
		Map<String,Object> map = new HashMap<String,Object>();
		
		int result = downDetailHistoryService.insertDownDetailHistory(downDetailVO);
		map.put("result", result);
		
		return map;
	}
	
}
