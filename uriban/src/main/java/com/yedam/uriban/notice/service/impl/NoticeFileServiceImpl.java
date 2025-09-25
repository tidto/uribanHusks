package com.yedam.uriban.notice.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.uriban.notice.mapper.NoticeFileMapper;
import com.yedam.uriban.notice.service.NoticeFileService;
import com.yedam.uriban.notice.service.NoticeFileVO;

@Service
public class NoticeFileServiceImpl implements NoticeFileService {
	
	@Autowired
	NoticeFileMapper noticeFileMapper;

	@Override
	public List<NoticeFileVO> getNoticeFileList(int noticeNo) {
		return noticeFileMapper.selectNoticeFile(noticeNo);
	}

	@Override
	public NoticeFileVO getNoticeFileInfo(NoticeFileVO noticeFileVO) {
		return noticeFileMapper.selectNoticeFileInfo(noticeFileVO);
	}
	
	@Override
	public Map<String, Object> insertFileInfo(List<NoticeFileVO> list) {
		boolean isSuccessed = false;
		int cnt = 0;
		
		for(NoticeFileVO vo : list) {
			int result = noticeFileMapper.insertNoticeFile(vo);
			
			if(result == 1) {
				cnt += 1;
			}
		}
		
		if(cnt > 0)
			isSuccessed = true;
		
		Map<String, Object> map = new HashMap<>();
		map.put("result", isSuccessed);
			
		return map;
	}

	@Override
	public int deleteFile(int noticeNo) {
		return noticeFileMapper.deleteNoticeFile(noticeNo) == 1 ? noticeNo : -1;
	}
	
	
}
