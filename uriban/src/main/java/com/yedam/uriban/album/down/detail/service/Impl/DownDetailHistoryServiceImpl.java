package com.yedam.uriban.album.down.detail.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.uriban.album.down.detail.mapper.DownDetailHistoryMapper;
import com.yedam.uriban.album.down.detail.service.DownDetailHistoryService;
import com.yedam.uriban.album.down.detail.service.DownDetailHistoryVO;

@Service
public class DownDetailHistoryServiceImpl implements DownDetailHistoryService {

	@Autowired
	DownDetailHistoryMapper downDetailHistoryMapper;
	
	@Override
	public List<DownDetailHistoryVO> getDownDetailHistoryList() {
		return downDetailHistoryMapper.selectDownDetailHistoryList();
	}

	@Override
	public DownDetailHistoryVO getDownDetailHistoryInfo(int downDetailNo) {
		return downDetailHistoryMapper.selectDownDetailHistoryInfo(downDetailNo);
	}

	@Override
	public List<DownDetailHistoryVO> getDownDetailHistoryInfoWithDownNo(int downNo) {
		return downDetailHistoryMapper.selectDownDetailHistoryInfoWithDownNo(downNo);
	}

	@Override
	public int insertDownDetailHistory(DownDetailHistoryVO vo) {		
		return downDetailHistoryMapper.insertDownDetailHistory(vo);
	}

}
