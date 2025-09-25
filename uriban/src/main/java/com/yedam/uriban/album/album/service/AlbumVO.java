package com.yedam.uriban.album.album.service;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class AlbumVO {
	private int albumNo;
	private int classId;
	private String content;
	private String place;
	private Date albumDate;
	private int likeCount;
	private String tags;
	private MultipartFile[] images;
	private String memberId;
	private int month;
	private String tag;
}
