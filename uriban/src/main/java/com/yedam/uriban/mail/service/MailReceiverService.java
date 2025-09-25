package com.yedam.uriban.mail.service;

import java.util.List;

public interface MailReceiverService{
	
	// 받은메일 select_List
	public List<MailReceiverVO> getReceiveMailList(MailReceiverVO receiverVO);
	
	// 받은메일 개별 select_Info
	public MailReceiverVO getReceiveMailInfo(MailReceiverVO receiverVO);
	
	// 내게 쓴 메일 select
	public List<MailReceiverVO> getMailToMeList(MailReceiverVO requestVO);
	
	// 메일 보내기 - receiver안에 for로 적용 - mail컨트롤러에 전송
	public List<String> insertReceiver(List<MailReceiverVO> receiveVO);
		
	// 받은 메일함에서 읽었을때 update 자동 실행 read_check -> 1
	public int updateReceiver(int mailReNo);
	
	// 받은메일 삭제 mail_re_no
	public int deleteReciever(int mailReNo);

	// 받은메일 헤더 리스트 - 표기값
	public List<MailReceiverVO> getHeaderList(MailReceiverVO receiverVO);
	
	// 받은메일 헤더 리스트 - 카운트
	public List<MailReceiverVO> getHeaderCount(MailReceiverVO receiverVO);

}
