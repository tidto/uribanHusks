package com.yedam.uriban.mail.mapper;

import java.util.List;

import com.yedam.uriban.mail.service.MailReceiverVO;

public interface MailReceiverMapper {

	// 받은메일 select_List
	public List<MailReceiverVO> selectReceiveMailList(MailReceiverVO receiverVO);
	
	// 받은메일 개별 select_Info
	public MailReceiverVO selectReceiveMailInfo(MailReceiverVO receiverVO);
	
	// 내게 쓴 메일 select
	public List<MailReceiverVO> selectMailToMeList(MailReceiverVO requestVO);
	
	// 메일 보내기 - receiver안에 for로 적용 - mail컨트롤러에 전송
	public int insertReceiverInfo(MailReceiverVO receiverVO);
	
	// 받은 메일함에서 읽었을때 update 자동 실행 read_check -> 1
	public int updateReceiverInfo(int mailReNo);
	
	// 받은메일 삭제 mail_re_no
	public int deleteReceiverInfo(int mailReNo);
	
	// 받은메일 헤더 리스트 - 표기값
	public List<MailReceiverVO> selectHeaderList(MailReceiverVO receiverVO);
	
	// 받은메일 헤더 리스트 - 카운트
	public List<MailReceiverVO> selectHeaderCount(MailReceiverVO receiverVO);
	
}
