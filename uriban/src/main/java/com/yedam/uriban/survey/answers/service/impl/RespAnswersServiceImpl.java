package com.yedam.uriban.survey.answers.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.uriban.survey.answers.mapper.RespAnsMapper;
import com.yedam.uriban.survey.answers.service.RespAnswersService;
import com.yedam.uriban.survey.answers.service.RespAnswersVO;
@Service
public class RespAnswersServiceImpl implements RespAnswersService{
	@Autowired
	RespAnsMapper respAnsMapper;
	
	@Override
	public List<RespAnswersVO> getRespAnswersAll() {
		return null;
	}

	@Override
	public List<RespAnswersVO> getRespAnswers(RespAnswersVO respAnswersVO) {
		return respAnsMapper.selectRespAnswersInfo(respAnswersVO);
	}

	@Override
	public List<RespAnswersVO> getRespAnswerAll(RespAnswersVO respAnswersVO) {
		return respAnsMapper.selectAnswerAll(respAnswersVO);
	}
	
	@Override
	public int insertRespAnswersInfo(RespAnswersVO respAnswersVO) {
		return 0;
	}

	@Override
	public int updateRespAnswersInfo(RespAnswersVO respAnswersVO) {
		return 0;
	}

	@Override
	public int deleteRespAnswersInfo(int survManNo) {
		return 0;
	}
}
