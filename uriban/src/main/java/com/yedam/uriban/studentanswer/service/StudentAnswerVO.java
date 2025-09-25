package com.yedam.uriban.studentanswer.service;

import java.util.List;

import lombok.Data;

@Data
public class StudentAnswerVO {
	private Integer studentAnswerNo;
	private Integer submitTestNo;
	private Integer answerNo;
	private String correctOrWrong;
	private String wrongMemo;
	private int answerOrder;
	private String studentAnswer;
	//submit_test
	private int totalScore;
	private String answerPercent;
	//test_bank
	private int testNO;
	private List<String> answers;
	private String testType;
	private String testDetail;
	private int testScore;
	private String testCorrect;
}
