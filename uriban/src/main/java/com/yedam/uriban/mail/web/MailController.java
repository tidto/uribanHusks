package com.yedam.uriban.mail.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.yedam.uriban.ban.member.service.ClassMemberService;
import com.yedam.uriban.ban.member.service.ClassMemberVO;
import com.yedam.uriban.mail.service.MailReceiverService;
import com.yedam.uriban.mail.service.MailReceiverVO;
import com.yedam.uriban.mail.service.MailService;
import com.yedam.uriban.mail.service.MailVO;
import com.yedam.uriban.myclass.service.MyClassVO;

/*
 * 구현: 서민호
 * 구현일자: 2023-10-
 * 
 * */

@Controller
public class MailController {
	
	@Autowired
	MailService mailService;
	
	@Autowired
	MailReceiverService receiverService;
	
	@Autowired
	ClassMemberService classMemberService;
	
	// 보낸메일함 list
	@GetMapping("/mail/mailSendList")
	public String sendList(MailVO mailVO, ClassMemberVO memberVO, Model model, HttpServletRequest request) {
		// 클래스아이디 session으로 호출
		HttpSession session = request.getSession();
		MyClassVO vo = (MyClassVO)session.getAttribute("myClass");
		int classId = (Integer)session.getAttribute("ourClassId");
		session.setMaxInactiveInterval(1800);
		
		//mailVO.setClassId(mailVO.getClassId());
		mailVO.setClassId(classId);
		List<MailVO> list = mailService.getMailList(mailVO);
		model.addAttribute("mailSendList", list);
		
		// 클래스 구별된 명단, 모델로 전송
		memberVO.setClassId(classId);
		List<ClassMemberVO> lists = classMemberService.getIdList(memberVO);
		model.addAttribute("idList", lists);
		
		return"mail/mailSendList";
	}
	
	// 보낸메일함 info
	@GetMapping("/mail/mailSendInfo")
	public String sendInfo(MailVO mailVO, Model model) {
		MailVO findVO = mailService.getMailInfo(mailVO);
		model.addAttribute("mailSendInfo", findVO);		
//		
//		// 클래스 구별된 명단, 모델로 전송
//		List<ClassMemberVO> list = classMemberService.getIdList();
//		model.addAttribute("idList", list);
		
		return "mail/mailSendInfo";
	}
	
	
	// 메일 보내기 페이지
	@GetMapping("/mail/mailInsert")
	public String mailInsertPage(ClassMemberVO memberVO, Model model, HttpServletRequest request) {
		// 클래스아이디 session으로 호출
		HttpSession session = request.getSession();
		MyClassVO vo = (MyClassVO)session.getAttribute("myClass");
		int classId = (Integer)session.getAttribute("ourClassId");
		session.setMaxInactiveInterval(1800);
		
		// 클래스 구별된 명단, 모델로 전송
		memberVO.setClassId(classId);
		List<ClassMemberVO> list = classMemberService.getIdList(memberVO);
		model.addAttribute("idList", list);
		
		return "mail/mailInsert";
	}
	
	// 내게 메일 보내기 페이지
	@GetMapping("/mail/mailToMeInsert")
	public String mailToMeInsertPage(ClassMemberVO memberVO, Model model, HttpServletRequest request) {
		// 클래스아이디 session으로 호출
		HttpSession session = request.getSession();
		MyClassVO vo = (MyClassVO)session.getAttribute("myClass");
		int classId = (Integer)session.getAttribute("ourClassId");
		session.setMaxInactiveInterval(1800);
		
		// 클래스 구별된 명단, 모델로 전송
		memberVO.setClassId(classId);
		List<ClassMemberVO> list = classMemberService.getIdList(memberVO);
		model.addAttribute("idList", list);
		
		return "mail/mailToMeInsert";
	}
	
	// 메일(2) 보내기 처리
	@PostMapping("/mail/mailInsert")
	public String mailInsertProcess(MailVO mailVO, HttpServletRequest request) {
		// 클래스아이디 session으로 호출
		HttpSession session = request.getSession();
		MyClassVO vo = (MyClassVO)session.getAttribute("myClass");
		int classId = (Integer)session.getAttribute("ourClassId");
		session.setMaxInactiveInterval(1800);
		
		//mailVO.setClassId(mailVO.getClassId());
		mailVO.setClassId(classId);
		
		//serviceImpl에서 mailreceiver를 미리 처리 받아옴
		mailService.insertMail(mailVO);

		return "redirect:mailSendStatus";
	}
	
	// 회신 보내기 처리
	@PostMapping("/mail/mailReceiverInfo")
	public String reactionMailInsertProcess(MailVO mailVO, HttpServletRequest request) {
		// 클래스아이디 session으로 호출
		HttpSession session = request.getSession();
		MyClassVO vo = (MyClassVO)session.getAttribute("myClass");
		int classId = (Integer)session.getAttribute("ourClassId");
		session.setMaxInactiveInterval(1800);
		
		//mailVO.setClassId(mailVO.getClassId());
		mailVO.setClassId(classId);
		
		//serviceImpl에서 mailreceiver를 미리 처리 받아옴
		mailService.insertMail(mailVO);

		return "redirect:mailSendStatus";
	}
	
	// 메일 성공 페이지 이동
	@GetMapping("/mail/mailSendStatus")
	public String successMailSend(MailVO mailVO, Model model) {
		MailVO findVO = mailService.getMailInfo(mailVO);
		model.addAttribute("mailSendInfo", findVO);
		return "mail/mailSendStatus";
	}
}
