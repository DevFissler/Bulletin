<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<!-- Latest compiled and minified CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> <!-- 부트 스트랩 사용 -->
</head>

<body>
	<jsp:include page="menu.jsp"></jsp:include> <!-- 모든 페이지 상단에 메뉴바 -->

	<div class="p-5 bg-primary text-white">
		<div class="container">
			<h1>Welcome to Free Bulletin</h1>		
		</div>
	</div>
	<div class="container" style="height: 800px;"> 
		
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>