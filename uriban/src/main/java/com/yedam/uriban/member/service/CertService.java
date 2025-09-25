package com.yedam.uriban.member.service;

import java.util.List;

public interface CertService {
	// 교원자격 신청이력 조회
	public List<CertVO> getCertList();

	// 교원자격 신청이력 상세조회
	public CertVO certInfo(CertVO vo);
	
	// 교원자격 수정
	public int certUpdate(CertVO certVO);
	
}
