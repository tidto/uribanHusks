package com.yedam.uriban.ban.member.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.uriban.ban.member.mapper.ClassMemberMapper;
import com.yedam.uriban.ban.member.service.ClassMemberService;
import com.yedam.uriban.ban.member.service.ClassMemberVO;

@Service
public class ClassMemberServiceImpl implements ClassMemberService{
	
	@Autowired
	ClassMemberMapper mapper;

	@Override
	public List<ClassMemberVO> getIdList(ClassMemberVO memberVO) {
		List<ClassMemberVO> list = mapper.selectIdList(memberVO);
		return list;
	}
}
