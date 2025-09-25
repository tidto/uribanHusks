<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
</style>
</head>
<body>
<div class="card">
	<div class="card-body">
		<div class="d-flex justify-content-start breadcrumb-content">
			<h5>오답노트</h5>
		</div>
	</div>
</div>

	<form name="subiectfrm" action="${pageContext.request.contextPath}/test/wrongnote">
		<input type="hidden" name="pageNo" value="1">
		<div class="input-group mb-4">
	    	<div class="input-group-prepend">
	    		<label class="input-group-text" for="inputGroupSelect01">선택보기</label>
	    	</div>
	    	<select class="custom-select" id="subjectNo" name="subjectNo">
	       		<option value="" selected>전체목록</option>
	       		<option value="C201">국어</option>
	       		<option value="C202">수학</option>
	       		<option value="C203">영어</option>
	    	</select>
	    </div>
	     <div class="d-flex justify-content-end form-group">
		    <span class="mr-2" > 제출일자로 조회 </span>
		    <input type="date" class="form-control col-sm-1" max="${lastDay }" min="${firstDay }" name="startDt" id="startDt">
		    <span class="ml-2 mr-2" > ~ </span>
		    <input type="date" class="form-control col-sm-1" max="${lastDay }" min="${firstDay }" name="endDt" id="endDt">
		    <button id="searchBtn" type="button" class="btn btn-primary ml-2"  onclick="searchDate()">검색</button>
	     </div>
    </form>
   
	<div class="container-fluid">
       <div class="row">
       	<c:forEach items ="${pageList}" var="list">
        	<c:if test="${list.testType eq 'C501'}">
	        	<div class="col-md-6 col-lg-4 col-sm-6 testList" id="testList">
	              <div class="card">
		              <div class="card-header">
	                    과제 제출일 : <fmt:formatDate value="${list.submitDate}" pattern="yyyy-MM-dd"/>
	                  </div>
	                 <c:if test="${empty list.testImg}">
		                  <img src="../assets/images/page-img/07.jpg" class="card-img-top" alt="#">
					  </c:if>				  
		              <c:if test="${not empty list.testImg}">
		                  <img src="${pageContext.request.contextPath }/testBank/img/${list.testImg}" class="card-img-top" alt="#">
		              </c:if>
	                 <div class="card-body">
						<div class="input-group mb-4">
							<div class="input-group-prepend">
	                          		<label class="input-group-text" for="inputGroupSelect01">배점</label>
	                       	</div>
					    	<input type="text" class="form-control" name="testScore" id="testScore-${list.testNo}"
	                        aria-describedby="basic-addon1" value="${list.testScore}" readonly>
		    		   </div>
	                   <div class="input-group mb-4">
	                     <div class="input-group-prepend">
	                        <span class="input-group-text" id="basic-addon1">문제</span>
	                     </div>
	                     <input type="text" class="form-control" name="testDetail" id="testDetail-${list.testNo}"
	                        aria-describedby="basic-addon1" value="${list.testDetail}" readonly>
	                  </div>
	                  
                  		<div class="input-group mb-4">
		                     <div class="input-group-prepend">
		                        <span class="input-group-text" id="basic-addon1">정답</span>
		                     </div>
		                     <input type="text" class="form-control" name="testCorrect" id="testCorrect-${list.testNo}"
		                        aria-describedby="basic-addon1" value="${list.testCorrect}" readonly>
		                  </div>

						<div class="input-group mb-4">
		                     <div class="input-group-prepend">
		                        <span class="input-group-text" id="basic-addon1">해설</span>
		                     </div>
		                     <input type="text" class="form-control" name="testCommentary" id="testCommentary-${list.testNo}"
		                        aria-describedby="basic-addon1" value="${list.testCommentary}" readonly>
		                  </div>	

             			<div class="input-group mb-4">
		                     <div class="input-group-prepend">
		                        <span class="input-group-text" id="basic-addon1">제출한답</span>
		                     </div>
		                     <input type="text" class="form-control" name="testAnswer-${list.testNo}"
		                        aria-describedby="basic-addon1" value="${list.studentAnswer}" readonly>
		                  </div>
		                  
		                  <div class="input-group mb-4">
		                     <div class="input-group-prepend">
		                        <span class="input-group-text" id="basic-addon1">오답메모</span>
		                     </div>
		                     <input type="text" class="form-control" name="wrongMemo" data-no="${list.studentAnswerNo}"
		                        aria-describedby="basic-addon1" value="${list.wrongMemo}">
		                  </div>
		                  	 
		                  <input type="hidden" value="${list.correctOrWrong}" name="correctOrWrong" />	                  
	                 </div>
	              </div>
	           </div>
           	</c:if>
           	<c:if test="${list.testType eq 'C502'}">
           		<div class="col-md-6 col-lg-4 col-sm-6 testList" id="testList">
	              <div class="card">
	              	  <div class="card-header">
	                     과제 제출일 : <fmt:formatDate value="${list.submitDate}" pattern="yyyy-MM-dd"/>
	                  </div>
	                  <c:if test="${empty list.testImg}">
		                  <img src="../assets/images/page-img/07.jpg" class="card-img-top" alt="#">
					  </c:if>				  
		              <c:if test="${not empty list.testImg}">
		                  <img src="${pageContext.request.contextPath }/testBank/img/${list.testImg}" class="card-img-top" alt="#">
		              </c:if>
	                 <div class="card-body">
						<div class="input-group mb-4">
							<div class="input-group-prepend">
	                          		<label class="input-group-text" for="inputGroupSelect01">배점</label>
	                       	</div>
					    	<input type="text" class="form-control" name="testScore" id="testScore-${list.testNo}"
	                        aria-describedby="basic-addon1" value="${list.testScore}" readonly>
		    		   </div>
	                   <div class="input-group mb-4">
	                     <div class="input-group-prepend">
	                        <span class="input-group-text" id="basic-addon1">문제</span>
	                     </div>
	                     <input type="text" class="form-control" name="testDetail" id="testDetail-${list.testNo}"
	                        aria-describedby="basic-addon1" value="${list.testDetail}" readonly>
	                  </div>
                  		<c:forEach items="${list.answerList}" var="ta">
                  		 <div class="input-group mb-4">
		                     <div class="input-group-prepend">
		                        <span class="input-group-text" id="basic-addon1">보기</span>
		                     </div>
		                     <input type="text" class="form-control" name="answers" id="answers"
		                        aria-describedby="basic-addon1" value="${ta.testAnswer}" readonly>
		                  </div>
                  		</c:forEach>

                  		<div class="input-group mb-4">
		                     <div class="input-group-prepend">
		                        <span class="input-group-text" id="basic-addon1">정답</span>
		                     </div>
		                     <input type="text" class="form-control" name="testCorrect" id="testCorrect-${list.testNo}"
		                        aria-describedby="basic-addon1" value="${list.testCorrect}" readonly>
		                  </div>

						<div class="input-group mb-4">
		                     <div class="input-group-prepend">
		                        <span class="input-group-text" id="basic-addon1">해설</span>
		                     </div>
		                     <input type="text" class="form-control" name="testCommentary" id="testCommentary-${list.testNo}"
		                        aria-describedby="basic-addon1" value="${list.testCommentary}" readonly>
		                  </div>

             			<div class="input-group mb-4">
		                     <div class="input-group-prepend">
		                        <span class="input-group-text" id="basic-addon1">제출한답</span>
		                     </div>
		                     <input type="text" class="form-control" name="testAnswer-${list.testNo}"
		                        aria-describedby="basic-addon1" value="${list.studentAnswer}" readonly>
		                  </div>
		                  
		                  <div class="input-group mb-4">
		                     <div class="input-group-prepend">
		                        <span class="input-group-text" id="basic-addon1">오답메모</span>
		                     </div>
		                     <input type="text" class="form-control" name="wrongMemo" data-no="${list.studentAnswerNo}"
		                        aria-describedby="basic-addon1" value="${list.wrongMemo}" maxlength="300">
		                  </div>
		                  
		                  <input type="hidden" value="${list.correctOrWrong}" name="correctOrWrong" />
	                 </div>
	              </div>
	           </div>
           	</c:if> 	
          </c:forEach>         
    	</div>
    	<!-- page el 사용 -->
		<ul class="pagination justify-content-center">
			<c:choose>
				<c:when test="${page.startPage eq page.pageNo}">
					<li class="page-item disabled"><a class="page-link" href="#"
						tabindex="-1" aria-disabled="true">이전</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="javascript:goPage(${page.pageNo-1})">이전</a></li>
				</c:otherwise>
			</c:choose>
			<c:forEach var="pages" begin="${page.startPage}"
				end="${page.endPage}">
				<c:if test="${page.pageNo ne pages}">
					<li class="page-item"><a class="page-link"
						href="javascript:goPage(${pages})">${pages}</a></li>
				</c:if>
				<c:if test="${page.pageNo eq pages}">
					<li class="page-item active" aria-current="page"><a
						class="page-link" href="javascript:goPage(${pages})">${pages}<span
							class="sr-only">(current)</span></a></li>
				</c:if>
			</c:forEach>
			<c:choose>
				<c:when test="${page.endPage eq page.pageNo}">
					<li class="page-item disabled"><a class="page-link" href="#"
						tabindex="-1" aria-disabled="true">다음</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="javascript:goPage(${page.pageNo+1})">다음</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
		<div class="d-flex justify-content-end">
			<button id="saveBtn" type="button" class="btn btn-primary m-2"  onclick="saveMemo()">오답메모 저장</button>
		</div>  
    </div>
<div class="alert text-white bg-info layer" id="done" role="alert">
	<div class="iq-alert-text done">
		A simple <b>info</b> alert—check it out!
	</div>
<button type="button" class="close close1">
	<i class="ri-close-line"></i>
</button>
</div>

<div class="alert text-white bg-danger layer " id="err" role="alert">
	<div class="iq-alert-text err">
		A simple <b>info</b> alert—check it out!
	</div>
<button type="button" class="close close1">
			<i class="ri-close-line"></i>
	</button>
</div>   
</body>
<script>
$('.close1').on('click', function() {
	$('.layer').hide();
})

//필터링 시작
$('#subjectNo').val("${param.subjectNo}");
$('#subjectNo').on('change', function(){
	goPage(1)
});

function searchDate(){
	let startDt = $('#startDt').val();
	let endDt = $('#endDt').val();
	
	const date1 = new Date(startDt);
	const date2 = new Date(endDt);
	
	if(date1 > date2){
		$('.err').text('시작일이 종료일보다 큽니다.');
		$('#err').show();
		return;
	}
	
	goPage(1);
}

function goPage(pageNo){
	subiectfrm.pageNo.value = pageNo;
	subiectfrm.submit();
}

function saveMemo(){
	let list = [];
	
	$('[name="wrongMemo"]').each(function(i, item){
		let obj = {};
    	obj.wrongMemo = item.value;
    	obj.studentAnswerNo = item.dataset.no;
    	list.push(obj);
    })
	
	$.ajax('../studentAnswer/updateWrongMemo',{
		type: 'post',
		contentType : 'application/json',
		data : JSON.stringify(list)
	})
	.done(result=>{
		console.log(result);
		$('.done').text('저장되었습니다');
		$('#done').show();
		location.href = "../test/wrongnote";
	})
	.fail(reject => console.log(reject)) 
}

// 필터링 끝
</script>
</html>