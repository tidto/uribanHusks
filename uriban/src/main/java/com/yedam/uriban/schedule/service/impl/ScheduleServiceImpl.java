package com.yedam.uriban.schedule.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.uriban.schedule.mapper.ScheduleMapper;
import com.yedam.uriban.schedule.service.CalendarVO;
import com.yedam.uriban.schedule.service.ScheduleService;
import com.yedam.uriban.schedule.service.ScheduleVO;
@Service
public class ScheduleServiceImpl implements ScheduleService {
	@Autowired
	ScheduleMapper scheduleMapper;
	
	@Override
	public List<ScheduleVO> getScheduleAll() {
		List<ScheduleVO> findList = scheduleMapper.selectScheduleList();
		return findList;
	}
	
	@Override
	public List<CalendarVO> getCalList(CalendarVO calendarVO) {
		return scheduleMapper.selectCalList(calendarVO);
	}

	@Override
	public ScheduleVO getSchedule(ScheduleVO scheduleVO) {
		return scheduleMapper.selectScheduleInfo(scheduleVO);
	}
	
	@Override
	public int getNewNo() {
		return scheduleMapper.getMaxNo() + 1;
	}
	
	@Override
	public int insertScheduleInfo(ScheduleVO scheduleVO) {
		int result = scheduleMapper.insertSchedule(scheduleVO);
		
		if (result == 1) {
			return Integer.valueOf(scheduleVO.getScheduleNo());
		} else {
			return -1;
		}
	}

	@Override
	public int updateScheduleInfo(ScheduleVO scheduleVO) {
		int result = scheduleMapper.updateSchedule(scheduleVO);
		
		if (result == 1) {
			return Integer.valueOf(scheduleVO.getScheduleNo());
		} else {
			return -1;
		}
	}

	@Override
	public int deleteScheduleInfo(int scheduleNo) {
		int result = scheduleMapper.deleteSchedule(scheduleNo);
		
		if (result == 1) {
			return scheduleNo;
		} else {
			return -1;
		}
	}

	@Override
	public CalendarVO getCalendarEvent(ScheduleVO scheduleVO) {
		return scheduleMapper.getCalendarEvent(scheduleVO);
	}
}