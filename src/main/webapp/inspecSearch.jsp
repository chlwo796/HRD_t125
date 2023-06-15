<%@page import="java.util.Date"%>
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
td {
	width: 100px;
	text-align: center;
}

td:nth-child(1) {
	width: 80px;
}

td:nth-child(2) {
	width: 150px;
}

td:nth-child(4) {
	width: 70px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section class="section">
		<h2>투표검수조회</h2>
		<table>
			<tr>
				<th>성명</th>
				<th>생년월일</th>
				<th>나이</th>
				<th>성별</th>
				<th>후보번호</th>
				<th>투표시간</th>
				<th>유권자확인</th>
			</tr>
			<%
			request.setCharacterEncoding("UTF-8");
			String sql = "SELECT V_JUMIN, V_NAME, M_NO, V_TIME, " +
			"V_AREA, V_CONFIRM FROM TBL_VOTE_202005";
			Connection con = DBConnecion.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			String year = "";
			String month = "";
			String day = "";
			int age = 0;
			String gender = "";
			String hour = "";
			String minute = "";
			String checkMsg = "";
			Calendar current = Calendar.getInstance();
			int yearNum = 0;
			
			int currentYear = current.get(Calendar.YEAR);
			while(rs.next()){
				year = rs.getString(1).substring(0, 2);
				month = rs.getString(1).substring(2, 4);
				day = rs.getString(1).substring(4, 6);
				yearNum = Integer.parseInt(year);
				
				if(yearNum>(currentYear-2000)){
					age = currentYear-(yearNum+1900);
					year = "19" + year;
				}else{
					age = currentYear - yearNum;
				}
				if(rs.getString(1).substring(6, 7).equals("1")){
					gender = "남";
				}else{
					gender = "여";
				}
				hour = rs.getString(4).substring(0, 2);
				minute = rs.getString(4).substring(2);
				if(rs.getString(6).equals("Y")){
					checkMsg = "확인";
				}else{
					checkMsg = "미확인";
				}
			%>
			<tr>
				<td><%=rs.getString(2)%></td>
				<td><%=year + "년" + month + "월" + day + "일"%></td>
				<td><%="만 " + age + "세" %></td>
				<td><%= gender %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=hour + ":" + minute%></td>
				<td><%=checkMsg%></td>
			</tr>
			<%
			}
			
			DBConnecion.getClose(rs, pstmt, con);
			%>
		</table>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>