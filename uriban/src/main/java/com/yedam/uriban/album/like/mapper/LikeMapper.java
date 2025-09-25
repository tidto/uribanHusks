package com.yedam.uriban.album.like.mapper;

import java.util.List;

import com.yedam.uriban.album.like.service.LikeVO;

public interface LikeMapper {
	
	//전체조회
	public List<LikeVO> selectLikeList(String memberId);
	
	//단건조회
	public LikeVO selectLikeInfo(int likeNo);
	
	//등록
	public int insertLike(LikeVO vo);
	
	//수정
	
	//삭제
	public int deleteLike(LikeVO vo);
}
