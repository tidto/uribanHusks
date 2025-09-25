package com.yedam.uriban.survey.survey.service;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.yedam.uriban.survey.people.service.PeopleVO;
import com.yedam.uriban.survey.question.service.QuestionVO;

import lombok.Data;

@Data
public class SurveyVO {
	private Integer survNo;
	private Integer classId;
	private Integer noticeNo;
	private String survTitle;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date startDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date endDate;
	private String survStatus;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date regDate;
	private String accountType;
	private Integer survManNo;
	// 1건에 다수 List
	private List<QuestionVO> question;
	private List<PeopleVO> people;
	// main 화면에서 사용
	private String survAnswer;
	private String memberId;
}
