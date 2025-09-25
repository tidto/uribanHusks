package com.yedam.uriban.schedule.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ScheduleVO {
	private Integer scheduleNo;
	private String classId;
	private Integer noticeNo;
	private String scheduleWriter;
	private String scheduleCategory;
	private String scheduleTitle;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date startDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date endDate;

	private String noticeTitle;
}
