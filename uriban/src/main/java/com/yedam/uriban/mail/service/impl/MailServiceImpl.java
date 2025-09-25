package com.yedam.uriban.mail.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.uriban.mail.mapper.MailMapper;
import com.yedam.uriban.mail.mapper.MailReceiverMapper;
import com.yedam.uriban.mail.service.MailReceiverVO;
import com.yedam.uriban.mail.service.MailService;
import com.yedam.uriban.mail.service.MailVO;

@Service
public class MailServiceImpl implements MailService{
	
	@Autowired
	MailMapper mailMapper;
	
	@Autowired
	MailReceiverMapper receiverMapper;
	
	@Override
	public List<MailVO> getMailList(MailVO mailVO) {
		List<MailVO> list = mailMapper.selectMailList(mailVO);
		return list;
	}

	@Override
	public MailVO getMailInfo(MailVO mailVO) {
		return mailMapper.selectMailInfo(mailVO);
	}

	@Override
	public int insertMail(MailVO mailVO) {
		// 메일내용등록
		int result = mailMapper.insertMailInfo(mailVO) == 1 ? mailVO.getMailNo() : -1;
		
		//리시버 등록
		String [] mailReceiver= mailVO.getMailReceiver().split(",");
		MailReceiverVO vo = new MailReceiverVO();
		vo.setMailNo(mailVO.getMailNo());
		
		for(String mail : mailReceiver) {
			vo.setMailReceiver(mail.trim());
		
			receiverMapper.insertReceiverInfo(vo);
		}
		
		return result;
	}

	@Override
	public int deleteMail(int mailNo) {
		return mailMapper.deleteMailInfo(mailNo) == 1 ? mailNo : -1;
	}
	
}
