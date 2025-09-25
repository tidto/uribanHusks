package com.yedam.uriban.member.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class BanVO {
	private int banNo;
	private int reportNo;
	private String banType;
	private String memberId;
	private int banCount;
	private int banDay;
	@DateTimeFormat
	private Date banStartDate;
	@DateTimeFormat
	private Date banEndDate;
}
