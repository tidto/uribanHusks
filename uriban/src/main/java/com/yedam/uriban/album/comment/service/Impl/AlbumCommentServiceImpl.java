package com.yedam.uriban.album.comment.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.uriban.album.comment.mapper.AlbumCommentMapper;
import com.yedam.uriban.album.comment.service.AlbumCommentService;
import com.yedam.uriban.album.comment.service.AlbumCommentVO;

@Service
public class AlbumCommentServiceImpl implements AlbumCommentService {

	@Autowired
	AlbumCommentMapper albumCommentMapper;
	
	@Override
	public List<AlbumCommentVO> getCommentList() {
		return albumCommentMapper.selectCommentList();
	}

	@Override
	public List<AlbumCommentVO> getCommentAlbumList(int albumNo) {
		return albumCommentMapper.selectCommentAlbumList(albumNo);
	}

	@Override
	public List<AlbumCommentVO> getCommentDetailList(AlbumCommentVO vo) {
		return albumCommentMapper.selectCommentDetailList(vo);
	}
	
	@Override
	public int insertComment(AlbumCommentVO vo) {
		int result = albumCommentMapper.insertComment(vo);
		
		if(result == 1) {
			return Integer.valueOf(vo.getReplyNo());
		}else {
			return -1;
		}
	}

	@Override
	public int updateComment(AlbumCommentVO vo) {
		int result = albumCommentMapper.updateComment(vo);
		
		if(result == 1) {
			return Integer.valueOf(vo.getReplyNo());
		}else {
			return -1;
		}
	}

	@Override
	public int deleteComment(int replyNo) {
		int result = albumCommentMapper.deleteComment(replyNo);
		
		if(result == 1) {
			return replyNo;
		}else {
			return -1;
		}
	}

	@Override
	public AlbumCommentVO getCommentInfo(int replyNo) {
		return albumCommentMapper.selectCommentInfo(replyNo);
	}

	@Override
	public int deletedetailComment(int replyNo) {
		return albumCommentMapper.deletedetailComment(replyNo);
	}

	@Override
	public int deleteAlbumComment(int albumNo) {
		return albumCommentMapper.deleteAlbumComment(albumNo);
	}

}
