package com.yedam.uriban.member.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class CertVO {
	private int CertNo;
	private String memberId;
	private String memberName;
	private String originalfileName;
	private String savefileName;
	@DateTimeFormat
	private Date uploadDate;
	@DateTimeFormat
	private Date updateDate;
	private String certStat;
	private String cmt;
}
