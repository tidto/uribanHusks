package com.yedam.uriban.member.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ReportVO {
	private int reportNo;
	private String memberId;
	private String reportType;
	private String contentsType;
	private String content;
	private int contentsNo;
	private String reporterId;
	@DateTimeFormat
	private Date reportDate;
	private String reportState;
}
