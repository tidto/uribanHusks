package com.yedam.uriban.mail.mapper;

import java.util.List;

import com.yedam.uriban.mail.service.MailVO;

public interface MailMapper {
	
	// 보낸메일 select_List
	public List<MailVO> selectMailList(MailVO mailVO);
	
	// 보낸메일 개별 select_Info
	public MailVO selectMailInfo(MailVO mailVO);
	
	// 메일 보내기
	public int insertMailInfo(MailVO mailVO);
	
	// XX보낸메일 삭제 delete
	public int deleteMailInfo(int mailNo);
}
