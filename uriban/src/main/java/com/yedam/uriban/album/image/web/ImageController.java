package com.yedam.uriban.album.image.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.uriban.album.image.service.ImageService;
import com.yedam.uriban.album.image.service.ImageVO;

/*
 * 구현: 장근렬
 * 구현일자: 2023-10-
 * 이미지 리스트 출력
 * */

@Controller
public class ImageController {

	@Autowired
	ImageService imageService;
	
	@PostMapping("img/imageAlbumList")
	@ResponseBody
	public Map<String, Object> imgList(@RequestBody int albumNo){
		Map<String,Object> map = new HashMap<String,Object>();
		List<ImageVO> imglist = imageService.getImageAlbumList(albumNo);
		
		map.put("imgs", imglist);
		
		return map;
	}
}
