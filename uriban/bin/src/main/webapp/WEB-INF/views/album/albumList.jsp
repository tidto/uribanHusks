<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
</style>
</head>
<body>
<div id="albumAll" >
<c:forEach var="album" items="${albumList }">
	<div class="col-lg-6 col-md-6 col-lg-3" style="left: 25%; padding:50px 0 0 0;">
		<div class="card">
			<div class="card-body">
				<div class="d-flex flex-wrap align-items-center justify-content-between mb-3">
                   <div class=".d-inline-block">
                     <select class="form-control form-control-sm .d-inline-block">
                        <option selected="">월을 선택해주세요</option>
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
	                 <button class="btn btn-link mt-2" onclick="location.href='albumUpdate?albumNo=${album.albumNo }'">
	                 <svg class="svg-icon" width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#5773FF" stroke="#5773FF" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
	                     <path d="M5 10c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm14 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm-7 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"></path>
	                 </svg>
	                 </button>
				</div>			
								
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
							<a href="#" class="card-link">#${tag.tag }</a> 
						</c:if> 
					</c:forEach> 
				</c:forEach>
				<div style="padding:10px 0 0 0;">			
					<div class="d-flex flex-wrap align-items-center justify-content-between">       
		               <div class=".d-inline-block">  
		                 <button class="btn btn-link mt-2">
			                 <svg class="svg-icon" width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="pink" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
			                     <path d="M16.5 3C19.538 3 22 5.5 22 9c0 7-7.5 11-10 12.5C9.5 20 2 16 2 9c0-3.5 2.5-6 5.5-6C9.36 3 11 4 12 5c1-1 2.64-2 4.5-2z"></path>
			                 </svg>
		                 </button>
		                 <button class="btn btn-link mt-2" onclick="showModal()" data-value="${album.albumNo }" data-toggle="modal" data-target=".bd-example-modal-xl">
			                 <svg class="svg-icon" width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="#5773FF" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
			                     <path d="M10 3h4a8 8 0 1 1 0 16v3.5c-5-2-12-5-12-11.5a8 8 0 0 1 8-8z"></path>
			                 </svg>
			             </button>
		                 <button class="btn btn-link mt-2">
			                 <svg class="svg-icon" width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#5773FF" stroke="#5773FF" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
			                     <path d="M4 19h16v-7h2v8a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1v-8h2v7zM14 9h5l-7 7-7-7h5V3h4v6z"></path>
			                 </svg>
		                 </button>
		              	<button onclick="showDetail()" class="btn btn-link mt-2" data-value="${album.albumNo }">  
		              		<div class="grid-icon mr-3">
                                <svg width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#5773FF" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <rect x="3" y="3" width="7" height="7"></rect><rect x="14" y="3" width="7" height="7"></rect><rect x="14" y="14" width="7" height="7"></rect><rect x="3" y="14" width="7" height="7"></rect>
                                </svg> 
                            </div>                  
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

<div class="card fixed-bottom" style="left: 14%;">
	<div class="card-body">
	 	<div class="d-flex flex-wrap align-items-center justify-content-around">
	       <button class="btn btn-link mt-2" onclick="goTop()">
	       	Top
	       </button>
	       <button class="btn btn-primary mt-2" onclick="location.href='albumInsert'">
	         <svg class="svg-icon" width="30" height="30" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="white" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
	             <path d="M11 11V5h2v6h6v2h-6v6h-2v-6H5v-2z"></path>
	         </svg>
	        </button> 	
	         <button class="btn btn-link mt-2">
	         <svg class="svg-icon" width="30" height="30" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="pink" stroke="pink" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
	             <path d="M16.5 3C19.538 3 22 5.5 22 9c0 7-7.5 11-10 12.5C9.5 20 2 16 2 9c0-3.5 2.5-6 5.5-6C9.36 3 11 4 12 5c1-1 2.64-2 4.5-2z"></path>
	         </svg>            
	         </button>  
	         <button id="allBtn" class="btn btn-link mt-2"> 
	         <div class="grid-icon">
	             <svg  width="30" height="30" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
	                 <line x1="21" y1="10" x2="3" y2="10"></line><line x1="21" y1="6" x2="3" y2="6"></line><line x1="21" y1="14" x2="3" y2="14"></line><line x1="21" y1="18" x2="3" y2="18"></line>
	             </svg>
	         </div>
	         </button>
	      </div>
   	</div>
</div> 

<!-- Modal -->
<div class="modal fade bd-example-modal-xl" tabindex="-1" role="dialog" aria-hidden="true">
   <div class="modal-dialog modal-xl">
      <div class="modal-content">
         <div class="modal-header">
            <h5 class="modal-title">앨범 댓글창</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
         </div>
         <div class="modal-body" id="cmtPlace">      	 
         </div>
         <div class="modal-footer">
         	<div class="input-group mb-4">
               <input type="text" id="cmt" class="form-control" placeholder="댓글을 입력해주세요">
               <div class="input-group-append">
                  <button class="btn btn-primary" onclick="addCmt()" type="button">입력</button>
                  <input type="hidden" id="cmtAlbumNo" />
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
     
<script type="text/javascript">
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
}

$('#allBtn').click(function(){	
	$('#detailImgBox').empty();
	$('#albumDetail').addClass('d-none');
	$('#albumAll').removeClass('d-none');	
}); 

function getalbumDetailList(albumNo){

	$.ajax('imageAlbumList',{
		type: 'post',
		contentType : 'application/json',
		data : JSON.stringify(albumNo)
	})
	.done(result=>{
		$.each(result,function(idx,imgs){
			let cardGroup = $("<div>").attr("class","card-group");
			let cnt = 0;
			$.each(imgs,function(index,img){
				console.log(img.renameFilename);
				let cardImg = $("<img>").attr("src","${pageContext.request.contextPath }/albumImg/"+img.renameFilename).attr("class","card-img-top").css("height", 300);
				let card = $("<div>").attr("class","card");
				
				card.append(cardImg);
				cardGroup.append(card);
				console.log(index);
				if(index % 3 == 2){
					$('#detailImgBox').append(cardGroup);
					cardGroup = $("<div>").attr("class","card-group");
					cnt++;
				}else if(index - (cnt*3) < 3){
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
	
	//댓글리스트 조회 (ajax)
	getCmtList(albumNo);
}

function getCmtList(albumNo){
	$.ajax('cmtList',{
		type: 'post',
		contentType : 'application/json',
		data : JSON.stringify(albumNo)
	})
	.done(result=>{
		let cmtPlace = $('#cmtPlace');
		$.each(result,function(index,cmt){
			
			let repDate = new Date(cmt.replyDate);  //Date객체 생성
			
			let year = repDate.getFullYear();
			let month = repDate.getMonth();
			let day = repDate.getDate();		
			
			let replyNo = $('<input>').attr("type","hidden").val(cmt.replyNo);
			let viewBtn = $('<button>').attr("class","btn btn-outline-primary mt-2").text("답글보기");
			let writeBtn = $('<button>').attr("class","btn btn-outline-secondary mt-2").text("답글작성");
			let modBtn = $('<button>').attr("class","btn btn-primary mt-2").text("수정").attr("onclick","addModInput()");
			let delBtn = $('<button>').attr("class","btn btn-danger mt-2").text("삭제").attr("onclick","delCmt()");
			let cmtCont = $('<span>').text(cmt.content);
			let writer = $('<span>').text(cmt.userName);
			let writeDate = $('<span>').text(year+"."+month+"."+day);
			let subDiv = $('<div>');
			let mainDiv = $('<div>').attr("class","d-flex flex-wrap align-items-center justify-content-between");
			
			subDiv.append(writer);
			subDiv.append('&ensp;');
			subDiv.append(writeDate);
			subDiv.append('&ensp;');
			subDiv.append(viewBtn);
			subDiv.append(writeBtn);
			subDiv.append(modBtn);
			subDiv.append(delBtn);
			mainDiv.append(cmtCont);
			mainDiv.append(subDiv);
			mainDiv.append(replyNo);
			
			cmtPlace.append(mainDiv);
		})
	})
	.fail(reject => console.log(reject))
}

function addCmt(){
	let albumNo = event.currentTarget.nextElementSibling.value;
	let content = event.currentTarget.parentElement.previousElementSibling.value;
	
	let cmtInfo = {}
	
	cmtInfo.albumNo = albumNo;
	cmtInfo.content = content;
	cmtInfo.parentReplyNo = 0;
	cmtInfo.userName = "사용자2";
	
	if(content == ''){
		alert('내용이 입력되지 않았습니다.');
		$('#cmt').focus();
		return;
	}
	
	
	$.ajax('cmtInsert',{
		type: 'post',
		contentType : 'application/json',
		data : JSON.stringify(cmtInfo)
	})
	.done(result=>{
		$('#cmt').val('');
					
		let cmtPlace = $('#cmtPlace');
		
 		let repDate = new Date(result.result.replyDate);  //Date객체 생성
		
		let year = repDate.getFullYear();
		let month = repDate.getMonth();
		let day = repDate.getDate();		
		
		let replyNo = $('<input>').attr("type","hidden").val(result.result.replyNo);
		let viewBtn = $('<button>').attr("class","btn btn-outline-primary mt-2").text("답글보기");
		let writeBtn = $('<button>').attr("class","btn btn-outline-secondary mt-2").text("답글작성");
		let modBtn = $('<button>').attr("class","btn btn-primary mt-2").text("수정").attr("onclick","addModInput()");
		let delBtn = $('<button>').attr("class","btn btn-danger mt-2").text("삭제").attr("onclick","delCmt()");
		let cmtCont = $('<span>').text(result.result.content);
		let writer = $('<span>').text(result.result.userName);
		let writeDate = $('<span>').text(year+"."+month+"."+day);
		let subDiv = $('<div>');
		let mainDiv = $('<div>').attr("class","d-flex flex-wrap align-items-center justify-content-between");
		
		subDiv.append(writer);
		subDiv.append('&ensp;');
		subDiv.append(writeDate);
		subDiv.append('&ensp;');
		subDiv.append(viewBtn);
		subDiv.append(writeBtn);
		subDiv.append(modBtn);
		subDiv.append(delBtn);
		mainDiv.append(cmtCont);
		mainDiv.append(subDiv);
		mainDiv.append(replyNo);
		
		cmtPlace.append(mainDiv); 
		
	})
	.fail(reject => console.log(reject))
}

function delCmt(){
	let replyNo = event.currentTarget.parentElement.nextElementSibling.value;
	
	event.currentTarget.parentElement.parentElement.remove();
	
	$.ajax('cmtDelete',{
		type: 'get',
		contentType : 'application/json',
		data : { replyNo : replyNo }
	})
	.done(result=>{
			
	})
	.fail(reject => console.log(reject)) 	
}


function addModInput(){	
	//$(event.currentTarget.parentElement.parentElement).empty();
	let replyNo = event.currentTarget.parentElement.nextElementSibling.value;
	let content = event.currentTarget.parentElement.parentElement.firstElementChild.innerHTML;
	
	let addBtn = $('<button>').attr("class","btn btn-primary").attr("type","button").attr("onclick","modCmt()").text("수정");
	let subDiv = $('<div>').attr("class","input-group-append");
	let inputBox = $('<input>').attr("type","text").attr("class","form-control").attr("id","modInput").attr("value",content);
	let replyNoInput = $('<input>').attr("type","hidden").attr("value",replyNo);
	let mainDiv = $('<div>').attr("class","input-group mb-4");
	
	subDiv.append(addBtn);
	mainDiv.append(inputBox);
	mainDiv.append(subDiv);
	mainDiv.append(replyNoInput);
	
	$(event.currentTarget.parentElement.parentElement).append(mainDiv);
}

function modCmt(){
	let replyNo = event.currentTarget.parentElement.parentElement.lastElementChild.value;	
	let content = event.currentTarget.parentElement.parentElement.firstElementChild.value;
	
	if(content == ''){
		alert('내용이 입력되지 않았습니다.');
		$(event.currentTarget.parentElement.parentElement.firstElementChild).focus();
		return;
	}
	
	let contSpan = $(event.currentTarget.parentElement.parentElement.previousElementSibling.firstElementChild);
	
	contSpan.text(content);
	
	console.log(event.currentTarget.parentElement.parentElement.previousElementSibling.firstElementChild);
	
	let cmtVO = {};
	cmtVO.replyNo = replyNo;
	cmtVO.content = content;
	
 	$.ajax('cmtUpdate',{
		type: 'post',
		contentType : 'application/json',
		data : JSON.stringify(cmtVO)
	})
	.done(result=>{
		console.log(result.result.content);	
	})
	.fail(reject => console.log(reject)) 
}

</script>         
</body>
</html>