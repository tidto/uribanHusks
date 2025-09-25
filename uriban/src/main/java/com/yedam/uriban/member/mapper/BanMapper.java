package com.yedam.uriban.member.mapper;

import java.util.List;
import java.util.Map;

import com.yedam.uriban.member.service.BanVO;

public interface BanMapper {
	// 제한 이력 조회
	public List<BanVO> getBanList();
	
	// 멤버 기능 제한
	public int insertBan(Map<String, Object> map);
	
	// 제한 끝
	public List<BanVO> endBanMember();
}
