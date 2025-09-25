package com.yedam.uriban.album.hashtag.service.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.uriban.album.hashtag.mapper.HashTagMapper;
import com.yedam.uriban.album.hashtag.service.HashTagService;
import com.yedam.uriban.album.hashtag.service.HashTagVO;

@Service
public class HashTagServiceImpl implements HashTagService {

	@Autowired
	HashTagMapper hashTagMapper;
	
	@Override
	public List<HashTagVO> getHashTagList() {
		return hashTagMapper.selectHashTagList();
	}

	@Override
	public HashTagVO getHashTagInfo(HashTagVO vo) {
		return hashTagMapper.selectHashTagInfo(vo);
	}

	@Override
	public Map<String,Object> insertHashTag(List<HashTagVO> list) {
		
		boolean isSuccessed = false;
		int cnt = 0;
		
		for(HashTagVO vo : list) {
			int result = hashTagMapper.insertHashTag(vo);
			
			if(result == 1) {
				cnt += 1;
			}
		}
		
		if(cnt > 0)
			isSuccessed = true;
		
		Map<String, Object> map = new HashMap<>();
		map.put("result", isSuccessed);
		
		return map;
	}

	@Override
	public int deleteHashTag(int albumNo) {
		int result = hashTagMapper.deleteHashTag(albumNo);
		
		if(result == 1) {
			return albumNo;
		}else {
			return -1;
		}
	}

	@Override
	public List<HashTagVO> getHashTagAlbumList(int albumNo) {
		return hashTagMapper.selectHashTagAlbumList(albumNo);
	}

}
