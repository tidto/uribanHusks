package com.yedam.uriban.homework.service;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class HomeworkVO {
	private Integer homeworkNo;
	private Integer classId;
	private String homeworkTitle;
	private Date homeworkRdate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date homeworkDdate;
	private int problemCount;
	private String submitCount;
	private String allStudent;
	private String homeworkStatus;
	private String testSubject;
	private List<Integer> testNo;
	private String answerState;
	private String totalScore;
	private Integer rn;
	private Date today;

}
