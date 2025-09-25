package com.yedam.uriban.notice.service;

import java.util.List;

public interface NoticeService {

	// 전체리스트 F401
	public List<NoticeVO> getNoticeF401List(NoticeVO noticeVO);
	
	// 전체리스트 F402
	public List<NoticeVO> getNoticeF402List(NoticeVO noticeVO);
	
	// 단건
	public NoticeVO getNoticeInfo(NoticeVO noticeVO);
	
	// 등록 - 템플릿 등록 선택 동행
	public int insertNoticeInfo(NoticeVO noticeVO);
	
	// 수정 - 템플릿 등록 선택 동행
	public int updateNoticeInfo(NoticeVO noticeVO);
	
	// 삭제 - noticeNo기준으로 파일 삭제
	public int deleteNoticeInfo(int noticeNo);

	// 알림장 매주 목요일 삭제 스케줄
	public void deleteF402Info();
	
	// main
	public List<NoticeVO> getNoticeListMain(NoticeVO noticeVO);

}
