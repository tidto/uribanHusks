<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
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
<c:choose>
	<c:when test="${isDone eq 'do' }">
		<div class="card">
			<div class="card-body">
				<div class="d-flex justify-content-start breadcrumb-content">
					<h5>과제제출</h5>
				</div>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<div class="card">
			<div class="card-body">
				<div class="d-flex justify-content-start breadcrumb-content">
					<h5>정답확인</h5>
				</div>
			</div>
		</div>
	</c:otherwise>
</c:choose>
<sec:authentication property="principal" var="p" />
	<form id="submitForm" name="submitForm" method="post">	
		<input type="hidden" value="${homeworkNo }" name="homeworkNo" />
		<input type="hidden" value="${p.memberId }" name="memberId" />
		<input type="hidden" value="${isDone }" id="isDone" />
		<div class="container-fluid">
	       <div class="row">
	       	<c:forEach items ="${testBankList}" var="list">
	        	<c:if test="${list.testType eq '주관식'}">
		        	<div class="col-md-6 col-lg-4 col-sm-6 testList" id="testList">
		              <div class="card">
		       			  <input type="hidden" id="testNo" name="testNo" value="${list.testNo}">
		       			  <input type="hidden" id="subjectNo" name="subjectNo" value="${list.subjectNo}">
		       			  <input type="hidden" id="testType" name="testType" value="${list.testType}">
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
		                  
		                  <c:choose>
		                  	<c:when test="${isDone eq 'do' }">
		                  		<div class="input-group mb-4">
				                     <div class="input-group-prepend">
				                        <span class="input-group-text" id="basic-addon1">정답</span>
				                     </div>
				                     <input type="text" class="form-control" name="testCorrect" id="testCorrect-${list.testNo}"
				                        aria-describedby="basic-addon1" maxlength="100">
				                  </div>
		                  	</c:when>
		                  	<c:otherwise>
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
				             	<c:forEach items ="${answerList}" var="answerlist">
				             		<c:if test="${answerlist.answerNo eq list.testNo }">
				             			<div class="input-group mb-4">
						                     <div class="input-group-prepend">
						                        <span class="input-group-text" id="basic-addon1">제출한답</span>
						                     </div>
						                     <input type="text" class="form-control" name="testAnswer-${list.testNo}"
						                        aria-describedby="basic-addon1" value="${answerlist.studentAnswer}" readonly>
						                  </div>
						                  <input type="hidden" value="${answerlist.correctOrWrong}" name="correctOrWrong" />
				             		</c:if>
				             	</c:forEach>
				             	
		                  	</c:otherwise>
		                  </c:choose>	                  
		                 </div>
		              </div>
		           </div>
	           	</c:if>
	           	<c:if test="${list.testType eq '객관식'}">
	           		<div class="col-md-6 col-lg-4 col-sm-6 testList" id="testList">
		              <div class="card">
		       			  <input type="hidden" id="testNo" name="testNo" value="${list.testNo}">
		       			  <input type="hidden" id="subjectNo" name="subjectNo" value="${list.subjectNo}">
		       			  <input type="hidden" id="testType" name="testType" value="${list.testType}">
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
		                  
		                  <c:choose>
		                  	<c:when test="${isDone eq 'do' }">
		                  		<c:forEach items="${list.answerList}" var="ta">
		                  		 <div class="input-group mb-4">
				                     <div class="input-group-prepend">
				                        <span class="input-group-text" id="basic-addon1">보기</span>
				                     </div>
				                     <input type="text" class="form-control" name="answers" id="answers"
				                        aria-describedby="basic-addon1" value="${ta.testAnswer}" readonly>
				                     <input type='radio' name="chk-${list.testNo}" value="${ta.testAnswer}"/>
				                  </div>
		                  		</c:forEach>
		                  	</c:when>
		                  	<c:otherwise>
		                  		<c:forEach items="${list.answerList}" var="ta">
		                  		 <div class="input-group mb-4">
				                     <div class="input-group-prepend">
				                        <span class="input-group-text" id="basic-addon1">보기</span>
				                     </div>
				                     <input type="text" class="form-control" name="answers" id="answers"
				                        aria-describedby="basic-addon1" value="${ta.testAnswer}" readonly>
				                  </div>
		                  		</c:forEach>
		                  		<c:if test="${isDone eq 'done' }">
		                  		<div class="input-group mb-4">
				                     <div class="input-group-prepend">
				                        <span class="input-group-text" id="basic-addon1">정답</span>
				                     </div>
				                     <input type="text" class="form-control" name="testCorrect" id="testCorrect-${list.testNo}"
				                        aria-describedby="basic-addon1" value="${list.testCorrect}" maxlength="100">
				                  </div>
				                  <div class="input-group mb-4">
				                     <div class="input-group-prepend">
				                        <span class="input-group-text" id="basic-addon1">해설</span>
				                     </div>
				                     <input type="text" class="form-control" name="testCommentary" id="testCommentary-${list.testNo}"
				                        aria-describedby="basic-addon1" value="${list.testCommentary}" readonly>
				                  </div>
				                  </c:if>
				             	<c:forEach items ="${answerList}" var="answerlist">
				             		<c:if test="${answerlist.answerNo eq list.testNo }">
				             			<div class="input-group mb-4">
						                     <div class="input-group-prepend">
						                        <span class="input-group-text" id="basic-addon1">제출한답</span>
						                     </div>
						                     <input type="text" class="form-control" name="testAnswer-${list.testNo}"
						                        aria-describedby="basic-addon1" value="${answerlist.studentAnswer}" readonly>
						                  </div>
						                  <input type="hidden" value="${answerlist.correctOrWrong}" name="correctOrWrong" />
				             		</c:if>
				             	</c:forEach>
				             	
		                  	</c:otherwise>
		                  </c:choose>	                  
		                 </div>
		              </div>
		           </div>
	           	</c:if>
	          </c:forEach>         
	    	</div>
	    	<div class="d-flex justify-content-end">
	    	<c:choose>
               	<c:when test="${isDone eq 'do' }">
               	  <button type="submit" class="btn btn-primary mr-2">제출</button>
		          <button type="reset" class="btn btn-danger mr-2">취소</button>
               	</c:when>
               	<c:otherwise>
               	   <div class="mr-3">
               	   <c:if test="${not empty answerList }">
						<h3>점수 : ${answerList[0].totalScore }/100점 , 정답율 : ${answerList[0].answerPercent }</h3>               	   
               	   </c:if>
               	   </div>
               	</c:otherwise>
            </c:choose>
            <c:choose>
				<c:when test="${p.authority eq 'ROLE_A102' }">
					<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/homework/homeworkList'">목록</button>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${empty param.td }">
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/test/testList'">목록</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/test/testList?td=td'">목록</button>
						</c:otherwise>
					</c:choose>
					
				</c:otherwise>
			</c:choose>
	       
	    	</div>  
	    </div>
    </form>
<div class="alert text-white bg-info layer" id="done" role="alert">
	<div class="iq-alert-text done">
		A simple <b>info</b> alert—check it out!
	</div>
<button type="button" class="close close1">
	<i class="ri-close-line"></i>
</button>
</div>   
</body>
<script type="text/javascript">
$('.close1').on('click', function() {
	$('.layer').hide();
})

$('[name="submitForm"]').on('submit', function(event){
	event.preventDefault();
	
	let list = [];
	
	$(".testList").each(function(i, item){
		
		let answerNo = $(item).find('[name="testNo"]').val();
		let studentAnswer = $(item).find('[name="testCorrect"]').val();
		let testType = $(item).find('[name="testType"]').val();
		let chkAnswer = $(item).find('[name="testNo"]').val();
		
		if(testType == '객관식'){
			studentAnswer =  $(item).find('[name="chk-'+answerNo +'"]:checked').val();
			let obj = { answerNo, studentAnswer };
			list.push(obj);	
		}else{
			let obj = { answerNo, studentAnswer };
			list.push(obj);
		}		
	})
	
	let homeworkNo = $('[name="homeworkNo"]').val(); 
	let memberId = $('[name="memberId"]').val();
	
	submit = {homeworkNo, memberId, answer:list};
	console.log(submit);	
	
	$.ajax({
		url:'../submitTest/submitTestInsert',
		type: 'post',
		contentType:'application/json',
		data: JSON.stringify(submit)
	})
	.done(data=>{
		$('.done').text('제출되었습니다.');
		$('#done').show();
		location.href='../test/testList'
	})
	.fail(err=>{});
	
});

$( document ).ready(function() {
    if($('#isDone').val() == 'done'){
    	$(".testList").each(function(i, item){
    		let correctOrWrong = $(item).find('[name="correctOrWrong"]').val();
    		if(correctOrWrong == 'C401'){
    			item.firstElementChild.setAttribute('class', 'card border-primary');
    		}else{
    			item.firstElementChild.setAttribute('class', 'card border-secondary');
    		}
    	})
    }
});

</script>
</html>