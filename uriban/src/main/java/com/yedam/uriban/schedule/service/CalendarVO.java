package com.yedam.uriban.schedule.service;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class CalendarVO {
	private String classId;
	private String id;
	private String title;
	private String category;
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date start;
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date end;
	private String calendarId;

	private Boolean attendees = false;
	private Boolean state = false;
	private Boolean isReadOnly = true;
	private Boolean location = false;

	private String body;
	private String authority;
}
