package com.yedam.uriban.notice.mapper;

import java.util.List;

import com.yedam.uriban.notice.service.NoticeVO;

public interface NoticeMapper {
	
	// 전체리스트 F401
	public List<NoticeVO> selectF401NoticeList(NoticeVO noticeVO);
	
	// 전체리스트 F402
	public List<NoticeVO> selectF402NoticeList(NoticeVO noticeVO);
	
	// 단던
	public NoticeVO selectNoticeInfo(NoticeVO noticeVO);
	
	// 등록 - 템플릿 등록 선택 동행
	public int insertNotice(NoticeVO noticeVO);
	
	// 업데이트
	public int updateNotice(NoticeVO noticeVO);
	
	// 삭제 - noticeNo기준으로 파일 삭제
	public int deleteNotice(int noticeNo);
	

	// 알림장 매주 목요일 삭제 스케줄
	public void deleteF402();
	
	// main
	public List<NoticeVO> selectNoticeListMain(NoticeVO noticeVO);

}
