package com.yedam.uriban.survey.answers.service;

import java.util.Date;

import lombok.Data;

@Data
public class RespAnswersVO {
	private Integer responseNo;
	private Integer survManNo;
	private Integer answerNo;
	private String etcResponse;
	private Date responseDate;	
}
