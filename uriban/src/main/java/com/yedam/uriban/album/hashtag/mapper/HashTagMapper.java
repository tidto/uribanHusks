package com.yedam.uriban.album.hashtag.mapper;

import java.util.List;

import com.yedam.uriban.album.hashtag.service.HashTagVO;

public interface HashTagMapper {
	
	public List<HashTagVO> selectHashTagList();
	
	public List<HashTagVO> selectHashTagAlbumList(int albumNo);
	
	public HashTagVO selectHashTagInfo(HashTagVO vo);

	public int insertHashTag(HashTagVO vo);

	public int deleteHashTag(int albumNo);
	
}
