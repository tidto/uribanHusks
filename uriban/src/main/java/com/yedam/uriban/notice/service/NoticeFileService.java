package com.yedam.uriban.notice.service;

import java.util.List;
import java.util.Map;

public interface NoticeFileService {
		// ���� ÷�� ���� - �Խù� �� �ܰ� or �ٰ� ��ȸ -noticeNo
		public List<NoticeFileVO> getNoticeFileList(int noticeNo);

		// ���� ÷�� ���� - ���_notice �ۼ� �� ���� �ߵ�
		public  Map<String, Object> insertFileInfo(List<NoticeFileVO> list);
		
		//단건
		public NoticeFileVO getNoticeFileInfo(NoticeFileVO noticeFileVO);
		
//		// ���� ÷�� ���� - ����_notice ���� �� ���������� 
//		public int updateFile(NoticeFileVO noticeFileVO);
		
		// ���� ÷�� ���� - ����_notice ���� �� ���� ���� - fileNo
		public int deleteFile(int noticeNo);
}
