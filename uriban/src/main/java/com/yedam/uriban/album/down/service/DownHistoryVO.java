package com.yedam.uriban.album.down.service;

import java.util.Date;

import lombok.Data;

@Data
public class DownHistoryVO {
	private int downNo;
	private int albumNo;
	private String userId;
	private String userIp;
	private Date downDate;
	private int downCnt;
}
