package com.yedam.uriban.notice.mapper;

import java.util.List;

import com.yedam.uriban.notice.service.NoticeFileVO;

public interface NoticeFileMapper {
	
	// ���� ÷�� ���� - �Խù� �� �ܰ� or �ٰ� ��ȸ -noticeNo
	public List<NoticeFileVO> selectNoticeFile(int noticeNo);

	// ���� ÷�� ���� - ���_notice �ۼ� �� ���� �ߵ�
	public int insertNoticeFile(NoticeFileVO noticeFileVO);
	
	//단건조회
	public NoticeFileVO selectNoticeFileInfo(NoticeFileVO noticeFileVO);
	
	// ���� ÷�� ���� - ����_notice ���� �� ���������� 
//	public int updateNoticeFile(NoticeFileVO noticeFileVO);
	
	// ���� ÷�� ���� - ����_notice ���� �� ���� ���� - 
	public int deleteNoticeFile(int noticeNo);
	
}
