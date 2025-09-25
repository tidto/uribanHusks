<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제은행목록</title>
<style type="text/css">
	#selectDelBtn{
		margin-right: 15px;
		margin-bottom: 20px;
		display: flex;
		float: right;
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
</style>
</head>
<body>
	<!-- alert&confirm 디자인 시작 -->
	<div class="alert alert-info layer" data-value="${page.pageNo}" id="cnf1" role="alert">
		<div class="iq-alert-text cnf align-self-center">삭제하시겠습니까?</div>
		<div>
			<button type="button"
				class="btn btn-outline-info float-right close1">취소</button>
			<button type="button" id="ok1" class="btn btn-info float-right">확인</button>
		</div>
	</div>
	<div class="alert alert-info layer" data-value="${page.pageNo}" id="cnf2" role="alert">
		<div class="iq-alert-text cnf align-self-center">수정하시겠습니까?</div>
		<div>
			<button type="button"
				class="btn btn-outline-info float-right close1">취소</button>
			<button type="button" id="ok2" class="btn btn-info float-right">확인</button>
		</div>
	</div>
<%-- 	<div class="alert alert-info layer" data-value="${page.pageNo}" id="cnf2" role="alert"> --%>
<!-- 		<div class="iq-alert-text cnf2 align-self-center"> -->
<!-- 			수정하시겠습니까? -->
<!-- 			<button type="button" id="ok2"  class="btn btn-info float-right">확인</button> -->
<!-- 			<button type="button" class="btn btn-outline-info float-right close1">취소</button> -->
<!-- 		</div> -->
<!-- 	</div> -->
	<div class="alert text-white bg-info layer" id="done" role="alert">
		<div class="iq-alert-text done"></div>
		<button type="button" class="close close1">
			<i class="ri-close-line"></i>
		</button>
	</div>

	<div class="alert text-white bg-danger layer " id="err" role="alert">
		<div class="iq-alert-text err"></div>
		<button type="button" class="close close1">
			<i class="ri-close-line"></i>
		</button>
	</div>
	
	<!-- alert&confirm 디자인 끝 -->
	
	<!-- 내용시작 -->
	<div class="card">
		<div class="card-body">
			<div class="d-flex justify-content-start breadcrumb-content">
				<h5><span>${myClass.schoolName}</span> <span>${myClass.grade}학년</span> <span>${myClass.classes}반</span>  문제은행</h5>
			</div>
		</div>
	</div>
	<div class="card">
		<div class="card-body">
			<form name="subjectfrm" action="${pageContext.request.contextPath}/testBank/testBankList">
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
		    </form>
		    
			<div class="col-xl-12 form-row selPage" data-value="${page.pageNo}">
		 		<button type="button" class="btn btn-warning mt-2" id="selectDelBtn"><i class="ri-delete-bin-2-fill pr-0">선택삭제</i></button>
		  	</div>
		    
			<div class="container-fluid">
         <div class="row">
         	<c:forEach items ="${pageList}" var="list">
	         	<div class="col-md-6 col-lg-4 col-sm-6" id="test-${list.testNo}">
	               <div class="card" data-value="${list.testNo}">
         			  <input type="hidden" name="testNo" value="${list.testNo}">
         			  <input type="hidden" name="subjectNo" value="${list.subjectNo}">
         			  <input type="hidden" name="testType" value="${list.testType}">
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
							<div class="input-group mb-4">
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
							<div class="input-group mb-4">
								<div class="input-group-prepend">
									<span class="input-group-text text-area">문제</span>
								</div>
								<textarea class="form-control" aria-label="With textarea" id="testDetail-${list.testNo}">${list.testDetail}</textarea>
							</div>
							<c:if test="${list.testType eq 'C502'}">
		                  	<c:forEach items="${list.answerList}" var="ta">
		                  		 <div class="input-group mb-2">
				                     <div class="input-group-prepend">
				                        <span class="input-group-text" id="basic-addon1">보기</span>
				                     </div>
				                     <input type="text" class="form-control" name="answers" id="answers"
				                        aria-describedby="basic-addon1" value="${ta.testAnswer}">
				            		 <input type="hidden" value="${ta.answerNo}" name="answerNo">
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
		                  
		                  <div class="d-flex align-items-center justify-content-center">
		 	                 <button class="btn btn btn-success mt-2 rounded-small" onclick="updateTest(${list.testNo})">수정</button>&nbsp;&nbsp;
		                     <button class="btn btn btn-light mt-2 rounded-small" onclick="removeTestBtn()">삭제</button>
		                     <input type="hidden" value="${list.testNo}">
		                  </div>
	                  </div>
	               </div>
	            </div>
            </c:forEach>
      	</div>
      	<!-- page el 사용 -->
		<ul class="pagination d-flex justify-content-center">
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
   		</div>
   </div>
   <script>
   		// alert button 점검
   		$('.close1').on('click', function() {
			$('.layer').hide();
		})
   
   		// 필터링 시작
   		$('#subjectNo').val("${param.subjectNo}");
   		$('#subjectNo').on('change', function(){
   			goPage(1)
   		});
   		
   		function goPage(pageNo){
   			subjectfrm.pageNo.value = pageNo;
   			subjectfrm.submit();
   		}
   		// 필터링 끝
   		
   		// 단건삭제
   		function removeTestBtn(){
   			let testNo = event.currentTarget.nextElementSibling.value;
   				$('#cnf1').show();
   				$('#ok1').click(function(){
   					location.href='../testBank/testBankDelete?testNo='+testNo;
   				})
   		}
   		
   		// 선택삭제
   		$('#selectDelBtn').click(function(){
   			let pageNo = $(event.target).closest(".selPage").data('value');
			$('#cnf1').show();
			$('#ok1').click(function(){
				$('#cnf1').hide();
				
	   			let selectsTest= [];
	   			$('.checkbox-input:checked').each(function(i, selected){
						let obj = {};
						let testNo = $(selected).closest('.card').data('value');
						
						console.log(testNo);
						
						obj["testNo"] = testNo
						
						selectsTest.push(obj);
	   			})
   			
   			$.ajax({
				url:'../testBank/testBankDelete',
				type:'post', 
				contentType:'application/json', 
				data: JSON.stringify(selectsTest) 
			})
			.done(data=>{
					
// 					alert('삭제되었습니다');
		    		location.href='${pageContext.request.contextPath }/testBank/testBankList?pageNo='+pageNo+'&subjectNo=${param.subjectNo}';					
				})
				.fail(err=>{});
			})
		})
		
		function updateTest(data){
			let card = $(event.target).closest(".card");
			let testScore = $('#testScore-'+ data).val();
			let testCorrect = $('#testCorrect-'+data).val();
			let testDetail = $('#testDetail-'+data).val();
			let testNo = data;
			let answerList = [];
			
			let answerNoList = card.find('[name="answerNo"]');
			let testAnswerList = card.find('[name="answers"]');
			
			$(answerNoList).each(function(i, answerNo){
					answerList.push({answerNo:answerNo.value, testAnswer:testAnswerList[i].value})
			})
						
			if(testDetail == '' || testCorrect == ''){
				$('.err').text('입력하세요');
				$('#err').show();
// 				alert('값을 입력하세요')
				return;
			}
			
			$('#cnf2').show();
			$('#ok2').click(function(){
				let pageNo = $(event.target).closest(".layer").data('value');
				$('#cnf2').hide();
				let singleTest = {testNo, testScore, testDetail, testCorrect, data, answerList};
				$.ajax('../testBank/testBankUpdate' ,{
					type : 'POST',
					contentType : 'application/json',
					data : JSON.stringify(singleTest)
				})
				.done(result=>{
					
// 					alert('수정완료');
					location.href='${pageContext.request.contextPath }/testBank/testBankList?pageNo='+pageNo+'&subjectNo=${param.subjectNo}';
				})
				.fail(reject => console.log(reject))
			})
		}
	
   </script>
</body>
</html>