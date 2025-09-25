package com.yedam.uriban.submittest.web;

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

import com.yedam.uriban.homework.service.PageVO;
import com.yedam.uriban.myclass.service.MyClassVO;
import com.yedam.uriban.submittest.service.SubmitTestService;
import com.yedam.uriban.submittest.service.SubmitTestVO;

@Controller
public class SubmitTestController {
	
	@Autowired
	SubmitTestService submitTestService;
	
	@GetMapping("submitTest/submitTestList")
	public String submitTestList(@RequestParam(required = false,defaultValue = "1") int pageNo,
				SubmitTestVO submitTestkVO,
				Model model,
				@RequestParam Map<String, Object> map,
				HttpServletRequest request
				, int homeworkNo) {

		HttpSession session = request.getSession();
		MyClassVO vo = (MyClassVO)session.getAttribute("myClass");

		map.put("classId", vo.getClassId());
		map.put("memberId", vo.getMemberId());
		map.put("homeworkNo", homeworkNo);

		PageVO page = new PageVO(pageNo, 9, submitTestService.getCount(map));

		map.put("startNo", page.getStartNo());
		map.put("endNo", page.getEndNo());
		List<SubmitTestVO> pageList = submitTestService.getPageList(map);
		model.addAttribute("page", page);
		model.addAttribute("pageList", pageList);

		return "submitTest/submitTestList";
	}
	
	@PostMapping("/submitTest/submitTestInsert")
	@ResponseBody
	public int submitTestInsert(@RequestBody SubmitTestVO vo) {
		int result = submitTestService.insertSubmitTestInfo(vo);	
		return result;
	}
}
