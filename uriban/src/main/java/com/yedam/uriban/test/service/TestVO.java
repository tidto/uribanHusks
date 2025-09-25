package com.yedam.uriban.test.service;

import java.util.Date;

import lombok.Data;

@Data
public class TestVO {
	private Integer testMngNo;
	private Integer homeworkNo;
	private Integer testNo;
	private String homeworkTitle;
	private String problemCount;
	private Date homeworkRdate;
	private Date homeworkDdate;
	private String answerState;
	private String totalScore;
}
