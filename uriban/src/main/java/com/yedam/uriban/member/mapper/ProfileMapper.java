package com.yedam.uriban.member.mapper;

import com.yedam.uriban.member.service.ProfileVO;

public interface ProfileMapper {
	
	// 프로필 파일 정보 등록
	public int insertProfile(ProfileVO profileVO);
	
}
