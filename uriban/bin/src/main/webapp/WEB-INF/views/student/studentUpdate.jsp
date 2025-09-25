<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 정보 수정</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<h4>학생 정보 수정</h4>
	<form>
		<div>
			<label>학생 번호 : <input type="number" name="studentNo"
				value="${studentInfo.studentNo}" readonly="readonly"></label>
		</div>
		<div>
			<label>학생 ID : <input type="text" name="studentId"
				value="${studentInfo.studentId}"></label>
		</div>
		<div>
			<label>학생 메일 : <input type="text" name="studentEmail"
				readonly="readonly" value="${studentInfo.studentEmail}"></label>
		</div>
		<div>
			<label>학생 이름 : <input type="text" name="studentName"
				value="${studentInfo.studentName}"></label>
		</div>
		<div>
			<label>생년월일 : <input type="date" name="birthday"
				readonly="readonly"
				value='<fmt:formatDate value="${studentInfo.birthday}" pattern="yyyy-MM-dd" />'>
			</label>
		</div>
		<div>
			<label>학생 사진 : <input type="file" name="studentImg"
				value="${studentInfo.studentImg}"></label>
		</div>
		<div>
			<label>성별 : <input type="text" name="studentSex"
				value="${studentInfo.studentSex}"></label>
		</div>
		<div>
			<label>특이사항 : <input type="text" name="remark"
				value="${studentInfo.remark}"></label>
		</div>
		<div>
			<label>알레르기 : <input type="number" name="allergy"
				value="${studentInfo.allergy}"></label>
		</div>
		<button type="reset">취소</button>
		<button type="button">수정</button>
	</form>
	<script>
		
	</script>
</body>
</html>