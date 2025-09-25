package com.yedam.uriban.album.hashtag.service;

import java.util.List;
import java.util.Map;

public interface HashTagService {

	public List<HashTagVO> getHashTagList();
	
	public List<HashTagVO> getHashTagAlbumList(int albumNo);
	
	public HashTagVO getHashTagInfo(HashTagVO vo);
	
	public Map<String,Object> insertHashTag(List<HashTagVO> list);
	
	public int deleteHashTag(int albumNo);
	
}
