package com.yedam.uriban.member.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.uriban.member.mapper.BanMapper;
import com.yedam.uriban.member.mapper.MemberMapper;
import com.yedam.uriban.member.service.BanService;
import com.yedam.uriban.member.service.BanVO;
import com.yedam.uriban.member.service.MemberVO;

@Service
public class BanServiceImpl implements BanService {
	
	@Autowired
	BanMapper banMapper;
	
	@Autowired
	MemberMapper memberMapper;
	
	@Override
	public List<BanVO> getBanList() {
		
		return banMapper.getBanList();
	}

	@Override
	public int insertBan(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	@Override
	public void endBanMember() {
		List<BanVO>banList = banMapper.endBanMember();
		if(!banList.isEmpty()) {
			for (BanVO banVO : banList) {
				MemberVO memberVO = new MemberVO();
				memberVO.setMemberId(banVO.getMemberId());
				memberVO.setMemberState("A501");
				memberMapper.updateMemberInfo(memberVO);
			}
		}
	}
}
