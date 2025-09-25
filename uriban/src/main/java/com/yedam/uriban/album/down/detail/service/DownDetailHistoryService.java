package com.yedam.uriban.album.down.detail.service;

import java.util.List;

public interface DownDetailHistoryService {
	public List<DownDetailHistoryVO> getDownDetailHistoryList();
	
	public DownDetailHistoryVO getDownDetailHistoryInfo(int downDetailNo);
	
	public List<DownDetailHistoryVO> getDownDetailHistoryInfoWithDownNo(int downNo);
	
	public int insertDownDetailHistory(DownDetailHistoryVO vo);
}
