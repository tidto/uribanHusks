package com.yedam.uriban.member.mapper;

import java.util.List;
import java.util.Map;

import com.yedam.uriban.member.service.ReportVO;

public interface ReportMapper {
	// 신고내역 조회
	public List<ReportVO> getReportList();

	// 신고내역 상세조회
	public ReportVO getReportInfo(ReportVO reportVO);

	// 신고내역 생성
	public int insertReport(ReportVO reportVO);

	// 신고내역 수정
	public int updateReport(Map<String, Object> map);

	// 신고내역 삭제
	public int deleteReport(ReportVO reportVO);
}
