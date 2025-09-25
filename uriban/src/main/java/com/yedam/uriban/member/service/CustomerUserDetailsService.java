package com.yedam.uriban.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.yedam.uriban.member.mapper.MemberMapper;

@Service
public class CustomerUserDetailsService implements UserDetailsService {

	@Autowired
	MemberMapper memberMapper;

	@Override
	public UserDetails loadUserByUsername(String username) 
							throws UsernameNotFoundException {
		MemberVO memberVO = memberMapper.getUser(username);
		// 인증정보 리턴
		if (memberVO == null) {
			throw new UsernameNotFoundException("No User");
		}
		return memberVO;
	}

}
