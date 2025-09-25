package com.yedam.uriban.myclass.service.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yedam.uriban.member.service.MemberVO;
import com.yedam.uriban.myclass.mapper.MyClassMapper;
import com.yedam.uriban.myclass.service.MyClassMemberVO;
import com.yedam.uriban.myclass.service.MyClassService;
import com.yedam.uriban.myclass.service.MyClassVO;
import com.yedam.uriban.student.mapper.StudentMapper;

@Service
public class MyClassServiceImpl implements MyClassService {

	@Autowired
	MyClassMapper myClassMapper;
	
	@Autowired
	StudentMapper studentMapper; 

	@Override
	public List<MyClassVO> getMyClassList() {
		List<MyClassVO> classList = myClassMapper.getMyClassList();
		return classList;
	}
	
	@Override
	public List<Map<String,Object>> getMyClass(MemberVO memberVO) {
		List<Map<String,Object>> list = myClassMapper.getMyClass(memberVO);
		return list;
	}
	
	/*
	 * @Override public List<MyClassVO> getPrMyClass(String memId) { List<MyClassVO>
	 * List = myClassMapper.getMyClass(memId); return List; }
	 */

	@Override
	public MyClassVO getMyClassInfo(MyClassVO myClassVO) {
		return myClassMapper.getMyClassInfo(myClassVO);
	}

	@Transactional
	@Override
	public int insertMyClass(MyClassVO myClassVO) {
		
		int result = myClassMapper.insertMyClass(myClassVO);
		if (result > 0) {
			 MyClassMemberVO vo = new MyClassMemberVO();
			 vo.setClassId(myClassVO.getClassId());
			 vo.setMemberId(myClassVO.getMemberId());
			myClassMapper.insertClassMember(vo);
		 }
		return result;
	}

	@Override
	public Map<String, String> updateMyClass(MyClassVO myClassVO) {
		Map<String, String> map = new HashMap<>();

		int result = myClassMapper.updateMyClass(myClassVO);
		if (result == 1) {
			map.put("결과", "Success");
		} else {
			map.put("결과", "Fail");
		}
		return map;
	}

	@Override
	public int deleteMyClass(MyClassVO myClassVO) {
		return myClassMapper.deleteMyClass(myClassVO) == 1 ? 1 : -1;
	}
}
