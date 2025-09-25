package com.yedam.uriban.album.like.service;

import java.util.List;

public interface LikeService {
	
	//전체조회
	public List<LikeVO> getLikeList(String memberId);
		
	//단건조회
	public LikeVO getLikeInfo(int likeNo);
	
	//등록
	public int insertLikeInfo(LikeVO likeVO);
	
	//삭제
	public int deleteLikeInfo(LikeVO likeVO);
}
