package com.yedam.uriban.member.service.Impl;


import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yedam.uriban.album.comment.mapper.AlbumCommentMapper;
import com.yedam.uriban.album.comment.service.AlbumCommentVO;
import com.yedam.uriban.member.mapper.BanMapper;
import com.yedam.uriban.member.mapper.ReportMapper;
import com.yedam.uriban.member.mapper.MemberMapper;
import com.yedam.uriban.member.service.ReportService;
import com.yedam.uriban.member.service.ReportVO;
import com.yedam.uriban.member.service.MemberVO;

@Service
public class ReportServiceImpl implements ReportService {

	@Autowired
	ReportMapper reportMapper;
	@Autowired
	BanMapper banMapper;
	@Autowired
	MemberMapper mapper;
	@Autowired
	AlbumCommentMapper commentMapper;

	// 신고내역 조회
	@Override
	public List<ReportVO> getReportList() {

		return reportMapper.getReportList();
	}

	// 신고내역 상세조회
	@Override
	public ReportVO getReportInfo(ReportVO reportVO) {

		return reportMapper.getReportInfo(reportVO);
	}

	// 신고내역 생성
	@Override
	public int insertReport(ReportVO reportVO) {
		return reportMapper.insertReport(reportVO) == 1 ? 1 : -1; // 회원 권한 수정 성공시 1반환 아니면 -1 반환
	}

	// 신고상태 변경
	@Transactional
	@Override
	public int updateReport(Map<String, Object> map) {
		
		try {
			String state = (String) map.get("reportState");
			String memberId = (String) map.get("memberId");
			String banType = (String) map.get("banType");
			MemberVO vo = new MemberVO();
			
			// 신고 상태 변경 - 승인 or 반려
			int result = reportMapper.updateReport(map) == 1 ? 1 : -1;
			
			// 유저 제한
			if (result == 1 && state.equals("A602")) {
				int cttNo = (int) map.get("contentsNo");
				
				// 제한유형 구분 - 댓글제한 or 메일제한
				if (banType.equals("A401")) {
					
					// 댓글 제한
					vo.setMemberState("A502");
					AlbumCommentVO cmtVO = new AlbumCommentVO();
	
					cmtVO.setReplyNo(cttNo);
					cmtVO.setReplyState("B203");
					commentMapper.updateComment(cmtVO);
				}else {
					
					// 메일 제한
					vo.setMemberState("A503");
				}
				vo.setMemberId(memberId);
				
				// 멤버 제한 횟수 증가 제한상태 변경
				mapper.updateMemBan(vo);
				map.put("banCount", vo.getBanCount());
				// 제한 이력 추가
				banMapper.insertBan(map);
			}
			return result;
		} catch (Exception e) {
            throw new RuntimeException("에러 발생!!!!!!!!!!!!!!!!!!!!", e);
        }
	}

}
