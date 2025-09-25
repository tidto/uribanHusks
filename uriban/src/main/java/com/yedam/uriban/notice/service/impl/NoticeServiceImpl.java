package com.yedam.uriban.notice.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.uriban.notice.mapper.NoticeFileMapper;
import com.yedam.uriban.notice.mapper.NoticeMapper;
import com.yedam.uriban.notice.service.NoticeFileVO;
import com.yedam.uriban.notice.service.NoticeService;
import com.yedam.uriban.notice.service.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	NoticeMapper noticeMapper;
	
	@Autowired
	NoticeFileMapper noticeFileMapper;
	
	
	@Override
	public List<NoticeVO> getNoticeF401List(NoticeVO noticeVO) {
		List<NoticeVO> list = noticeMapper.selectF401NoticeList(noticeVO);
		
		for(NoticeVO vo : list) {
			int noticeNo = vo.getNoticeNo();
			List<NoticeFileVO> file = noticeFileMapper.selectNoticeFile(noticeNo);
			vo.setNoticeFile(file);
		}
		return list;
	}

	@Override
	public List<NoticeVO> getNoticeF402List(NoticeVO noticeVO) {
		List<NoticeVO> list = noticeMapper.selectF402NoticeList(noticeVO);
		
		for(NoticeVO vo : list) {
			int noticeNo = vo.getNoticeNo();
			List<NoticeFileVO> file = noticeFileMapper.selectNoticeFile(noticeNo);
			vo.setNoticeFile(file);
		}
		return list;
	}

	@Override
	public NoticeVO getNoticeInfo(NoticeVO noticeVO) {
		return noticeMapper.selectNoticeInfo(noticeVO);
	}

	@Override
	public int insertNoticeInfo(NoticeVO noticeVO) {
		return noticeMapper.insertNotice(noticeVO) == 1 ? noticeVO.getNoticeNo() : -1;
	}

	@Override
	public int updateNoticeInfo(NoticeVO noticeVO) {
		return noticeMapper.updateNotice(noticeVO) == 1 ? noticeVO.getNoticeNo() : -1;
	}

	@Override
	public int deleteNoticeInfo(int noticeNo) {
		// 공지삭제
		int result = noticeMapper.deleteNotice(noticeNo) == 1 ? noticeNo : -1;
		 
//		// 파일삭제 동행
//		NoticeFileVO vo = new NoticeFileVO();
//		vo.setNoticeNo(noticeNo);
//		 
//		noticeFileMapper.deleteNoticeFile(noticeNo);
		 
		return result;
	}

	@Override

	public void deleteF402Info() {
		noticeMapper.deleteF402();
	}

	@Override
	public List<NoticeVO> getNoticeListMain(NoticeVO noticeVO) {
		return noticeMapper.selectNoticeListMain(noticeVO);
	}
	
	
}
