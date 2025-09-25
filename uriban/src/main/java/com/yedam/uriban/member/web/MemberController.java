package com.yedam.uriban.member.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.uriban.member.service.CertService;
import com.yedam.uriban.member.service.CertVO;
import com.yedam.uriban.member.service.MemberService;
import com.yedam.uriban.member.service.MemberVO;
import com.yedam.uriban.member.service.ReportService;
import com.yedam.uriban.member.service.ReportVO;
import com.yedam.uriban.myclass.service.MyClassService;
import com.yedam.uriban.myclass.service.MyClassVO;
import com.yedam.uriban.student.service.StudentService;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;

	@Autowired
	MyClassService myClassService;

	@Autowired
	StudentService studentService;

	@Autowired
	ReportService reportService;

	@Autowired
	CertService certService;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	// 전체 조회(관리자)
	@GetMapping("admin/memberList")
	public String getMemberList(Model model) {
		model.addAttribute("memberList", memberService.getMemberList());
		return "admin/memberList";
	}

	// 단건 조회(관리자)
	@GetMapping("admin/memberInfo")
	public String getMemberInfo(MemberVO memberVO, Model model) {
		model.addAttribute("memberInfo", memberService.getMemberInfo(memberVO));
		return "admin/memberInfo";
	}

	// 단건 조회(유저)
	@GetMapping("myInfo")
	public String getMyInfo(MemberVO memberVO, Model model) {
		memberVO = memberService.getMemberInfo(memberVO);
		if (memberVO.getAuthority().equals("A103")) {

		}
		model.addAttribute("memberInfo", memberVO);
		return "my/myInfo";
	}

	// 회원가입 - Form (GET방식)
	@GetMapping("signup")
	public String userInsertForm() {
		return "home/signUp";
	}

	// 회원가입 - Process (POST)
	@PostMapping("signup")
	public String userInsertProcess(MemberVO memberVO, RedirectAttributes attr) {
		
		memberVO.setMemberPw(passwordEncoder.encode(memberVO.getMemberPw()));
		
		int check = memberService.insertMember(memberVO);
		
		String result = null;
		if (check == -1) {
			result = "정상적으로 가입되지 않았습니다.";
		} else {
			result = "정상적으로 가입되었습니다.";

		}
		attr.addFlashAttribute("result", result);
		return "redirect:/login";
	}

	// 아이디 중복체크
	@PostMapping("signup/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("memberId") String memberId) {

		int cnt = memberService.idCheck(memberId);
		return cnt;

	}

	// 수정 : 1) 단건조회 -> 2) 수정

	// 회원 정보 수정 - Form
	@GetMapping("admin/memberUpdate")
	public String memberUpdateForm(MemberVO memberVO, Model model) {
		MemberVO findVO = memberService.getMemberInfo(memberVO);
		model.addAttribute("memberInfo", findVO);
		return "admin/memberUpdate";
	}

	// 회원 정보 수정 - Process
	@ResponseBody
	@PostMapping("member/memberUpdate")
	public Map<String, String> memberUpdateProcess(MemberVO memberVO) {
		if (StringUtils.hasText(memberVO.getMemberPw())) {
			memberVO.setMemberPw(passwordEncoder.encode(memberVO.getMemberPw()));
		}
		Map<String, String> map = memberService.updateMemberInfo(memberVO);

		return map;
	}

	// 회원 정보 수정 - 관리자
	@ResponseBody
	@PostMapping("admin/memberUpdate")
	public Map<String, String> Updatemember(MemberVO memberVO) {
		Map<String, String> map = memberService.updateMember(memberVO);

		return map;
	}

	// 회원 탈퇴 (GET방식)
	@GetMapping("member/memberDelete")
	public String memberDelete() {
		return "my/pwChk";
	}

	// 회원 탈퇴 - Process (유저)
	@ResponseBody
	@PostMapping("member/memberDelete")
	public String memberDelete(MemberVO memberVO, @AuthenticationPrincipal MemberVO memVO) {
		int chk = 0;
		String chkPw = memberVO.getMemberPw();
		String currentPw = memVO.getMemberPw().substring(8);
		if(passwordEncoder.matches(chkPw, currentPw)) {
			chk = memberService.deleteMember(memberVO);
		}
		String result = "fail";
		if (chk > 0) {
			result = "success";
		}
		return result;
	}

	// 회원 탈퇴 - Process (관리자)

	@PostMapping("admin/memberDelete")
	public String memberDeleteProcess(MemberVO memberVO, RedirectAttributes attr) {
		int chk = memberService.deleteMember(memberVO);
		String result;
		if (chk == -1) {
			result = "정상적으로 가입되지 않았습니다.";
		} else {
			result = "정상적으로 가입되었습니다.";

		}
		attr.addFlashAttribute("result", result);
		return "redirect:admin/memberList";
	}

	// 로그인 페이지
	@RequestMapping("/login")
	public String signInForm() {
		return "home/signIn";
	}

	// 로그아웃
	@PostMapping("signout")
	public void logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate(); // 세션 무효화
		}
	}

	// 마이페이지
	@GetMapping("/myhome")
	public String myhome(Model model, @AuthenticationPrincipal MemberVO memberVO) {
		memberVO = memberService.getMemberInfo(memberVO);
		List<Map<String,Object>> list = myClassService.getMyClass(memberVO);
		model.addAttribute("member", memberVO);
		if (!list.isEmpty()) {
			model.addAttribute("getMyClass", list);
		}
		return "my/myhome";
	}

	// 비밀번호 확인
	@GetMapping("/pwChk")
	public String pwChk() {
		return "home/pwChk";
	}

	// 관리자 페이지
	@GetMapping("admin/adminHome")
	public String adminHome(Model model) {
		List<ReportVO> rList = reportService.getReportList();
		List<CertVO> cList = certService.getCertList();
		List<ReportVO> rptList = new ArrayList<>();
		List<CertVO> applyList = new ArrayList<>();

		for (ReportVO rptVO : rList) {
			if (rptVO.getReportState().equals("대기")) {
				rptList.add(rptVO);
			}
		}

		for (CertVO certVO : cList) {
			if (certVO.getCertStat().equals("대기")) {
				applyList.add(certVO);
			}
		}

		model.addAttribute("rptList", rptList);
		model.addAttribute("applyList", applyList);
		return "admin/adminHome";
	}

	// 밴 체크
	@PostMapping("member/banCheck")
	@ResponseBody
	public int banCheck(@RequestParam("memberId") String memberId) {

		int result = memberService.banCheck(memberId);
		return result;

	}

}
