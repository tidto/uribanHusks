package com.yedam.uriban.survey.question.service;

import java.util.List;
import java.util.Map;

import com.yedam.uriban.survey.answers.service.RespAnswersVO;
import com.yedam.uriban.survey.answers.service.SurvAnswersVO;

import lombok.Data;

@Data
public class QuestionVO {
	private Integer questionNo;
	private Integer survNo;
	private Integer queMarkNo;
	private String questionContent;
	private String questionCheck;
	private List<SurvAnswersVO> answer;
	// 질문에 대한 작성한 답안 리스트
	private List<RespAnswersVO> response;
	private List<Map<String, Object>> answerMap;
}
