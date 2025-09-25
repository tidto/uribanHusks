<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<style>
.swiper {
  width: 100%;
  height: 400px;
}
:root {
    --swiper-theme-color: #5fcf80 !important;
}
.layer {
	display: none;
	position: fixed;
	width: 20%;
	left: 50%;
	margin-left: -10%; /* half of width */
	top: 50%;
	margin-top: -150px; /* half of height */
	overflow: auto;
	z-index: 10000;
}
#myModal{
	z-index: 10000;
}
</style>
</head>
<body>
<div class="card">
	<div class="card-body">
		<div class="d-flex justify-content-start breadcrumb-content">
			<h5>학급앨범</h5>
		</div>
	</div>
</div>
<div class="input-group d-flex flex-wrap justify-content-end" >
   <select class="custom-select col-lg-3 col-md-3 col-lg-3" id="selectMonthDiv" name="month" onchange="showMonth(this.value)">
       	<option selected value="">월을 선택해주세요</option>
	    <option value="1">1월</option>
	    <option value="2">2월</option>
	    <option value="3">3월</option>
	    <option value="4">4월</option>
	    <option value="5">5월</option>
	    <option value="6">6월</option>
	    <option value="7">7월</option>
	    <option value="8">8월</option>
	    <option value="9">9월</option>
	    <option value="10">10월</option>
	    <option value="11">11월</option>
	    <option value="12">12월</option>
   </select>
</div>
<div id="albumAll" >
<sec:authentication property="principal" var="p" />
<input type="hidden" value="${p.memberId }" id="hiddenMemberId" />
<input type="hidden" value="${p.authority }" id="hiddenMemberAuthority" />
<c:forEach var="album" items="${albumList }">
	<div class="col-lg-6 col-md-6 col-lg-3" style="left: 25%; padding:50px 0 0 0;">
		<div class="card">
			<div class="card-body">
				<c:if test="${p.authority eq 'ROLE_A102' }">
				<div class="d-flex flex-wrap align-items-center justify-content-end mb-3">
	                 <button class="btn btn-link mt-2" onclick="location.href='../album/albumUpdate?albumNo=${album.albumNo }'">
	                 <svg class="svg-icon" width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
	                     <path d="M5 10c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm14 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm-7 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"></path>
	                 </svg>
	                 </button>
				</div>		
				</c:if>	
								
				<!-- Slider main container -->
				<div class="swiper">
				  <!-- Additional required wrapper -->
				  <div class="swiper-wrapper">
				    <!-- Slides -->
				    <c:forEach var="imgs" items="${imgList }">
						<c:forEach var="img" items="${imgs }">
							<c:if test="${img.albumNo eq album.albumNo}">
							<div class="swiper-slide">
								<img src="${pageContext.request.contextPath }/albumImg/${img.renameFilename}" class="d-block w-100"
										style="height:400px;" alt="#">
							</div>
							</c:if> 
						</c:forEach> 
					</c:forEach>
				  </div>
				  <!-- If we need pagination -->
				  <div class="swiper-pagination"></div>
				
				  <!-- If we need navigation buttons -->
				  <div class="swiper-button-prev"></div>
				  <div class="swiper-button-next"></div>
				
				  <!-- If we need scrollbar -->
				  <div class="swiper-scrollbar"></div>
				</div>
				
				<hr>
				
				<p class="card-text">${album.content }</p>
				<p class="card-text">${album.place }</p>
				<c:forEach var="tags" items="${tagList }">
					<c:forEach var="tag" items="${tags }">
						<c:if test="${tag.albumNo eq album.albumNo}">
							<button type="button" onclick="location.href='albumList?albumType=tag&albumValue=${tag.tag }'" class="btn btn-outline-primary rounded-pill mt-2">#${tag.tag }</button>
						</c:if> 
					</c:forEach> 
				</c:forEach>
				<div style="padding:10px 0 0 0;">			
					<div class="d-flex flex-wrap align-items-center justify-content-between">       
		               <div class=".d-inline-block"> 
		               	 <c:forEach var="like" items="${likeList }">
		               	 	<c:if test="${album.albumNo eq like.albumNo}">
		               	 		<button class="btn btn-link mt-2" onclick="clickLike()" data-memId="${p.memberId }" data-value="${album.albumNo }">
					                 <svg class="svg-icon" width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="pink" stroke="pink" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
					                     <path d="M16.5 3C19.538 3 22 5.5 22 9c0 7-7.5 11-10 12.5C9.5 20 2 16 2 9c0-3.5 2.5-6 5.5-6C9.36 3 11 4 12 5c1-1 2.64-2 4.5-2z"></path>
					                 </svg>
				                 </button>
				                 <input type="hidden" value="hide" name="likeHide" />
		               	 	</c:if>
		               	 </c:forEach>
		                 <button class="btn btn-link mt-2" onclick="clickLike()" data-memId="${p.memberId }" data-value="${album.albumNo }">
			                 <svg class="svg-icon" width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="pink" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
			                     <path d="M16.5 3C19.538 3 22 5.5 22 9c0 7-7.5 11-10 12.5C9.5 20 2 16 2 9c0-3.5 2.5-6 5.5-6C9.36 3 11 4 12 5c1-1 2.64-2 4.5-2z"></path>
			                 </svg>
		                 </button>
		                 
		                 <button type="button" class="mt-2 btn btn-link rounded-pill"><i class="ri-heart-fill"></i><span id="sp${album.albumNo }">${album.likeCount }</span></button>
		                 
		                 <c:if test="${p.authority ne 'ROLE_A105' }">
		                 <button class="btn btn-link mt-2" onclick="showModal()" data-value="${album.albumNo }" data-toggle="modal" data-target=".bd-example-modal-xl">
			                 <svg class="svg-icon" width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
			                     <path d="M10 3h4a8 8 0 1 1 0 16v3.5c-5-2-12-5-12-11.5a8 8 0 0 1 8-8z"></path>
			                 </svg>
			             </button>
			             </c:if>
		                 <button class="btn btn-link mt-2" onclick="downTotImg(${album.albumNo })">
			                 <svg class="svg-icon" width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
			                     <path d="M4 19h16v-7h2v8a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1v-8h2v7zM14 9h5l-7 7-7-7h5V3h4v6z"></path>
			                 </svg>
		                 </button>
		              	<button onclick="showDetail()" class="btn btn-link mt-2" data-value="${album.albumNo }">  
                              <svg width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                  <rect x="3" y="3" width="7" height="7"></rect><rect x="14" y="3" width="7" height="7"></rect><rect x="14" y="14" width="7" height="7"></rect><rect x="3" y="14" width="7" height="7"></rect>
                              </svg>            
		              	</button>	              	
		              	</div>

		                <div class=".d-inline-block">	                
		                	<p style="padding:0;"><fmt:formatDate value="${album.albumDate}" pattern="yyyy년MM월dd일"/></p>
		                </div>
					</div>
	           	</div>
			</div>
		</div>		
	</div>
	<br>
	<br>
	<br>
</c:forEach>
</div>

<div id="albumDetail" class="row d-none" >
   <div class="col-sm-12" id="detailImgBox">
   </div>
</div>
<br><br><br><br><br><br>

<div class="card fixed-bottom mb-0">
	<div class="card-body">
	 	<div class="d-flex flex-wrap align-items-center justify-content-around">
	       <button class="btn btn-link mt-2" onclick="goTop()">
	       	Top
	       </button>
	       <c:if test="${p.authority eq 'ROLE_A102' }">
	       <button class="btn btn-primary mt-2" onclick="location.href='../album/albumInsert'">
	         <svg class="svg-icon" width="30" height="30" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="white" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
	             <path d="M11 11V5h2v6h6v2h-6v6h-2v-6H5v-2z"></path>
	         </svg>
	        </button>
	        </c:if> 	
	         <button class="btn btn-link mt-2" onclick="location.href='../album/albumList?albumType=like'">
	         <svg class="svg-icon" width="30" height="30" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="pink" stroke="pink" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
	             <path d="M16.5 3C19.538 3 22 5.5 22 9c0 7-7.5 11-10 12.5C9.5 20 2 16 2 9c0-3.5 2.5-6 5.5-6C9.36 3 11 4 12 5c1-1 2.64-2 4.5-2z"></path>
	         </svg>            
	         </button>  
	         <button id="allBtn" class="btn btn-link mt-2" onclick="location.href='../album/albumList'"> 
             <svg  width="30" height="30" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                 <line x1="21" y1="10" x2="3" y2="10"></line><line x1="21" y1="6" x2="3" y2="6"></line><line x1="21" y1="14" x2="3" y2="14"></line><line x1="21" y1="18" x2="3" y2="18"></line>
             </svg>
	         </button>
	      </div>
   	</div>
</div> 

<!-- Modal -->
<div class="modal fade bd-example-modal-xl" tabindex="-1" role="dialog" id="myModal" aria-hidden="true">
   <div class="modal-dialog modal-xl modal-dialog-scrollable">
      <div class="modal-content">
         <div class="modal-header">
            <h5 class="modal-title">앨범 댓글창</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
         </div>
         <input type="hidden" id="DetailCmtAlbumNo" />  
         <div class="modal-body" id="cmtPlace">
         </div>
         <div class="modal-footer">
         	<div class="input-group mb-4">
               <input type="text" id="cmt" class="form-control" placeholder="댓글을 입력해주세요">
               <div class="input-group-append">
                  <button class="btn btn-primary" onclick="banChk()" type="button">입력</button>
                  <input type="hidden" id="cmtAlbumNo" />
                  <input type="hidden" id="cmtUserName" value="${p.memberId }" />
               </div>
            </div>
         </div>
      </div>
   </div>
</div>

	<!-- alert 창 -->
	<div class="alert text-white bg-info layer" id="done" role="alert">
		<div class="iq-alert-text">
			<span class="done"></span>
			<button type="button" class="close close1">
				<i class="ri-close-line"></i>
			</button>
		</div>
	</div>
	<div class="alert text-white bg-danger layer " id="err" role="alert">
		<div class="iq-alert-text">
			<span class="err"></span>
		<button type="button" class="close close1">
			<i class="ri-close-line"></i>
		</button>
		</div>
	</div>


<script type="text/javascript">

$('.close1').on('click', function() {
	$('.layer').hide();
})

const swiper = new Swiper('.swiper', {
	  // Optional parameters
	  direction: 'vertical',
	  loop: true,

	  // If we need pagination
	  pagination: {
	    el: '.swiper-pagination',
	  },

	  // Navigation arrows
	  navigation: {
	    nextEl: '.swiper-button-next',
	    prevEl: '.swiper-button-prev',
	  },

	  autoplay: {
		    delay: 3000,
		},
	});

function goTop(){
	document.documentElement.scrollTop = 0;
}

function showDetail(){
	getalbumDetailList(event.currentTarget.dataset.value);
	$('#albumDetail').removeClass('d-none');
	$('#albumAll').addClass('d-none');
	$('#selectMonthDiv').addClass('d-none');	
}

function getalbumDetailList(albumNo){

	$.ajax('../img/imageAlbumList',{
		type: 'post',
		contentType : 'application/json',
		data : JSON.stringify(albumNo)
	})
	.done(result=>{
		$.each(result,function(idx,imgs){
			let cardGroup = $("<div>").attr("class","card-group");
			let totCnt = imgs.length;
			let cnt = 1;
			
			$.each(imgs,function(index,img){
				let cardImg = $("<img>").attr("src","${pageContext.request.contextPath }/albumImg/"+img.renameFilename).attr("class","card-img-top").css("height", 300);
				let card = $("<div>").attr("class","card col-md-4 col-sm-12 p-0");
				let donwImg = `
				<div class="card-img-overlay">
					<button class="btn btn-link mt-2" onclick="downImg('\${img.imgNo }','\${albumNo}')">
		                 <svg class="svg-icon" width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
		                     <path d="M4 19h16v-7h2v8a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1v-8h2v7zM14 9h5l-7 7-7-7h5V3h4v6z"></path>
		                 </svg>
	                </button>
                </div>
				`;

				card.append(cardImg);
				card.append($(donwImg));
				cardGroup.append(card);

				if(index % 3 == 2){
					$('#detailImgBox').append(cardGroup);
					cardGroup = $("<div>").attr("class","card-group");
					cnt++;
				}	
				
				if(totCnt % 3 == 1 && cnt *3 >= totCnt){
					$('#detailImgBox').append(cardGroup);
				}else if(totCnt % 3 == 2 && cnt *3 >= totCnt){
					$('#detailImgBox').append(cardGroup);
				}
				
			})
		})
	})
	.fail(reject => console.log(reject))
}

function showModal(){
	let albumNo = event.currentTarget.dataset.value;
	
	$('#cmtPlace').empty();
	
	$('#cmtAlbumNo').val(albumNo);
	$('#DetailCmtAlbumNo').val(albumNo);

	getCmtList(albumNo);
}

function createCmtList(replyNo, content, userName, repDate, cmtWriter, repState){
	let cmtPlace = $('#cmtPlace');
	
	let year = repDate.getFullYear();
	let month = repDate.getMonth() + 1;
	let day = repDate.getDate();
	
	let reportBtn =
	`<div class="btn pr-0" role="group">
	    <button id="btnGroupDrop2" type="button" class="btn btn-danger" data-toggle="dropdown"
	       aria-haspopup="true" aria-expanded="false">
	       신고
	    </button>
	    <div class="dropdown-menu" aria-labelledby="btnGroupDrop2">

	       <a class="dropdown-item" href="#" onclick="rptInsert('A201')">음란물</a>
	       <a class="dropdown-item" href="#" onclick="rptInsert('A203')">욕설</a>
	       <a class="dropdown-item" href="#" onclick="rptInsert('A202')">기타</a>

	    </div>
	</div>`;
	
	let cmtReplyNo = $('<input>').attr("type","hidden").attr("name","thisReplyNo").val(replyNo);

	let viewBtn = $('<button>').attr("class","btn btn-outline-primary btn-sm").text("답글보기").attr("onclick",`showCmtDetail("\${repState }")`);
	let modBtn = $('<button>').attr("class","btn btn-primary").text("수정").attr("onclick","addModInput()");
	let delBtn = $('<button>').attr("class","btn btn-secondary").text("삭제").attr("onclick","delCmt()");

	let cmtCont = $('<span>').text(content).addClass("divContent");
	let writer = $('<span>').text(userName);
	let writeDate = $('<span>').text(year+"."+month+"."+day);
	let subDiv = $('<div>');
	let mainDiv = $('<div>').attr("class","d-flex flex-wrap align-items-center justify-content-between p-2");
	let repDiv = $('<div>');
	let totDiv = $('<div>').data("reply_no", replyNo).addClass("divReply");
	let modinputDiv = $('<div>');
	let reprepDiv = $('<div>');
	
	let memberId = $('#cmtUserName').val();
	let authority = $('#hiddenMemberAuthority').val();
	
	subDiv.append(writer);
	subDiv.append('&ensp;');
	subDiv.append(writeDate);
	subDiv.append('&ensp;');
	if(repState == "B201" && cmtWriter != memberId){
		subDiv.append(reportBtn);
	}
	
	if(cmtWriter == memberId){
		if(repState == "B202"){
			modBtn.attr("disabled", true);
			delBtn.attr("disabled", true);
		}

		subDiv.append(modBtn);
		subDiv.append(delBtn);
	
	}
	
	mainDiv.append(cmtCont);
	mainDiv.append(subDiv);
	mainDiv.append(cmtReplyNo);
	
	repDiv.append('&nbsp;');
	repDiv.append(viewBtn);
	
	totDiv.append(mainDiv);
	totDiv.append(modinputDiv);
	totDiv.append(repDiv);
	totDiv.append(reprepDiv);
	
	cmtPlace.append(totDiv);
}

function getCmtList(albumNo){
	$.ajax('../cmt/cmtList',{
		type: 'post',
		data : {albumNo : albumNo}
	})
	.done(result=>{
		
		$.each(result,function(index,cmt){
			
			let repDate = new Date(cmt.replyDate);  //Date객체 생성	
			
			let cmtWriter = cmt.userName;
			
			let repState = cmt.replyState;
			
			createCmtList(cmt.replyNo, cmt.content, cmt.userName, repDate, cmtWriter, repState);
		})
	})
	.fail(reject => console.log(reject))
}

function banChk() {
	var memberId = $('#cmtUserName').val();
	
	let albumNo = event.currentTarget.nextElementSibling.value;
	let content = event.currentTarget.parentElement.previousElementSibling.value;
	$.ajax({
		url : '${pageContext.request.contextPath }/member/banCheck', //Controller에서 요청 받을 주소
		type : 'post', //POST 방식으로 전달
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		data : {
			memberId : memberId
		},

		success : function(result) { 

			if (result == 1) {
				addCmt(albumNo, content);
			} else { 
				$('.err').text("댓글 사용이 제한된 사용자 입니다.");
				$('#err').show();
			}
		},
		error : function() {
		}
	})
}

function addCmt(albumNo, content){
	
	let userName = $('#cmtUserName').val();
	
	let cmtInfo = {}
	
	cmtInfo.albumNo = albumNo;
	cmtInfo.content = content;
	cmtInfo.userName = userName;
	
	if(content == ''){
		alert('내용이 입력되지 않았습니다.');
		$('#cmt').focus();
		return;
	}
	
	
	$.ajax('../cmt/cmtInsert',{
		type: 'post',
		contentType : 'application/json',
		data : JSON.stringify(cmtInfo)
	})
	.done(result=>{
		$('#cmt').val('');
		
 		let repDate = new Date(result.result.replyDate);  //Date객체 생성
		let replyNo = result.result.replyNo;
 		let cmtContent = result.result.content;
 		let cmtUserName = result.result.userName;
 		
 		let cmtWriter = cmtUserName;
		
		createCmtList(replyNo, cmtContent, cmtUserName, repDate, cmtWriter); 
		
	})
	.fail(reject => console.log(reject))
}

function delCmt(){
 	let replyNo = event.currentTarget.parentElement.nextElementSibling.value;
	
	let divTarget = $(event.currentTarget.parentElement.parentElement.parentElement);
	
	let spanTarget = $(event.currentTarget.parentElement.parentElement.parentElement.firstElementChild.firstElementChild);
	
	let delBtn = $(event.currentTarget);
	let modBtn = $(event.currentTarget.previousElementSibling);
	let reportBtn = $(event.currentTarget.previousElementSibling.previousElementSibling) 
	
	$.ajax('../cmt/cmtDelete',{
		type: 'get',
		contentType : 'application/json',
		data : { replyNo : replyNo }
	})
	.done(result=>{
		if(result.type == "update"){
			spanTarget.text(result.content);
			delBtn.attr("disabled", true);
			modBtn.attr("disabled", true);
			reportBtn.remove();
		}else{
			divTarget.remove();
		}
	})
	.fail(reject => console.log(reject)) 	
}


function addModInput(){
	let target = $(event.currentTarget.parentElement.parentElement).next();
	
	if(!target.is(':empty')){
		target.empty();
		return;
	}
	
	target.empty();
	
	let replyNo = event.currentTarget.parentElement.nextElementSibling.value;
	let content = event.currentTarget.parentElement.parentElement.firstElementChild.innerHTML;
	
	let addBtn = $('<button>').attr("class","btn btn-primary").attr("type","button").attr("onclick","modCmt()").text("수정");
	let subDiv = $('<div>').attr("class","input-group-append");
	let inputBox = $('<input>').attr("type","text").attr("class","form-control").attr("id","modInput").attr("value",content).attr("maxlength",50);
	let replyNoInput = $('<input>').attr("type","hidden").attr("value",replyNo);
	let mainDiv = $('<div>').attr("class","input-group mb-4").css("padding-top", 10);
	
	subDiv.append(addBtn);
	mainDiv.append(inputBox);
	mainDiv.append(subDiv);
	mainDiv.append(replyNoInput);

	target.append(mainDiv);
}

function modCmt(){
	let replyNo = event.currentTarget.parentElement.parentElement.lastElementChild.value;	
	let content = event.currentTarget.parentElement.parentElement.firstElementChild.value;
	
	if(content == ''){
		alert('내용이 입력되지 않았습니다.');
		$(event.currentTarget.parentElement.parentElement.firstElementChild).focus();
		return;
	}
	
	let contSpan = $(event.currentTarget.parentElement.parentElement.parentElement.previousElementSibling.firstElementChild);
	
	contSpan.text(content);
	
	let cmtVO = {};
	cmtVO.replyNo = replyNo;
	cmtVO.content = content;
	
 	$.ajax('../cmt/cmtUpdate',{
		type: 'post',
		contentType : 'application/json',
		data : JSON.stringify(cmtVO)
	})
	.done(result=>{
		
	})
	.fail(reject => console.log(reject)) 
	
	$(event.currentTarget.parentElement.parentElement.parentElement).empty();
}

function getCmtDetailList(albumNo,replyNo){
	
	let target = event.currentTarget.parentElement.nextElementSibling.firstElementChild;
	
	$.ajax('../cmt/cmtList',{
		type: 'post',
		data : {albumNo : albumNo, cmtParent : replyNo}
	})
	.done(result=>{
		$.each(result,function(index,cmt){
			
			let repDate = new Date(cmt.replyDate);  //Date객체 생성		
			
			let cmtWriter = cmt.userName;
			
			createCmtDetailList(cmt.replyNo, cmt.content, cmt.userName, repDate, target, cmtWriter);
		})
	})
	.fail(reject => console.log(reject))
}

function showCmtDetail(repState){

	let target = $(event.currentTarget.parentElement).next();
	
	if(!target.is(':empty')){
		target.empty();
		return;
	}
	
	target.empty();
	
	let albumNo = event.currentTarget.parentElement.parentElement.parentElement.previousElementSibling.value;
	let replyNo = event.currentTarget.parentElement.previousElementSibling.previousElementSibling.lastElementChild.value
		
	let addBtn = $('<button>').attr("class","btn btn-primary").attr("type","button").attr("onclick","AddDetailCmt()").text("입력");
	let subDiv = $('<div>').attr("class","input-group-append");
	let inputBox = $('<input>').attr("type","text").attr("class","form-control").attr("id","DetailCmtInput").attr("maxlength",50);
	let replyNoInput = $('<input>').attr("type","hidden").attr("value",replyNo);
	let mainDiv = $('<div>').attr("class","input-group mb-4").css("padding-top", 10);
	let repPlace = $('<div>');
	
	subDiv.append(addBtn);
	mainDiv.append(repPlace);
	mainDiv.append(inputBox);
	mainDiv.append(subDiv);
	mainDiv.append(replyNoInput);

	console.log(repState);
	
	if(repState=="B202"){
		mainDiv.empty();
	}
	
	target.append(repPlace);
	target.append(mainDiv);
	
	getCmtDetailList(albumNo, replyNo);
}

function AddDetailCmt(){
	let replyNo = event.currentTarget.parentElement.parentElement.lastElementChild.value;
	let content = event.currentTarget.parentElement.parentElement.firstElementChild.value;
	let userName = $('#cmtUserName').val();
	let albumNo = event.currentTarget.parentElement.parentElement.parentElement.parentElement.parentElement.previousElementSibling.value;	
	
	let target = event.currentTarget.parentElement.parentElement.previousElementSibling;
	
	console.log(target);
	
	let cmtInfo = {}
	
	cmtInfo.albumNo = albumNo;
	cmtInfo.content = content;
	cmtInfo.parentReplyNo = replyNo;
	cmtInfo.userName = userName;
	
	if(content == ''){
		alert('내용이 입력되지 않았습니다.');
		$('#DetailCmtInput').focus();
		return;
	}
	
	console.log(cmtInfo)
	
	$.ajax('../cmt/cmtInsert',{
		type: 'post',
		contentType : 'application/json',
		data : JSON.stringify(cmtInfo)
	})
	.done(result=>{
		$('#DetailCmtInput').val('');
		
 		let repDate = new Date(result.result.replyDate);  //Date객체 생성
		let replyNo = result.result.replyNo;
 		let cmtContent = result.result.content;
 		let cmtUserName = result.result.userName;
 		
 		let cmtWriter = cmtUserName;
 		
 		createCmtDetailList(replyNo, content, userName, repDate, target, cmtWriter);
		
	})
	.fail(reject => console.log(reject))
}

function createCmtDetailList(replyNo, content, userName, repDate, target, cmtWriter){
	
	let targetPlace = $(target);
	
	let year = repDate.getFullYear();
	let month = repDate.getMonth() +1;
	let day = repDate.getDate();
	
	let reportBtn =
		`<div class="btn pr-0" role="group">
		    <button id="btnGroupDrop2" type="button" class="btn btn-danger" data-toggle="dropdown"
		       aria-haspopup="true" aria-expanded="false">
		       신고
		    </button>
		    <div class="dropdown-menu" aria-labelledby="btnGroupDrop2">

		       <a class="dropdown-item" href="#" onclick="rptInsert('A201')">음란물</a>
		       <a class="dropdown-item" href="#" onclick="rptInsert('A203')">욕설</a>
		       <a class="dropdown-item" href="#" onclick="rptInsert('A202')">기타</a>

		    </div>
		</div>`;
	
	let cmtReplyNo = $('<input>').attr("type","hidden").attr("name","thisReplyNo").val(replyNo);
	let modBtn = $('<button>').attr("class","btn btn-primary").text("수정").attr("onclick","addModInput()");
	let delBtn = $('<button>').attr("class","btn btn-secondary").text("삭제").attr("onclick","delCmt()");
	let cmtCont = $('<span>').text("  └ " + content);
	let writer = $('<span>').text(userName);
	let writeDate = $('<span>').text(year+"."+month+"."+day);
	let subDiv = $('<div>');
	let mainDiv = $('<div>').attr("class","d-flex flex-wrap align-items-center justify-content-between");
	let totDiv = $('<div>');
	let modinputDiv = $('<div>');
	
	let memberId = $('#cmtUserName').val();
	let authority = $('#hiddenMemberAuthority').val();
	
	subDiv.append(writer);
	subDiv.append('&ensp;');
	subDiv.append(writeDate);
	subDiv.append('&ensp;');
	
	if(cmtWriter != memberId){
		subDiv.append(reportBtn);
	}
	
	if(cmtWriter == memberId){
		subDiv.append(modBtn);
		subDiv.append(delBtn);
	}
	
	mainDiv.append(cmtCont);
	mainDiv.append(subDiv);
	mainDiv.append(cmtReplyNo);
	
	totDiv.append(mainDiv);
	totDiv.append(modinputDiv);
	
	targetPlace.append(totDiv);
}

function clickLike(){
	let heart = $(event.currentTarget.firstElementChild);
	let albumNo = event.currentTarget.dataset.value;
	let memberId = event.currentTarget.dataset.memid;	
	
	//let target = $(event.currentTarget.nextElementSibling.lastElementChild);
	let target = $("#sp"+ albumNo);
	
	let likeCnt = target.text();
	
	console.log(likeCnt);
	
	let likeVO = {};
	likeVO.albumNo = albumNo;
	likeVO.memberId = memberId;
	
	if(heart.attr("fill") == "none"){
		$(event.currentTarget.firstElementChild).attr("fill","pink");	
		
	 	$.ajax('../like/likeInsert',{
			type: 'post',
			async : false,
			contentType : 'application/json',
			data : JSON.stringify(likeVO)
		})
		.done(result=>{
			likeNo = result.result.likeNo;
			likeVO.likeNo = likeNo;
		})
		.fail(reject => console.log(reject)) 	
		
		$.ajax('../album/albumAddLikeCnt',{
			type: 'get',
			async : false,
			data : {albumNo: albumNo}
		})
		.done(result=>{
			
		})
		.fail(reject => console.log(reject)) 
		
		likeCnt = parseInt(likeCnt) + 1;	 	
	 	target.text(likeCnt);
		
		
	}else{
		$(event.currentTarget.firstElementChild).attr("fill","none");
		
		console.log(likeVO);
		
	 	$.ajax('../like/likeDelete',{
			type: 'post',
			contentType : 'application/json',
			async : false,
			data : JSON.stringify(likeVO)
		})
		.done(result=>{	
		})
		.fail(reject => console.log(reject))
		
		$.ajax('../album/albumMinusLikeCnt',{
			type: 'get',
			async : false,
			data : {albumNo: albumNo}
		})
		.done(result=>{
			
		})
		.fail(reject => console.log(reject)) 

		likeCnt = parseInt(likeCnt) - 1;

	 	target.text(likeCnt);

	}
}

$( document ).ready(function() {
	$("[name='likeHide']").next().remove();
});

function showMonth(value){
	location.href='../album/albumList?albumType=month&albumValue='+value;
}

function sleep(sec) {
    let start = Date.now(), now = start;
    while (now - start < sec * 1000) {
        now = Date.now();
    }
}

function downTotImg(albumNo){
	$.ajax('../img/imageAlbumList',{
		type: 'post',
		contentType : 'application/json',
		data : JSON.stringify(albumNo)
	})
	.done(result=>{
		let downVO = {};
		downVO.albumNo = albumNo;
		downVO.downCnt = result.imgs.length;
		
		$.ajax('../album/insertDownHistory',{
			type: 'post',
			contentType : 'application/json',
			data : JSON.stringify(downVO)
		})
		.done(res=>{
			let downNo = res;
			$.each(result,function(idx,imgs){
				$.each(imgs,function(index,img){
					location.href='${pageContext.request.contextPath }/download?imgNo='+ img.imgNo;
					sleep(0.2);
					addDownDetailHistory(downNo, img.imgNo);
				})
			})
		})
		.fail(reject => console.log(reject)) 	
		
	})
	.fail(reject => console.log(reject))
}

function downImg(imgNo, albumNo){	
	let downVO = {};
	downVO.albumNo = albumNo;
	downVO.downCnt = 1;
	
	$.ajax('../album/insertDownHistory',{
		type: 'post',
		contentType : 'application/json',
		data : JSON.stringify(downVO)
	})
	.done(result=>{
		addDownDetailHistory(result, imgNo);
	})
	.fail(reject => console.log(reject)) 
	
	location.href='${pageContext.request.contextPath }/download?imgNo='+ imgNo;
}

function addDownDetailHistory(downNo, imgNo){
	let downDetailVO = {};
	downDetailVO.imgNo = imgNo;
	downDetailVO.downNo = downNo;
	
	$.ajax('../album/insertDownDetailHistory',{
		type: 'post',
		contentType : 'application/json',
		data : JSON.stringify(downDetailVO)
	})
	.done(result=>{
		
	})
	.fail(reject => console.log(reject)) 
}

// 댓글 신고
function rptInsert(type) {
    
	let replyNo = $(event.currentTarget.parentElement.parentElement.parentElement.parentElement.firstElementChild.nextElementSibling.nextElementSibling).val(); 
	let writer = $(event.currentTarget.parentElement.parentElement.parentElement.firstElementChild).text();	
	let reporter = $('#hiddenMemberId').val();
 	let contentsType = 'A301';
 	let content = $(event.currentTarget.parentElement.parentElement.parentElement.parentElement.firstElementChild).text();
 	
	var obj = {};
	
	obj["contentsNo"] = replyNo;
	obj["memberId"] = writer;
	obj["reportType"] = type;
	obj["contentsType"] = contentsType;
	obj["reporterId"] = reporter;
	obj["content"] = content;

	
	$.ajax({
		url:'${pageContext.request.contextPath }/report/reportInsert',
		type:'post', 
		contentType:'application/json',
		data: JSON.stringify(obj)
	})
	.done(data=>{
		if(data=='success'){
			$('.done').text('정상적으로 신고되었습니다.');
			$('#done').show();
		}else{
			$('.err').text('이미 신고한 댓글입니다.');
			$('#err').show();
		}
	})
	.fail(err=>{
		$('.err').text(err);
		$('#err').show();		
	});
};

$('.xBtn').on('click',function(){
	$('.layer').hide();
})

</script>         
</body>
</html>
