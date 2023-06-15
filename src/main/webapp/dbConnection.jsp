<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.*"%>
<%
request.setCharacterEncoding("UTF-8");
String sql = "INSERT INTO TBL_VOTE_202005 VALUES (?, ?, ?, ?, ?, ?)";
Connection con = DBConnecion.getConnection();
PreparedStatement pstmt = con.prepareStatement(sql);

pstmt.setString(1, request.getParameter("v_jumin"));
pstmt.setString(2, request.getParameter("v_name"));
pstmt.setString(3, request.getParameter("m_no"));
pstmt.setString(4, request.getParameter("v_time"));
pstmt.setString(5, request.getParameter("v_area"));
pstmt.setString(6, request.getParameter("v_confirm"));

pstmt.executeUpdate();

DBConnecion.getClose(pstmt, con);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역구의원투표</title>
<link rel="stylesheet" href="./css/basic.css">
<script src="./js/jsBasic.js"></script>
<style>
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:forward page="inspecSearch.jsp"></jsp:forward>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>