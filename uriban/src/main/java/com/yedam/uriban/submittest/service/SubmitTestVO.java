package com.yedam.uriban.submittest.service;

import java.util.Date;
import java.util.List;

import com.yedam.uriban.studentanswer.service.StudentAnswerVO;

import lombok.Data;

@Data
public class SubmitTestVO {
	private Integer submitTestNo;
	private Integer homeworkNo;
	private String memberId;
	private String answerState;
	private int totalScore;
	private String answerPercent;
	private String memberName;
	private Date submitDdate;
	private List<StudentAnswerVO> answer;
	private String correctOrWrong;
	private Date submitDate;
}
