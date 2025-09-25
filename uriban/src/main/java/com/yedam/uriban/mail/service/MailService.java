package com.yedam.uriban.mail.service;

import java.util.List;

public interface MailService {
	
	// 보낸메일 select_List
	public List<MailVO> getMailList(MailVO mailVO);
	
	// 보낸메일 개별 select_Info
	public MailVO getMailInfo(MailVO mailVO);
	
	// 메일 보내기
	public int insertMail(MailVO mailVO);
	
	// XX 보낸메일 삭제 delete
	public int deleteMail(int mailNo);
}
