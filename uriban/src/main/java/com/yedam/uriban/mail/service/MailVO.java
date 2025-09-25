package com.yedam.uriban.mail.service;

import java.util.Date;

import lombok.Data;

@Data
public class MailVO {
	private int mailNo;
	private int classId;
	private String mailType;
	private String mailTitle;
	private String mailContents;
	private Date mailSendDate;
	private String senderId;
	private int noticeNo;
	
	private String mailTypeName;
	private String receiverId;
	private String receiverName;
	
	private String promiseChecked;
	
	private String mailReceiver;
	private String memberId;
	
	private String noticeSet;
}
