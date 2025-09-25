package com.yedam.uriban.album.down.detail.mapper;

import java.util.List;

import com.yedam.uriban.album.down.detail.service.DownDetailHistoryVO;

public interface DownDetailHistoryMapper {

	public List<DownDetailHistoryVO> selectDownDetailHistoryList();
	
	public DownDetailHistoryVO selectDownDetailHistoryInfo(int downDetailNo);
	
	public List<DownDetailHistoryVO> selectDownDetailHistoryInfoWithDownNo(int downNo);
	
	public int insertDownDetailHistory(DownDetailHistoryVO vo);
	
}
