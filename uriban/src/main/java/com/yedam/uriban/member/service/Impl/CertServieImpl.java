package com.yedam.uriban.member.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yedam.uriban.member.mapper.CertMapper;
import com.yedam.uriban.member.mapper.MemberMapper;
import com.yedam.uriban.member.service.CertService;
import com.yedam.uriban.member.service.CertVO;
import com.yedam.uriban.member.service.MemberVO;

@Service
public class CertServieImpl implements CertService {

	@Autowired
	CertMapper certMapper;

	@Autowired
	MemberMapper memberMapper;

	// 신청 내역 조회
	@Override
	public List<CertVO> getCertList() {

		return certMapper.certList();
	}

	// 교원자격 신청이력 상세조회
	@Override
	public CertVO certInfo(CertVO vo) {

		return certMapper.certInfo(vo);
	}

	// 교원 자격 수정
	@Transactional
	@Override
	public int certUpdate(CertVO certVO) {
		String stat = certVO.getCertStat();

		// 신청 승인시 멤버 권한을 교사로 수정
		if (stat.equals("A702")) {
			MemberVO memberVO = new MemberVO();
			memberVO.setMemberId(certVO.getMemberId());
			memberMapper.updateMemberAuth(memberVO);
			
		}

		int result = certMapper.certUpdate(certVO);
		return result;
	}

}
