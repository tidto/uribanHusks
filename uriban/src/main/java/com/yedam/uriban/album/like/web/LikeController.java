package com.yedam.uriban.album.like.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.uriban.album.like.service.LikeService;
import com.yedam.uriban.album.like.service.LikeVO;

/*
 * 구현: 장근렬
 * 구현일자: 2023-10-
 * 
 * */

@Controller
public class LikeController {

	@Autowired
	LikeService likeService;
	
	@GetMapping("like/likeList")
	@ResponseBody
	public Map<String, Object> likeList(String memberId){
		Map<String,Object> map = new HashMap<String,Object>();
		List<LikeVO> likeList = new ArrayList<>();
		likeList = likeService.getLikeList(memberId);
		
		map.put("likeList", likeList);
		
		return map;
	}
	
	@PostMapping("like/likeInsert")
	@ResponseBody
	public Map<String, Object> likeInsert(@RequestBody LikeVO likeVO){
		Map<String,Object> map = new HashMap<String,Object>();
		int result = likeService.insertLikeInfo(likeVO);
		LikeVO like = likeService.getLikeInfo(result);
		map.put("result", like);
		
		return map;
	}
	
	@PostMapping("like/likeDelete")
	@ResponseBody
	public Map<String, Object> likeDelete(@RequestBody LikeVO likeVO){
		Map<String,Object> map = new HashMap<String,Object>();
		int result = likeService.deleteLikeInfo(likeVO);

		map.put("result", result);
		
		return map;
	}
}
