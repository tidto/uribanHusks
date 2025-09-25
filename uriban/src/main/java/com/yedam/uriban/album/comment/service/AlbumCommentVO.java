package com.yedam.uriban.album.comment.service;

import java.util.Date;

import lombok.Data;

@Data
public class AlbumCommentVO {
	private int replyNo;
	private int albumNo;
	private String content;
	private int parentReplyNo;
	private String userName;
	private Date replyDate;
	private String replyState;
}
