package com.yedam.uriban.member.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.yedam.uriban.member.service.BanService;

@Component
public class BanScheduler {
	@Autowired 
	BanService banService;
	
	// 제한 종료
	@Scheduled(cron="0 0 0 * * *")
	public void jailBreak() {
		banService.endBanMember();
	}
}
