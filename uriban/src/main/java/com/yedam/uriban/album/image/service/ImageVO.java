package com.yedam.uriban.album.image.service;

import java.util.Date;

import lombok.Data;

@Data
public class ImageVO {
	private int imgNo;
	private int albumNo;
	private String originalFilename;
	private String renameFilename;
	private Date imgDate;
}
