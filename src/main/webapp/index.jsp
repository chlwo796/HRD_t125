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
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section class="section">
<h2>여기에 제목</h2>
<div>
프로그램정보<br>
1. 후보조회<br>
2. 투표하기<br>
3. 투표검수조회<br>
4. 후보자등수<br>
</div>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>