package com.yedam.uriban.member.mapper;

import java.util.List;

import com.yedam.uriban.member.service.CertVO;

public interface CertMapper {

	// 신청 내역 조회
	public List<CertVO> certList();

	// 신청 상세 조회
	public CertVO certInfo(CertVO vo);

	// 교원 자격 신청
	public int certInsert(CertVO vo);
	
	// 교원 자격 수정
	public int certUpdate(CertVO certVO);

}
