package com.yedam.uriban.album.down.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.uriban.album.down.mapper.DownHistoryMapper;
import com.yedam.uriban.album.down.service.DownHistoryService;
import com.yedam.uriban.album.down.service.DownHistoryVO;

@Service
public class DownHistoryServiceImpl implements DownHistoryService {

	@Autowired
	DownHistoryMapper downHistoryMapper;
	
	@Override
	public List<DownHistoryVO> getHistoryList() {
		return downHistoryMapper.selectHistoryList();
	}

	@Override
	public DownHistoryVO getHistoryInfo(int downNo) {
		return downHistoryMapper.selectHistoryInfo(downNo);
	}

	@Override
	public int insertHistory(DownHistoryVO vo) {		
		int result = downHistoryMapper.insertHistory(vo);
		
		if(result == 1) {
			return Integer.valueOf(vo.getDownNo());
		}else {
			return -1;
		}
	}

}
