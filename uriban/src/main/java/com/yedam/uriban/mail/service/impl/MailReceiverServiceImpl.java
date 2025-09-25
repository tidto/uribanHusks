package com.yedam.uriban.mail.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.uriban.mail.mapper.MailReceiverMapper;
import com.yedam.uriban.mail.service.MailReceiverService;
import com.yedam.uriban.mail.service.MailReceiverVO;

@Service
public class MailReceiverServiceImpl implements MailReceiverService{

	@Autowired
	MailReceiverMapper receiverMapper;
	
	// 받은메일 List
	@Override
	public List<MailReceiverVO> getReceiveMailList(MailReceiverVO receiverVO) {
		List<MailReceiverVO> list = receiverMapper.selectReceiveMailList(receiverVO);
		return list;
	}
	
	// 받은메일 단건조회
	@Override
	public MailReceiverVO getReceiveMailInfo(MailReceiverVO receiverVO) {
		return receiverMapper.selectReceiveMailInfo(receiverVO);
	}

	// 내게쓴 메일 List
	@Override
	public List<MailReceiverVO> getMailToMeList(MailReceiverVO requestVO) {
		List<MailReceiverVO> list = receiverMapper.selectMailToMeList(requestVO);
		return list;
	}
	
	// 메일 전송 수신자 2명 이상 시 for 성공건수 map
	@Override
	public List<String> insertReceiver(List<MailReceiverVO> receiverVO) {
		// 성공건수
		List<String> posted = new ArrayList<String>();
		
		for(MailReceiverVO mail : receiverVO) {
			
			if(mail.getMailReceiver().length() > 1) {
				posted.add(mail.getMailReceiver().split(",")[0]);
			}
			
			receiverMapper.insertReceiverInfo(mail);
		}
		
		return posted;
	}

	// 받은 메일 단건 조회 시 읽음처리
	@Override
	public int updateReceiver(int mailReNo) {
		return receiverMapper.updateReceiverInfo(mailReNo) == 1 ? mailReNo : -1;
	}
	
	
	// 선택삭제
	@Override
	public int deleteReciever(int mailReNo) {
		return receiverMapper.deleteReceiverInfo(mailReNo) == 1 ? mailReNo : -1;
	}
		
	@Override
	public List<MailReceiverVO> getHeaderCount(MailReceiverVO receiverVO) {
		List<MailReceiverVO> list = receiverMapper.selectHeaderList(receiverVO);
		return list;
	}

	// 헤더 장식 카운트
	@Override
	public List<MailReceiverVO> getHeaderList(MailReceiverVO receiverVO) {
		List<MailReceiverVO> list = receiverMapper.selectHeaderCount(receiverVO);
		return list;
	}

	
}
