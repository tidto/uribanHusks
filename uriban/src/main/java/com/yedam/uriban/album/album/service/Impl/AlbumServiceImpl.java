package com.yedam.uriban.album.album.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.yedam.uriban.album.album.mapper.AlbumMapper;
import com.yedam.uriban.album.album.service.AlbumService;
import com.yedam.uriban.album.album.service.AlbumVO;
import com.yedam.uriban.album.comment.mapper.AlbumCommentMapper;
import com.yedam.uriban.album.hashtag.mapper.HashTagMapper;
import com.yedam.uriban.album.hashtag.service.HashTagVO;
import com.yedam.uriban.album.image.mapper.ImageMapper;
import com.yedam.uriban.album.image.service.ImageVO;
import com.yedam.uriban.album.like.mapper.LikeMapper;
import com.yedam.uriban.album.like.service.LikeVO;
import com.yedam.uriban.album.upload.service.UploadService;

@Service
public class AlbumServiceImpl implements AlbumService {

	@Autowired
	AlbumMapper albumMapper;
	@Autowired
	HashTagMapper hashTagMapper;
	@Autowired
	ImageMapper imageMapper;
	@Autowired
	UploadService uploadService;
	@Autowired
	LikeMapper likeMapper;
	@Autowired
	AlbumCommentMapper albumCommentMapper;
	
	@Override
	public List<AlbumVO> getAlbumList(AlbumVO vo) {
		return albumMapper.selectAlbumList(vo);
	}

	@Override
	public List<AlbumVO> getAlbumLike(AlbumVO vo) {
		return albumMapper.selectAlbumLike(vo);
	}

	@Override
	public List<AlbumVO> getAlbumMonth(AlbumVO vo) {
		return albumMapper.selectAlbumMonth(vo);
	}
	
	@Override
	public List<AlbumVO> getAlbumTag(AlbumVO vo) {
		return albumMapper.selectAlbumTag(vo);
	}
	
	@Override
	public AlbumVO getAlbumInfo(AlbumVO vo) {
		return albumMapper.selectAlbumInfo(vo);
	}

	@Override
	@Transactional(rollbackFor = {Exception.class}, propagation = Propagation.REQUIRED)
	public int insertAlbumInfo(AlbumVO albumVO) throws Exception {
		int result = albumMapper.insertAlbum(albumVO);
		
		//해쉬테그 등록
		String fulltag = albumVO.getTags();
		String[] tags = fulltag.split("#");
		
		for(String tag : tags) {
			if(!tag.isEmpty()) {
				HashTagVO hashtagVO = new HashTagVO();
				hashtagVO.setAlbumNo(albumVO.getAlbumNo());
				hashtagVO.setTag(tag);
				hashTagMapper.insertHashTag(hashtagVO);
			}
		}
		
		if(uploadService.uploadImage(albumVO.getImages()) == null) {
			throw new Exception();
		}
		
		List<Map<String, Object>> imageInfos = uploadService.uploadImage(albumVO.getImages());	
		
		if(imageInfos.size()>0) {
			for(Map<String, Object> imageInfo : imageInfos) {
				ImageVO imgVO = new ImageVO();
				imgVO.setAlbumNo(albumVO.getAlbumNo());
				imgVO.setOriginalFilename(imageInfo.get("origin").toString());
				imgVO.setRenameFilename(imageInfo.get("rename").toString());
				imageMapper.insertImage(imgVO);
			}		
		}
		
		if(result ==1) {
			return Integer.valueOf(albumVO.getAlbumNo());
		}else {
			return -1;
		}
	}

	@Override
	@Transactional(rollbackFor = {Exception.class}, propagation = Propagation.REQUIRED)
	public int updateAlbumInfo(AlbumVO albumVO) throws Exception {
		int result = albumMapper.updateAlbum(albumVO);
		

		hashTagMapper.deleteHashTag(albumVO.getAlbumNo());
		
		String fulltag = albumVO.getTags();
		String[] tags = fulltag.split("#");
		
		for(String tag : tags) {
			if(!tag.isEmpty()) {
				HashTagVO hashtagVO = new HashTagVO();
				hashtagVO.setAlbumNo(albumVO.getAlbumNo());
				hashtagVO.setTag(tag);
				hashTagMapper.insertHashTag(hashtagVO);
			}
		}
		
		List<Map<String, Object>> imageInfos = uploadService.uploadImage(albumVO.getImages());	
		
		if(uploadService.uploadImage(albumVO.getImages()) == null) {
			throw new Exception();
		}
		
		if(imageInfos.size()>0) {
			imageMapper.deleteImage(albumVO.getAlbumNo());
					
			for(Map<String, Object> imageInfo : imageInfos) {
				ImageVO imgVO = new ImageVO();
				imgVO.setAlbumNo(albumVO.getAlbumNo());
				imgVO.setOriginalFilename(imageInfo.get("origin").toString());
				imgVO.setRenameFilename(imageInfo.get("rename").toString());
				imageMapper.insertImage(imgVO);
			}				
		}
		
		if(result ==1) {
			return Integer.valueOf(albumVO.getAlbumNo());
		}else {
			return -1;
		}
	}

	@Override
	public int deleteAlbumInfo(int albumNo) {
		int result = albumMapper.deleteAlbum(albumNo);
		
		hashTagMapper.deleteHashTag(albumNo);
		imageMapper.deleteImage(albumNo);
		LikeVO likeVO = new LikeVO();
		likeVO.setAlbumNo(albumNo);
		likeMapper.deleteLike(likeVO);
		albumCommentMapper.deleteAlbumComment(albumNo);
		
		if(result ==1) {
			return albumNo;
		}else {
			return -1;
		}
	}

	@Override
	public int getNextAlbumNo() {
		return albumMapper.getNextAlbumNo();
	}

	@Override
	public int addLikeCnt(int albumNo) {
		return albumMapper.addLikeCnt(albumNo);
	}

	@Override
	public int minusLikeCnt(int albumNo) {
		return albumMapper.minusLikeCnt(albumNo);
	}

}
