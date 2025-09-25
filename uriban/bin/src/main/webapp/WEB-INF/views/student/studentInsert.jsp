<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>학생 등록</h4>
	<form action="insertStudent" method="post">
		<div><label>학생 번호<input name="studentNo" type="number" required="required"></label></div>
		<div><label>반 아이디<input name="classId" type="text" required="required"></label></div>
		<div><label>이름<input name="studentName" type="text" required="required"></label></div>
		<div><label>아이디<input name="studentId" type="text" required="required"></label></div>
		<div><label>이메일<input name="studentEmail" type="email"></label></div>
		<div><label>생년월일<input name="birthday" type="date" required="required"></label></div>
		<div><label>성별<input name="studentSex" type="text" required="required"></label></div>
		<div><label>사진<input name="studentImg" type="file"></label></div>
		<div><label>특이사항<input name="remark" type="text"></label></div>
		<div><label>알레르기 여부<input type="checkbox" value="1">1</label></div>
		<button type="reset">취소</button>
		<button type="submit">등록</button>
	</form>
</body>
</html>