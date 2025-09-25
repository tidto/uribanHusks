package com.yedam.uriban.homework.service;

import lombok.Data;

@Data
public class PageVO {

	private int pageNo;	
	private int pageSize;	
	private int totalCount;	
	
	private int startNo;	
	private int endNo;
	private int startPage;
	private int endPage;	

	private int totalPage;
	
	// 검색
	private String keyword;
	private String type;
	private String[] typeArr;
	
	public void setType(String type) {
		this.type = type;
		this.typeArr = type.split("");
	}
	
	public PageVO(int pageNo,int pageSize, int totalCount) {
		//this.pageNo = pageNo;
		this.pageSize = pageSize;
		this.totalCount = totalCount;

	
	totalPage = (totalCount - 1)/pageSize + 1;

	this.pageNo = (pageNo<1)? 1:pageNo;
	this.pageNo = (pageNo>totalPage)? totalPage:pageNo;
	
	startNo = (this.pageNo-1)*pageSize + 1;

	endNo = startNo + (pageSize - 1);		
	this.endNo = this.endNo>totalCount? totalCount:this.endNo;
	
	startPage = (this.pageNo - 1)/10*10 + 1;	
	endPage = startPage + 9;			

	this.endPage = this.endPage>totalPage? totalPage:this.endPage;
	}
}
