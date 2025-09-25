package com.yedam.uriban.schedule.mapper;


import java.util.List;

import com.yedam.uriban.schedule.service.CalendarVO;
import com.yedam.uriban.schedule.service.ScheduleVO;

public interface ScheduleMapper {
	// 전체 조회
	public List<ScheduleVO> selectScheduleList();

	public List<CalendarVO> selectCalList(CalendarVO calendarVO);

	// 단건 조회
	public ScheduleVO selectScheduleInfo(ScheduleVO scheduleVO);
	
	// 학사일정 번호
	public int getMaxNo();
	
	// 등록
	public int insertSchedule(ScheduleVO scheduleVO);
	
	// 수정
	public int updateSchedule(ScheduleVO scheduleVO);
	
	// 삭제
	public int deleteSchedule(int scheduleNo);

	// 캘린더용 단건 조회
	public CalendarVO getCalendarEvent(ScheduleVO scheduleVO);
}
