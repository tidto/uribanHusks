package com.yedam.uriban.album.comment.service;

import java.util.List;

public interface AlbumCommentService {

	public List<AlbumCommentVO> getCommentList();
	
	public List<AlbumCommentVO> getCommentDetailList(AlbumCommentVO vo);

	public List<AlbumCommentVO> getCommentAlbumList(int albumNo);

	public AlbumCommentVO getCommentInfo(int replyNo);

	public int insertComment(AlbumCommentVO vo);

	public int updateComment(AlbumCommentVO vo);

	public int deleteComment(int replyNo);
	
	public int deletedetailComment(int replyNo);
	
	public int deleteAlbumComment(int albumNo);
}
