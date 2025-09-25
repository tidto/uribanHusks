package com.yedam.uriban.notice.service;

import lombok.Data;

@Data
public class NoticeFileVO {
	private int fileNo;
	private String originalfileName;
	private String savefileName;
	private int noticeNo;
}
