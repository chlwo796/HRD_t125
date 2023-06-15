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
td{
text-align: center;
width: 120px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section class="section">
		<h2>후보자등수</h2>
		<table>
			<tr>
				<th>후보번호</th>
				<th>성명</th>
				<th>총투표건수</th>
			</tr>
			<%
			String sql = "SELECT m.M_NO, m.M_NAME, COUNT(CASE WHEN v.V_CONFIRM = 'Y' THEN 1 END) "
					+ "V_COUNT FROM TBL_VOTE_202005 v, TBL_MEMBER_202005 m "
					+ "WHERE v.M_NO = m.M_NO AND v.V_CONFIRM = 'Y' GROUP BY m.M_NO, m.M_NAME " 
					+ "ORDER BY V_COUNT DESC";
			Connection con = DBConnecion.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
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