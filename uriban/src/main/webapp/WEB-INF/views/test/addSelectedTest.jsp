<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제은행에서 Test 선택</title>
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
	<div class="alert text-white bg-danger layer " id="err" role="alert">
		<div class="iq-alert-text err"></div>
		<button type="button" class="close close1">
			<i class="ri-close-line"></i>
		</button>
	</div>
		<form name="subjectfrm" action="${pageContext.request.contextPath}/test/addSeletedTest">
			<input type="hidden" name="pageNo" value="1">
			<div class="input-group mb-4">
		    	<div class="input-group-prepend">
		    		<label class="input-group-text" for="inputGroupSelect01">과목</label>
		    	</div>
		    	<input type="text" class="form-control" aria-describedby="basic-addon1" value="${subjectNo}" readonly>
		    </div>
	    </form>
	    
			<div class="col-xl-12 form-row" id="selectAddBtn">
		 		<button type="button" class="mt-2 btn btn-primary"><i class="ri-bill-fill">선택추가</i></button>
		  	</div>
		    
			<div class="container-fluid">
		         <div class="row">
		         	<c:forEach items ="${pageList}" var="list">
			         	<div class="col-md-6 col-lg-4 col-sm-6 testDiv" id="test-${list.testNo}">
			               <div class="card">
		         			  <input type="hidden" name="testNo" value="${list.testNo}">
		         			  <input type="hidden" name="subjectNo" value="${list.subjectNo}">
							  <div class="checkbox d-inline-block mr-3">
							  	<input type="checkbox" class="checkbox-input" name="checkbox1">
							  </div>
							  <c:if test="${empty list.testImg}">
			                  <img src="../assets/images/page-img/07.jpg" class="card-img-top" alt="#">
							  </c:if>
							  
			                  <c:if test="${not empty list.testImg}">
			                  <img src="../testBank/img/${list.testImg}" class="card-img-top" alt="#">
			                  </c:if>
			                  <div class="card-body">
									<div class="input-group mb-2">
										<div class="input-group-prepend">
			                           		<label class="input-group-text" for="inputGroupSelect01">배점</label>
			                        	</div>
										<select class="custom-select" name="testScore" id="testScore-${list.testNo}">
								       		<option value="" selected>점수를 선택하세요</option>
								       		<option value="1" <c:if test="${list.testScore eq '1'}"> selected </c:if>>1</option>
								       		<option value="2" <c:if test="${list.testScore eq '2'}"> selected </c:if>>2</option>
								       		<option value="3" <c:if test="${list.testScore eq '3'}"> selected </c:if>>3</option>
								       		<option value="4" <c:if test="${list.testScore eq '4'}"> selected </c:if>>4</option>
								       		<option value="5" <c:if test="${list.testScore eq '5'}"> selected </c:if>>5</option>
								    	</select>
					    		   </div>
				                   <div class="input-group mb-2">
				                     <div class="input-group-prepend">
				                        <span class="input-group-text" id="basic-addon1">문제</span>
				                     </div>
				                     <input type="text" class="form-control" name="testDetail" id="testDetail-${list.testNo}"
				                        aria-describedby="basic-addon1" value="${list.testDetail}">
				                  </div>
				                  <c:if test="${list.testType eq 'C502'}">
				                  	<c:forEach items="${list.answers}" var="ta">
				                  		 <div class="input-group mb-2">
						                     <div class="input-group-prepend">
						                        <span class="input-group-text" id="basic-addon1">보기</span>
						                     </div>
						                     <input type="text" class="form-control" name="answers" id="answers"
						                        aria-describedby="basic-addon1" value="${ta.testAnswer}">
						                  </div>
				                  	</c:forEach>
				                  </c:if>
				                  
				                  <div class="input-group mb-4">
				                     <div class="input-group-prepend">
				                        <span class="input-group-text" id="basic-addon1">정답</span>
				                     </div>
				                     <input type="text" class="form-control" name="testCorrect" id="testCorrect-${list.testNo}"
				                        aria-describedby="basic-addon1" value="${list.testCorrect}">
				                  </div>
			                  </div>
			               </div>
			            </div>
		            </c:forEach>
		      	</div>
		      	<!-- page el 사용 -->
				<ul class="pagination">
					<c:choose>
						<c:when test="${page.startPage eq page.pageNo}">
							<li class="page-item disabled"><a class="page-link" href="#"
								tabindex="-1" aria-disabled="true">Previous</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="javascript:goPage(${page.pageNo-1})">Previous</a></li>
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
								tabindex="-1" aria-disabled="true">Next</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="javascript:goPage(${page.pageNo+1})">Next</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
	<script>
    // alert 창 닫기
    $('.close1').on('click', function() {
			$('.layer').hide();
	 })
	 
	// 테스트 추가
 	$('#selectAddBtn').on('click', function (){
 		if($('.checkbox-input:checked').length == 0){
    		$('.err').text('문제를 선택하세요');
    		$('#err').show();
 		} else{
			$('.checkbox-input').each(function(i, selected){
	        	if($(selected).prop('checked')==true){
	        		$(opener.document).find("#testList").prepend($(selected).parent().parent().parent().clone());
		    		window.self.close();
	        	}
			})
 			
 		}
 			
 			
	});
	</script>
</body>
</html>