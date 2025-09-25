package com.yedam.uriban.member.service;

import java.util.List;
import java.util.Map;

public interface ReportService {
	// 신고 내역 조회
	public List<ReportVO> getReportList();

	// 신고 상세 정보
	public ReportVO getReportInfo(ReportVO reportVO);

	// 신고 발생
	public int insertReport(ReportVO reportVO);
	
	// 신고 내역 수정
	public int updateReport(Map<String, Object> map);

	// 신고 내역 삭제
	//public int deleteReport(MemReportVO reportVO);
}
