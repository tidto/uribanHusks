package com.yedam.uriban.survey.survey.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.uriban.parents.mapper.ParentsMapper;
import com.yedam.uriban.parents.service.ParentsVO;
import com.yedam.uriban.student.mapper.StudentMapper;
import com.yedam.uriban.student.service.StudentVO;
import com.yedam.uriban.survey.answers.mapper.SurvAnsMapper;
import com.yedam.uriban.survey.answers.service.SurvAnswersVO;
import com.yedam.uriban.survey.people.mapper.PeopleMapper;
import com.yedam.uriban.survey.people.service.PeopleService;
import com.yedam.uriban.survey.people.service.PeopleVO;
import com.yedam.uriban.survey.question.mapper.QuestionMapper;
import com.yedam.uriban.survey.question.service.QuestionVO;
import com.yedam.uriban.survey.survey.mapper.SurveyMapper;
import com.yedam.uriban.survey.survey.service.SurveyService;
import com.yedam.uriban.survey.survey.service.SurveyVO;

@Service
public class SurveyServiceImpl implements SurveyService {

	@Autowired
	SurveyMapper surveyMapper;

	@Autowired
	QuestionMapper questionMapper;

	@Autowired
	SurvAnsMapper survAnsMapper;

	@Autowired
	PeopleMapper peopleMapper;

	@Autowired
	PeopleService peopleService;

	@Autowired
	StudentMapper studentMapper;

	@Autowired
	ParentsMapper parentsMapper;

	@Override
	public List<SurveyVO> getSurveyAll() {
		List<SurveyVO> findList = surveyMapper.selectSurveyList();
		return findList;
	}

	@Override
	public SurveyVO getSurvey(SurveyVO surveyVO) {
		return surveyMapper.selectSurveyInfo(surveyVO);
	}
	
	@Override
	public int insertSurveyInfo(SurveyVO surveyVO) {
		// insert 할 때 한 번에 다 하기
		// 설문
		int result = surveyMapper.insertSurvey(surveyVO);

		int survNo = surveyVO.getSurvNo();
		String accountType = surveyVO.getAccountType();
		int classId = surveyVO.getClassId();
		int questionNo = 0;
		int queMarkNo = 1;
		
		// 문제
		for (QuestionVO questionVO : surveyVO.getQuestion()) {
			questionVO.setSurvNo(survNo);
			questionVO.setQueMarkNo(queMarkNo++);
			questionMapper.insertQuestion(questionVO);
			questionNo = questionVO.getQuestionNo();
			int ansMarkNo = 1;
			// 보기
			for (SurvAnswersVO survAnswersVO : questionVO.getAnswer()) {
				survAnswersVO.setQuestionNo(questionNo);
				survAnswersVO.setAnsMarkNo(ansMarkNo++);
				survAnsMapper.insertSurvAnswers(survAnswersVO);
			}
		}
		// 응답자 학생, 학부모 분리
		if (accountType.equals("E101")) { // 학생
			List<StudentVO> students = studentMapper.survStudentList(classId);
			for (StudentVO studentVO : students) {
				PeopleVO peopleVO = new PeopleVO();
				peopleVO.setSurvNo(survNo);
				peopleVO.setAccountType("E501");
				peopleVO.setMemberId(studentVO.getMemberId());
				peopleVO.setMemberName(studentVO.getStudentName());
				peopleMapper.insertPeople(peopleVO);
			}
		} else if (accountType.equals("E102")) { // 학부모
			List<ParentsVO> parents = parentsMapper.survParentsList(classId);
			for (ParentsVO parentsVO : parents) {
				PeopleVO peopleVO = new PeopleVO();
				peopleVO.setSurvNo(survNo);
				peopleVO.setAccountType("E502");
				peopleVO.setMemberId(parentsVO.getMemberId());
				peopleVO.setMemberName(parentsVO.getParentsName());
				peopleMapper.insertPeople(peopleVO);
			}
		} else {
			List<StudentVO> students = studentMapper.survStudentList(classId);
			for (StudentVO studentVO : students) {
				PeopleVO peopleVO = new PeopleVO();
				peopleVO.setSurvNo(survNo);
				peopleVO.setAccountType("E501");
				peopleVO.setMemberId(studentVO.getMemberId());
				peopleVO.setMemberName(studentVO.getStudentName());
				peopleMapper.insertPeople(peopleVO);
			}
			List<ParentsVO> parents = parentsMapper.survParentsList(classId);
			for (ParentsVO parentsVO : parents) {
				PeopleVO peopleVO = new PeopleVO();
				peopleVO.setSurvNo(survNo);
				peopleVO.setAccountType("E502");
				peopleVO.setMemberId(parentsVO.getMemberId());
				peopleVO.setMemberName(parentsVO.getParentsName());
				peopleMapper.insertPeople(peopleVO);
			}
		}
		if (result == 1) {
			return 1;
		} else {
			return -1;
		}
	}
	
	// 수정 시 que, ans는 delete하고 insert
	// 대상자 수정 시 people도 delete하고 insert
	@Override
	public int updateSurveyInfo(SurveyVO surveyVO) {
		int result = surveyMapper.updateSurvey(surveyVO);

		int survNo = surveyVO.getSurvNo();
		int queMarkNo = 1;
		String accountType = surveyVO.getAccountType();
		int classId = surveyVO.getClassId();
		
		survAnsMapper.deleteSurvAnswers(survNo);
		questionMapper.deleteQuestion(survNo);
		peopleMapper.deletePeople(survNo);
		
		for (QuestionVO questionVO : surveyVO.getQuestion()) {
			questionVO.setSurvNo(survNo);
			questionVO.setQueMarkNo(queMarkNo++);
			questionMapper.insertQuestion(questionVO);
			int questionNo = questionVO.getQuestionNo();
			int ansMarkNo = 1;
			for (SurvAnswersVO survAnswersVO : questionVO.getAnswer()) {
				survAnswersVO.setQuestionNo(questionNo);
				survAnswersVO.setAnsMarkNo(ansMarkNo++);
				survAnsMapper.insertSurvAnswers(survAnswersVO);
			}
		}
		// 응답자 학생, 학부모 분리
		if (accountType.equals("E101")) { // 학생
			List<StudentVO> students = studentMapper.survStudentList(classId);
			for (StudentVO studentVO : students) {
				PeopleVO peopleVO = new PeopleVO();
				peopleVO.setSurvNo(survNo);
				peopleVO.setAccountType("E501");
				peopleVO.setMemberId(studentVO.getMemberId());
				peopleVO.setMemberName(studentVO.getStudentName());
				peopleMapper.insertPeople(peopleVO);
			}
		} else if (accountType.equals("E102")) { // 학부모
			List<ParentsVO> parents = parentsMapper.survParentsList(classId);
			for (ParentsVO parentsVO : parents) {
				PeopleVO peopleVO = new PeopleVO();
				peopleVO.setSurvNo(survNo);
				peopleVO.setAccountType("E502");
				peopleVO.setMemberId(parentsVO.getMemberId());
				peopleVO.setMemberName(parentsVO.getParentsName());
				peopleMapper.insertPeople(peopleVO);
			}
		} else {
			List<StudentVO> students = studentMapper.survStudentList(classId);
			for (StudentVO studentVO : students) {
				PeopleVO peopleVO = new PeopleVO();
				peopleVO.setSurvNo(survNo);
				peopleVO.setAccountType("E501");
				peopleVO.setMemberId(studentVO.getMemberId());
				peopleVO.setMemberName(studentVO.getStudentName());
				peopleMapper.insertPeople(peopleVO);
			}
			List<ParentsVO> parents = parentsMapper.survParentsList(classId);
			for (ParentsVO parentsVO : parents) {
				PeopleVO peopleVO = new PeopleVO();
				peopleVO.setSurvNo(survNo);
				peopleVO.setAccountType("E502");
				peopleVO.setMemberId(parentsVO.getMemberId());
				peopleVO.setMemberName(parentsVO.getParentsName());
				peopleMapper.insertPeople(peopleVO);
			}
		}
		if (result == 1) {
			return 1;
		} else {
			return -1;
		}
	}
	
	// 전체 삭제
	@Override
	public int deleteSurveyInfo(int survNo) {
		PeopleVO peopleVO = new PeopleVO();
		peopleVO.setSurvNo(survNo);
		
		int result = peopleMapper.selectCntPeople(survNo);
		
		if (result <= 0) {
			survAnsMapper.deleteSurvAnswers(survNo);
			questionMapper.deleteQuestion(survNo);
			surveyMapper.deleteSurvey(survNo);
			peopleMapper.deletePeople(survNo);
			return -1;
		} else {
			return result;
		}
	}
	
	// 선택 삭제
	@Override
	public void deleteSelectSurvey(SurveyVO surveyVO) {
		int survNo = surveyVO.getSurvNo();
		for (QuestionVO questionVO : surveyVO.getQuestion()) {
			int questionNo = questionVO.getQuestionNo();
			questionVO.setSurvNo(survNo);
			survAnsMapper.deleteSelAnswers(questionNo);

			questionMapper.deleteSelectQuestion(questionNo);
		}
	}

	@Override
	public List<SurveyVO> getSurveyAllTop(SurveyVO surveyVO) {
		return surveyMapper.selectSurveyListTop(surveyVO);
	}

	@Override
	public List<SurveyVO> getSubmitList(int classId) {
		SurveyVO vo = new SurveyVO();
		vo.setClassId(classId);
		return surveyMapper.getSubmitList(classId);
	}

	@Override
	public int selectPeopleCnt(int survNo) {
		return surveyMapper.selectPeopleCnt(survNo);
	}

	@Override
	public List<SurveyVO> getPeopleList(SurveyVO surveyVO) {
		return surveyMapper.getPeopleList(surveyVO);
	}
}
