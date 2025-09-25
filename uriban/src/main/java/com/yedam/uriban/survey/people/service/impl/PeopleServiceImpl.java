package com.yedam.uriban.survey.people.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.uriban.survey.answers.mapper.RespAnsMapper;
import com.yedam.uriban.survey.answers.service.RespAnswersVO;
import com.yedam.uriban.survey.people.mapper.PeopleMapper;
import com.yedam.uriban.survey.people.service.PeopleService;
import com.yedam.uriban.survey.people.service.PeopleVO;
import com.yedam.uriban.survey.survey.service.SurveyVO;
@Service
public class PeopleServiceImpl implements PeopleService {
	@Autowired	
	PeopleMapper peopleMapper;

	@Autowired
	RespAnsMapper respAnsMapper;
	
	@Override
	public List<PeopleVO> getPeopleAll(PeopleVO peopleVO) {
		List<PeopleVO> findList = peopleMapper.selectPeopleList(peopleVO);
		
		RespAnswersVO responseVO = new RespAnswersVO();
		for(PeopleVO VO : findList) {
			int survManNo = VO.getSurvManNo();
			
			responseVO.setSurvManNo(survManNo);
			List<RespAnswersVO> answerList =respAnsMapper.selectRespAnswersInfo(responseVO);
			
			VO.setRespAnswer(answerList);
		}
		return findList;
	}
	
	@Override
	public PeopleVO getPeople(PeopleVO peopleVO) {
		return peopleMapper.selectPeopleInfo(peopleVO);
	}

	@Override
	public int selectCntPeople(int survNo) {
		int result = peopleMapper.selectCntPeople(survNo);
		if (result == 1) {
			return Integer.valueOf(survNo);
		} else {
			return -1;
		}
	}
	
	@Override
	public PeopleVO selectResponse(PeopleVO peopleVO) {
		return peopleMapper.selectResponse(peopleVO);
	}
	
	@Override
	public int insertPeopleInfo(PeopleVO peopleVO) {
		peopleMapper.insertPeople(peopleVO);
		int SurvManNo = peopleVO.getSurvManNo();
		
		for(RespAnswersVO respAnswersVO : peopleVO.getRespAnswer()) {
			respAnswersVO.setSurvManNo(SurvManNo);
			respAnsMapper.insertRespAnswers(respAnswersVO);
		}
		return 0;
	}
	
	@Override
	public int updatePeopleInfo(PeopleVO peopleVO) {
		
		PeopleVO VO = peopleMapper.selectPeople(peopleVO);
		System.out.println(VO);
		int SurvManNo = VO.getSurvManNo();
		// 설문 answer 완료
		String survAnswer = "E402";
		int result = 0;
		for(RespAnswersVO respAnswersVO : peopleVO.getRespAnswer()) {
			respAnswersVO.setSurvManNo(SurvManNo);
			result = respAnsMapper.insertRespAnswers(respAnswersVO);
			if(result == 1) {
				peopleVO.setSurvAnswer(survAnswer);
				peopleMapper.updatePeople(peopleVO);
			} else {
				return -1;
			}
		}
		return result;
	}

	@Override
	public int deletePeopleInfo(int survNo) {
		int result = peopleMapper.deletePeople(survNo);
		
		if (result == 1) {
			return survNo;
		} else {
			return -1;
		}
	}

	@Override
	public PeopleVO selectPeople(PeopleVO peopleVO) {
		return null;
	}
}
