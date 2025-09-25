package com.yedam.uriban.notice.mapper;

import java.util.List;

import com.yedam.uriban.notice.service.NoticeTemplateVO;

public interface NoticeTemplateMapper {
	
	// ���â���� ����Ʈ ���
	public List<NoticeTemplateVO> selectNoticeTemplateList(String memberId);
	
	// 단건 
	public NoticeTemplateVO selectNoticeTemplateInfo(NoticeTemplateVO noticeTemplateVO);
	// üũ�ڽ� ���� �� �Է� �۵�
	public int insertNoticeTemplate(NoticeTemplateVO noticeTemplateVO);
	
	// 템플릿 적용시킨 insert
	public int updateNoticeTemplate(NoticeTemplateVO noticeTemplateVO);
	
	// ����Ʈ â���� x�� �ٷ� ���� ���۽�
	public int deleteNoticeTemplate(Integer templateNo);
	
}
