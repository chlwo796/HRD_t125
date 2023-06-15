<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="DBPKG.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역구의원투표</title>
<link rel="stylesheet" href="./css/basic.css">
<script src="./js/jsBasic.js"></script>
<style>
th{
width: 100px;
}
td{
width: 500px;
}
input, select {
	margin-left: 10px;
	height: 20px;
}
.button{
height: 25px;
}
.v_confirm{
margin-left: 10px;
margin-right: 10px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section class="section">
		<h2>투표하기</h2>
		<form action="dbConnection.jsp" method="POST" name="voteForm"
			onsubmit="return inputCheck()">
			<table>
				<tr>
					<th>주민번호</th>
					<td><input type="text" name="v_jumin"> 예 :
						8006153154726</td>
				</tr>
				<tr>
					<th>성명</th>
					<td><input type="text" name="v_name"></td>
				</tr>
				<tr>
					<th>투표번호</th>
					<td><select name="m_no">
							<option value=""></option>
							<option value="1">김후보</option>
							<option value="2">이후보</option>
							<option value="3">박후보</option>
							<option value="4">조후보</option>
							<option value="5">최후보</option>
					</select></td>
				</tr>
				<tr>
					<th>투표시간</th>
					<td><input type="text" name="v_time"></td>
				</tr>
				<tr>
					<th>투표장소</th>
					<td><input type="text" name="v_area"></td>
				</tr>
				<tr>
					<th>유권자확인</th>
					<td><input type="radio" name="v_confirm" value="Y"><span class = "v_confirm">확인</span><input
						type="radio" name="v_confirm" value="N"><span class = "v_confirm">미확인</span></td>
				</tr>
				<tr>
					<th colspan="2"><input type="submit" value="투표하기" class="button"> <input
						type="reset" value="다시하기" onclick="return inputReset()" class="button"></th>
				</tr>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>