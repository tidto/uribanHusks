package com.yedam.uriban.survey.answers.service;

import lombok.Data;

@Data
public class SurvAnswersVO {
	private Integer answerNo;
	private Integer questionNo;
	private String answerType;
	private String answerContent;
	private Integer ansMarkNo;
	// 한 문제당 응답한 보기 카운트
	private Integer responseCnt;
	// 학생 응답 보기마다 횟수
	private Integer respStuCnt;
	// 학부모 응답 보기마다 횟수
	private Integer respParCnt;
}
