package com.yedam.uriban.testbank.service;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.yedam.uriban.testanswer.service.TestAnswerVO;

import lombok.Data;

@Data
public class TestBankVO {
	private Integer testNo;
	private int homeworkNo;
	private String memberId;
	private String subjectNo;
	private String testType;
	private String testDetail;
	private String testImg;
	private String testCommentary;
	private String commentaryImg;
	private int testScore;
	private String testCorrect;
	private List<String> answers;
	private List<TestAnswerVO> answerList;
	private int studentAnswerNo;
	private String correctOrWrong;
	private String studentAnswer;
	private String subjectNm;
	private String wrongMemo;
	private String subCdNm;
	
	// testImage
	private MultipartFile testImage;
	
	// commentaryImage
	private MultipartFile commentImage;

	private Date submitDate;

}