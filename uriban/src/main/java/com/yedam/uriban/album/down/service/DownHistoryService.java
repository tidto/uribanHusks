package com.yedam.uriban.album.down.service;

import java.util.List;

public interface DownHistoryService {
	public List<DownHistoryVO> getHistoryList();
	
	public DownHistoryVO getHistoryInfo(int downNo);
	
	public int insertHistory(DownHistoryVO vo);
	
}
