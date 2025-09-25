package com.yedam.uriban.album.down.mapper;

import java.util.List;

import com.yedam.uriban.album.down.service.DownHistoryVO;

public interface DownHistoryMapper {
	public List<DownHistoryVO> selectHistoryList();
	
	public DownHistoryVO selectHistoryInfo(int downNo);
	
	public int insertHistory(DownHistoryVO vo);
}
