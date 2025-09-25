package com.yedam.uriban.diary.service;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class DiaryVO {
	private int diaryNo;
	private int studentNo;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date diaryName;
	private String diaryType;
	private String diaryContent;
	private String ach;
	
	private String studentName;
	private String studentClassNo;
	private String subCdNm;
	private String month;
}
