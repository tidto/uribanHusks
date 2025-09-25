package com.yedam.uriban.album.comment.mapper;

import java.util.List;

import com.yedam.uriban.album.comment.service.AlbumCommentVO;

public interface AlbumCommentMapper {

	public List<AlbumCommentVO> selectCommentList();

	public List<AlbumCommentVO> selectCommentDetailList(AlbumCommentVO vo);
	
	public List<AlbumCommentVO> selectCommentAlbumList(int albumNo);

	public AlbumCommentVO selectCommentInfo(int replyNo);

	public int insertComment(AlbumCommentVO vo);

	public int updateComment(AlbumCommentVO vo);

	public int deleteComment(int replyNo);
	
	public int deletedetailComment(int replyNo);
	
	public int deleteAlbumComment(int albumNo);
}
