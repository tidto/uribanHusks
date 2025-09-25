package com.yedam.uriban.mail.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.uriban.ban.member.service.ClassMemberService;
import com.yedam.uriban.mail.service.MailReceiverService;
import com.yedam.uriban.mail.service.MailReceiverVO;
import com.yedam.uriban.member.service.MemberVO;
import com.yedam.uriban.myclass.service.MyClassVO;

/*
 * 구현: 서민호
 * 구현일자: 2023-10-
 * 
 * */

@Controller
public class MailReceiverController {
	
	@Autowired
	MailReceiverService receiverService;
	
	@Autowired
	ClassMemberService classMemberService;
	
	// 받은메일 select list
	@GetMapping("/mail/mailReceiveList")
	public String receiverList(MailReceiverVO receiverVO
								, @AuthenticationPrincipal MemberVO member
								, Model model
								, HttpServletRequest request) {
		// 멤버데이터 소환
		String memberId = member.getMemberId();
		receiverVO.setMemberId(memberId);
		
		// 클래스아이디 session으로 호출
		HttpSession session = request.getSession();
		MyClassVO vo = (MyClassVO)session.getAttribute("myClass");
		int classId = (Integer)session.getAttribute("ourClassId");
		session.setMaxInactiveInterval(1800);
		
		// VO에 추가 후 값 넘김
		//receiverVO.setClassId(receiverVO.getClassId());
		receiverVO.setClassId(classId);
		
		List<MailReceiverVO> list = receiverService.getReceiveMailList(receiverVO);
		model.addAttribute("mailReceiveList", list);
		
		return "mail/mailReceiveList";
	}
	
	// 받은메일 select_info ++ read_check 0일때만 1로 update실행
	@GetMapping("/mail/mailReceiveInfo")
	public String receiverInfo(MailReceiverVO receiverVO
								,Model model
								,HttpServletRequest request) {
		
		// 클래스아이디 session으로 호출
		HttpSession session = request.getSession();
		MyClassVO vo = (MyClassVO)session.getAttribute("myClass");
		int classId = (Integer)session.getAttribute("ourClassId");
		receiverVO.setClassId(classId);
		session.setMaxInactiveInterval(1800);
		
		// 받은 메일 정보 전송
		MailReceiverVO findVO = receiverService.getReceiveMailInfo(receiverVO);
		model.addAttribute("mailReceiveInfo", findVO);
		int reNo = receiverVO.getMailReNo();
		
		if(receiverVO.getReadCheck().equals("F201")) {
			receiverService.updateReceiver(reNo);
		}
		
		return "mail/mailReceiveInfo";
	}
	
	// 내게쓰기 list
	@GetMapping("/mail/mailToMeList")
	public String toMeList(MailReceiverVO receiverVO, Model model, HttpServletRequest request) {
		// 클래스아이디 session으로 호출
		HttpSession session = request.getSession();
		MyClassVO vo = (MyClassVO)session.getAttribute("myClass");
		int classId = (Integer)session.getAttribute("ourClassId");
		session.setMaxInactiveInterval(1800);
		
		//receiverVO.setClassId(receiverVO.getClassId());
		receiverVO.setClassId(classId);

		List<MailReceiverVO> list = receiverService.getMailToMeList(receiverVO);
		model.addAttribute("mailToMeList", list);

		return "mail/mailToMeList";
	}
	
	// 회신서비스 생성후 작성
	
	// insert는 mail controller 에
	
	// 받은메일 삭제
	@PostMapping("/mail/mailReceiveDelete")
	@ResponseBody
	public int noticeDelete(@RequestParam Integer mailReNo) {
		return receiverService.deleteReciever(mailReNo);
	}
	
	// 받은메일 보기처리
	@PostMapping("/mail/mailReceiveReaded")
	@ResponseBody
	public int noticeReaded(@RequestParam Integer mailReNo) {
		return receiverService.updateReceiver(mailReNo);
	}
	
	// 확인 안한 헤더 메일
	@GetMapping("/tiles/main/header")
	public String headerList(MailReceiverVO receiverVO
								, @AuthenticationPrincipal MemberVO member
								, Model model
								, HttpServletRequest request) {
		// 멤버데이터 소환
		String memberId = member.getMemberId();
		receiverVO.setMemberId(memberId);
		
		// 클래스아이디 session으로 호출
		HttpSession session = request.getSession();
		MyClassVO vo = (MyClassVO)session.getAttribute("myClass");
		int classId = (Integer)session.getAttribute("ourClassId");
		session.setMaxInactiveInterval(1800);
		
		// VO에 추가 후 값 넘김
		//receiverVO.setClassId(receiverVO.getClassId());
		receiverVO.setClassId(classId);
		
		List<MailReceiverVO> count = receiverService.getHeaderCount(receiverVO);
		model.addAttribute("headerCount", count);
		
		List<MailReceiverVO> list = receiverService.getHeaderList(receiverVO);
		model.addAttribute("headerList", list);
		
		return "tiles/main/header";
	}
	
}
