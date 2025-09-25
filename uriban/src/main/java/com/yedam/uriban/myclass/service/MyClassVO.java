package com.yedam.uriban.myclass.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MyClassVO {
	
	public int classId;
	public String memberId;
	public String classPw;
	public String states;
	public String city;
	public String schoolName;
	public int grade;
	public int classes;
	public String classComment;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	public Date createDate;
	public String classState;
	public String createrId;
	
	public String studentName;
}
