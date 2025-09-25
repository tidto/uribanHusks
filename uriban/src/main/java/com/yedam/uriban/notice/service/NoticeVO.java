package com.yedam.uriban.notice.service;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class NoticeVO {
	private int noticeNo;
	private int classId;
	private Date noticeDate;
	private String noticeType;
	private String noticeTitle;
	private String noticeContent;
	private MultipartFile[] files;
	private String templateAdd;
	private String templateEdit;
	private List<NoticeFileVO> noticeFile;
	private String noticeTypeName;
	
//	private String memberId;
}
