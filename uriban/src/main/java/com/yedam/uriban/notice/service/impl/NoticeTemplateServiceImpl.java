package com.yedam.uriban.notice.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.uriban.notice.mapper.NoticeTemplateMapper;
import com.yedam.uriban.notice.service.NoticeFileVO;
import com.yedam.uriban.notice.service.NoticeTemplateService;
import com.yedam.uriban.notice.service.NoticeTemplateVO;

@Service
public class NoticeTemplateServiceImpl implements NoticeTemplateService{
	
	@Autowired
	NoticeTemplateMapper noticeTemplateMapper;

	@Override
	public List<NoticeTemplateVO> getNoticeTemplateList(String memberId) {
		return noticeTemplateMapper.selectNoticeTemplateList(memberId);
	}

	@Override
	public NoticeTemplateVO getNoticeTemplateInfo(NoticeTemplateVO tempVO) {
		return noticeTemplateMapper.selectNoticeTemplateInfo(tempVO);
	}

	@Override
	public int insertNoticeTemplate(NoticeTemplateVO tempVO) {
		return noticeTemplateMapper.insertNoticeTemplate(tempVO);
	}

	@Override
	public int updateNoticeTemplate(NoticeTemplateVO tempVO) {
		return noticeTemplateMapper.updateNoticeTemplate(tempVO);
	}
	
	@Override
	public int deleteNoticeTemplate(Integer templateNo) {
		return noticeTemplateMapper.deleteNoticeTemplate(templateNo);
	}
	
	
}
