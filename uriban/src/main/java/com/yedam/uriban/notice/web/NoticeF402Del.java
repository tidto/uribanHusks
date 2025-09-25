package com.yedam.uriban.notice.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.yedam.uriban.notice.service.NoticeService;


@Component
public class NoticeF402Del {
	
	@Autowired
	NoticeService noticeService;
	
	@Scheduled(cron = "0 0 9 ? * THU")
	public void thursDel() throws Exception {
		noticeService.deleteF402Info();
	}
	
	@Scheduled(cron = "0 * * * * ?")
	public void testF401Del() throws Exception {
		noticeService.deleteF402Info();
	}
}
