package com.yedam.uriban.notice.service;

import lombok.Data;

@Data
public class NoticeTemplateVO {
	private int templateNo;
	private String memberId;
	private String noticeType;
	private String noticeTitle;
	private String noticeContent;
	
	private String noticeTypeName;
	
	private String classId;
}
