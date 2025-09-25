package com.yedam.uriban.member.service.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.yedam.uriban.common.CommonFileUpload;
import com.yedam.uriban.member.mapper.CertMapper;
import com.yedam.uriban.member.mapper.MemberMapper;
import com.yedam.uriban.member.mapper.ProfileMapper;
import com.yedam.uriban.member.service.CertVO;
import com.yedam.uriban.member.service.MemberService;
import com.yedam.uriban.member.service.MemberVO;
import com.yedam.uriban.member.service.ProfileVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper memberMapper;

	@Autowired
	ProfileMapper profileMapper;

	@Autowired
	CertMapper certMapper;

	@Autowired
	CommonFileUpload fileUpload;
	
	@Autowired
	@Qualifier("customerUserDetailsService")
	UserDetailsService detailsService;


	// 프로필 파일 업로드 경로
	@Value("#{prop['file.profile.upload.path']}")
	private String profilePath;

	// 자격 파일 업로드 경로
	@Value("#{prop['file.cert.upload.path']}")
	private String certPath;

	// 전체 조회
	@Override
	public List<MemberVO> getMemberList() {
		List<MemberVO> memberList = memberMapper.getMemberList();
		return memberList;
	}

	// 단건 조회
	@Override
	public MemberVO getMemberInfo(MemberVO memberVO) {
		memberVO = memberMapper.getMemberInfo(memberVO);
		
		// 권한이 교사(미인증)일때 교원자격신청 확인
		if(memberVO.getAuthority().equals("A103")) {
			
			CertVO certVO = new CertVO();
			certVO.setMemberId(memberVO.getMemberId());
			certVO = certMapper.certInfo(certVO);
			if(certVO!=null) {
				memberVO.setCertVO(certVO);
			}
		}
		return memberVO;
	}

	// 회원 가입
	@Transactional
	@Override
	public int insertMember(MemberVO memberVO) {

		// 파일 업로드
		Map<String, String> profile = fileUpload.saveFile(memberVO.getFile(), profilePath); // MemberVO에 프로필 파일 체크

		if (!profile.isEmpty()) {
			// 파일 업로드가 성공하면 파일 정보를 profileVO에 설정
			ProfileVO profileVO = new ProfileVO();

			profileVO.setMemberId(memberVO.getMemberId());
			profileVO.setOriginalfileName(profile.get("OriginalfileName"));
			profileVO.setSavefileName(profile.get("SavefileName"));

			profileMapper.insertProfile(profileVO);

			memberVO.setMemberProfile(profile.get("SavefileName"));
		}

		return memberMapper.insertMember(memberVO) == 1 ? 1 : -1;
		// 회원 가입 성공시 1반환 아니면 -1 반환

	}

	// 아이디 중복체크
	@Override
	public int idCheck(String memberId) {
		int cnt = memberMapper.idCheck(memberId);
		return cnt;
	}
	
	
	
	// 수정 - 유저 정보
	@Transactional
	@Override
	public Map<String, String> updateMemberInfo(MemberVO memberVO) {
		// 파일 업로드
		Map<String, String> profile = fileUpload.saveFile(memberVO.getFile(), profilePath); // MemberVO에 프로필 파일 체크
		Map<String, String> cert = fileUpload.saveFile(memberVO.getCertFile(), certPath); // MemberVO에 프로필 파일 체크
		Map<String, String> map = new HashMap<>();
		int result = 0;
		
		if (!profile.isEmpty()) {
			// 파일 업로드가 성공하면 파일 정보를 profileVO에 설정
			ProfileVO profileVO = new ProfileVO();

			profileVO.setMemberId(memberVO.getMemberId());
			profileVO.setOriginalfileName(profile.get("OriginalfileName"));
			profileVO.setSavefileName(profile.get("SavefileName"));

			profileMapper.insertProfile(profileVO);

			memberVO.setMemberProfile(profile.get("SavefileName"));
		} 
		if (!cert.isEmpty()) {
			// 파일 업로드가 성공하면 파일 정보를 certVO에 설정
			CertVO certVO = new CertVO();

			certVO.setMemberId(memberVO.getMemberId());
			certVO.setOriginalfileName(cert.get("OriginalfileName"));
			certVO.setSavefileName(cert.get("SavefileName"));

			result = certMapper.certInsert(certVO);
		}

		// 변경한 정보가 하나라도 있으면 수정
		if (StringUtils.hasText(memberVO.getMemberPw()) ||
		    StringUtils.hasText(memberVO.getPhone()) ||
		    StringUtils.hasText(memberVO.getEmail()) ||
		    StringUtils.hasText(memberVO.getMemberState()) ||
		    StringUtils.hasText(memberVO.getMemberProfile())) {
				
			    result = memberMapper.updateMemberInfo(memberVO);
			    
				// 변경된 멤버 정보로 새로운 인증 생성
				Authentication currentAuth = SecurityContextHolder.getContext().getAuthentication();
				UserDetails newPrincipal = detailsService.loadUserByUsername(memberVO.getMemberId()); 
				UsernamePasswordAuthenticationToken newAuth =
						new UsernamePasswordAuthenticationToken(newPrincipal,
																currentAuth.getCredentials(),
																newPrincipal.getAuthorities());
				newAuth.setDetails(currentAuth.getDetails());
				SecurityContextHolder.getContext().setAuthentication(newAuth);
			}
		
		if (result > 0) {
			map.put("result", "Success");
		} else {
			map.put("result", "fail");
		}

		return map;
	}
	
	// 수정 - 관리자
	@Override
	public Map<String, String> updateMember(MemberVO memberVO) {
		 int result = memberMapper.updateMemberInfo(memberVO);
		 Map<String, String> map = new HashMap<>();
		 if (result > 0) {
				map.put("result", "Success");
			} else {
				map.put("result", "fail");
			}

			return map;
	}

	// 회원 탙퇴
	@Override
	public int deleteMember(MemberVO memberVO) {
		return memberMapper.deleteMember(memberVO) == 1 ? 1 : -1; // 회원 탈퇴 성공시 1반환 아니면 -1 반환
	}
	
	// 밴 체크
	@Override
	public int banCheck(String memberId) {
		String result = memberMapper.banCheck(memberId);
		int chk = 0;
		if (result.equals("정상")) {
			chk = 1;
		}
		
		return chk;
	}
	

}
