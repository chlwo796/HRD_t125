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
width: 200px;
text-align: center;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section class="section">
<h2>후보조회</h2>
<table>
<tr>
<th>후보번호</th>
<th>성명</th>
<th>소속정당</th>
<th>학력</th>
<th>주민번호</th>
<th>지역구</th>
<th>대표전화</th>
</tr>
<%
String sql = "SELECT m.M_NO, m.M_NAME, p.P_NAME, m.P_SCHOOL, m.M_JUMIN, " + 
"m.M_CITY, p.P_TEL1, p.P_TEL2, p.P_TEL3 " + 
"FROM TBL_MEMBER_202005 m, TBL_PARTY_202005 p " +
"WHERE m.P_CODE = p.P_CODE";
Connection con = DBConnecion.getConnection();
PreparedStatement pstmt = con.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
String school = "";
String birth = "";
String sinNumber ="";
while(rs.next()){
	if(rs.getString(4).equals("1")){
		school = "고졸";
	}else if(rs.getString(4).equals("2")){
		school = "학사";
	}else if(rs.getString(4).equals("3")){
		school = "석사";
	}else{
		school = "박사";
	}
	birth = rs.getString(5).substring(0, 6);
	sinNumber = rs.getString(5).substring(6);
	
%>
<tr>
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=school%></td>
<td><%=birth + "-" + sinNumber%></td>
<td><%=rs.getString(6)%></td>
<td><%=rs.getString(7)+"-"+rs.getString(8)+"-"+rs.getString(9)%></td>
</tr>

<%}

DBConnecion.getClose(rs, pstmt, con);
%>
</table>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>