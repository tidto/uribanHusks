package com.yedam.uriban.schedule.service;

import java.util.List;

public interface ScheduleService {
	
	// 전체조회
	public List<ScheduleVO> getScheduleAll();
	
	public List<CalendarVO> getCalList(CalendarVO calendarVO);
	
	// 단건조회
	public ScheduleVO getSchedule(ScheduleVO scheduleVO);	
	
	// 번호 + 1
	public int getNewNo();
	
	// 등록
	public int insertScheduleInfo(ScheduleVO scheduleVO);
		
	// 수정
	public int updateScheduleInfo(ScheduleVO scheduleVO);	
	
	// 삭제
	public int deleteScheduleInfo(int scheduleNo);

    CalendarVO getCalendarEvent(ScheduleVO scheduleVO);
}	
