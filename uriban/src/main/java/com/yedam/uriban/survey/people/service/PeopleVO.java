package com.yedam.uriban.survey.people.service;

import java.util.List;

import com.yedam.uriban.survey.answers.service.RespAnswersVO;

import lombok.Data;

@Data
public class PeopleVO {
	private Integer survManNo;
	private Integer survNo;
	private String memberId;
	private String survAnswer;
	private String accountType;
	private String memberName;
	// 1건에 다수 List
	private List<RespAnswersVO> respAnswer;
	private Integer survTotal;
	private Integer survResponse;
	private String survPercent;
}	
