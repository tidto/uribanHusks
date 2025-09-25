package com.yedam.uriban.notice.service;

import java.util.List;

public interface NoticeTemplateService {
	
	// ���â���� ����Ʈ ���
	public List<NoticeTemplateVO> getNoticeTemplateList(String memberId);
	
	// 단건
	public NoticeTemplateVO getNoticeTemplateInfo(NoticeTemplateVO tempVO);
	
	// üũ�ڽ� ���� �� �Է� �۵�
	public int insertNoticeTemplate(NoticeTemplateVO tempVO);
	
	// 템플릿 적용시킨 insert
	public int updateNoticeTemplate(NoticeTemplateVO tempVO);
		
	// ����Ʈ â���� x�� �ٷ� ���� ���۽�
	public int deleteNoticeTemplate(Integer templateNo);
	
}
