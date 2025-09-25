package com.yedam.uriban.mail.service;

import java.util.Date;

import lombok.Data;

@Data
public class MailReceiverVO {	
	private int mailReNo;
	private int mailNo;
	private String readCheck;
	private String mailReceiver;
	
	private String senderId;
	private String senderName;
	private String receiveTitle;
	private Date receiveDate;
	private String receiveContents;
	
	private int classId;
	private String mailType;
	private String mailTypeName;
	private String readCheckName;
	
	private String senderAuthority;
	private String noticeSet;
	private int noticeNo;
	
	private String memberId;
	
	private String newMailCount;
}
