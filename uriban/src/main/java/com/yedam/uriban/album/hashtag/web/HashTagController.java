package com.yedam.uriban.album.hashtag.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.yedam.uriban.album.hashtag.service.HashTagService;

/*
 * 구현: 장근렬
 * 구현일자: 2023-10-
 * 
 * */

@Controller
public class HashTagController {
	@Autowired
	HashTagService hashTagService;
}
