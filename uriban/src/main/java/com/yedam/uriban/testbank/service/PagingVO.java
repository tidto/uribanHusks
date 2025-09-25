package com.yedam.uriban.testbank.service;

import lombok.Data;

@Data
public class PagingVO {
	//paging
	private int pageNo; //현재 쪽
	private int pageSize; //화면에 보이는 글 목록의 글 수
	private int totalCount; //전체 글 수
	
	private int startNo; //현재 쪽 글 목록의 시작 번호
	private int endNo; //현재 쪽 글 목록의 마지막 번호
	
	private int startPage; //페이지 이동버튼의 시작 번호
	private int endPage; //페이지 이동버튼의 마지막 번호
	private int totalPage;
	
	public PagingVO(int pageNo, int pageSize, int totalCount) {
		//this.pageNo = pageNo;
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		
	// 계산 시작 : 페이지 수
		totalPage = (totalCount - 1)/pageSize + 1;
		
	// *pageNo는 현재 페이지가 잘못된 값이 전달 되었을 때 : 1보다 작은 값 또는 totalPage보다 큰 값
		this.pageNo = (pageNo<1)? 1 : pageNo;
		this.pageNo = (pageNo>totalPage)? totalPage : pageNo;
		
		startNo = (this.pageNo-1)*pageSize+1;
		endNo = startNo + (pageSize-1);	// *totalConut 이하의 값이어야 한다.
		this.endNo = this.endNo>totalCount?totalCount:this.endNo;
		
		startPage = (this.pageNo-1)/10*10+1; //pageNo가 11~20일 때 startPage는 모두 11
		endPage = startPage + 9; //*totalPage 이하의 값이어야 한다
		this.endPage = this.endPage>totalPage?totalPage:this.endPage;
	}
}
