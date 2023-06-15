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
	<header class="header">
		<h1>(과정평가형 정보처리산업기사) 지역구의원투표 프로그램 ver 2020-5</h1>
	</header>
	<nav class="nav">
		<ul>
			<li><a href="candSearch.jsp">후보조회</a></li>
			<li><a href="voteInsert.jsp">투표하기</a></li>
			<li><a href="inspecSearch.jsp">투표검수조회</a></li>
			<li><a href="candRank.jsp">후보자등수</a></li>
			<li><a href="index.jsp">홈으로</a></li>
		</ul>
	</nav>
</body>
</html>