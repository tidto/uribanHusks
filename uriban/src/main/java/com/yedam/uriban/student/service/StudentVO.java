package com.yedam.uriban.student.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class StudentVO {
	private int studentNo;
	private int classId;
	private String studentName;
	private String memberId;
	private String studentEmail;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birthday;
	private String studentSex;
	private String studentImg;
	private String remark;
	private String allergy;
	private int studentClassNo;
	
	private String classPw;
	private String subCd;
	private Integer result;
}