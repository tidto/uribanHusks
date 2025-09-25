package com.yedam.uriban.album.like.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.uriban.album.like.mapper.LikeMapper;
import com.yedam.uriban.album.like.service.LikeService;
import com.yedam.uriban.album.like.service.LikeVO;

@Service
public class LikeServiceImpl implements LikeService {

	@Autowired
	LikeMapper likeMapper;
	
	@Override
	public List<LikeVO> getLikeList(String memberId) {
		return likeMapper.selectLikeList(memberId);
	}

	@Override
	public LikeVO getLikeInfo(int likeNo) {
		return likeMapper.selectLikeInfo(likeNo);
	}

	@Override
	public int insertLikeInfo(LikeVO likeVO) {
		int result = likeMapper.insertLike(likeVO);
		
		if(result == 1) {
			return Integer.valueOf(likeVO.getLikeNo());
		}else {
			return -1;
		}
	}

	@Override
	public int deleteLikeInfo(LikeVO likeVO) {
		int result = likeMapper.deleteLike(likeVO);
		
		if(result == 1) {
			return 1;
		}else {
			return -1;
		}
	}

}
