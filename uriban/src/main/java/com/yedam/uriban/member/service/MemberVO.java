package com.yedam.uriban.member.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Data
public class MemberVO implements UserDetails{
	private String memberId;
	private String memberPw;
	private String memberName;
	private String phone;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birth;
	private String email;
	private String authority;
	private String authKor;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createDate;
	private String memberProfile;
	private int banCount;
	private String memberState;
	private String memberStateKor;
	// profile
	private MultipartFile file;
	// license
	private MultipartFile certFile;
	private CertVO certVO;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		
		List<GrantedAuthority> auth = new ArrayList<>();
		auth.add(new SimpleGrantedAuthority(this.authority));
		return auth;
	}
	@Override
	public String getPassword() {
		
		return this.memberPw;
	}
	@Override
	public String getUsername() {
		
		return this.memberId;
	}
	@Override
	public boolean isAccountNonExpired() {
		
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		
		return true;
	}
	@Override
	public boolean isEnabled() {
		
		return true;
	}
}
