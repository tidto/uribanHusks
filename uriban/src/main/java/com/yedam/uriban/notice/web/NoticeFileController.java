package com.yedam.uriban.notice.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;


import com.yedam.uriban.notice.service.NoticeFileService;

/*
 * 구현: 서민호
 * 구현일자: 2023-10-
 * 
 * */

@Controller
public class NoticeFileController {
	
	@Autowired
	NoticeFileService noticeFileService;
	
}
