package com.yedam.uriban.member.service;

import java.util.List;
import java.util.Map;

public interface BanService {
	// 제한 이력 조회
	public List<BanVO> getBanList();
	
	public int insertBan(Map<String, Object> map);
	public void endBanMember();
}
