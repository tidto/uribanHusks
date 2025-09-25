package com.yedam.uriban.parents.service.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.yedam.uriban.myclass.mapper.MyClassMapper;
import com.yedam.uriban.myclass.service.MyClassMemberVO;
import com.yedam.uriban.parents.mapper.ParentsMapper;
import com.yedam.uriban.parents.service.ParentsService;
import com.yedam.uriban.parents.service.ParentsVO;

@Service
public class ParentsServiceImpl implements ParentsService {

	@Autowired
	ParentsMapper parentsMapper;
	
	@Autowired
	MyClassMapper myClassMapper;

	@Override
	public List<ParentsVO> getParentsList(ParentsVO parentsVO) {
		List<ParentsVO> parentsList = parentsMapper.getParentsList(parentsVO);
		return parentsList;
	}

	@Override
	public ParentsVO getParentsInfo(ParentsVO parentsVO) {
		return parentsMapper.getParentsInfo(parentsVO);
	}

	@Override
	public int insertParents(ParentsVO parentsVO) {
		return parentsMapper.insertParents(parentsVO) == 1 ? parentsVO.getParentsNo() : -1;
	}

	@Override
	public Map<String, String> updateParents(ParentsVO parentsVO) {
		Map<String, String> map = new HashMap<>();

		map.put("아이디", parentsVO.getMemberId());

		int result = parentsMapper.updateParents(parentsVO);
		if (result == 1) {
			map.put("결과", "Success");
		} else {
			map.put("결과", "fail");
		}
		return map;
	}

	@Override
	public int deleteParents(ParentsVO memberId) {
		return parentsMapper.deleteParents(memberId);
	}

	@Override
	@Transactional
	public int joinParents(ParentsVO parentsVO) {
		 MyClassMemberVO vo = new MyClassMemberVO();
		 vo.setClassId(parentsVO.getClassId());
		 vo.setMemberId(parentsVO.getMemberId());
		
		int result = myClassMapper.insertClassMember(vo);
		 if (result > 0) {
			 parentsVO.setMemberNo(vo.getMemberNo());
			 parentsMapper.joinParents(parentsVO);
		 }
		return result;
	}

}
