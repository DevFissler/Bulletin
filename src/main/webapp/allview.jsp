<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.ac.kopo.ctc.kopo23.domain.BoardItem"%>
<%@ page import="kr.ac.kopo.ctc.kopo23.dao.BoardItemDao"%>
<%@ page import="kr.ac.kopo.ctc.kopo23.dao.BoardItemDaoImpl"%>
<%@ page import="kr.ac.kopo.ctc.kopo23.service.BoardItemService"%>
<%@ page import="kr.ac.kopo.ctc.kopo23.service.BoardItemServiceImpl"%>
<%@ page import="kr.ac.kopo.ctc.kopo23.service.dto.Pagination"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
a {
	text-decoration: none;
}
</style>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<% 
	int pages=Integer.parseInt(request.getParameter("page"));
	BoardItemDao boardItemDao = new BoardItemDaoImpl();
	BoardItemService boardItemService = new BoardItemServiceImpl();
	Pagination pagination = boardItemService.getPagination(pages,10,20,boardItemDao.count());
	pageContext.setAttribute("pagination", pagination);
	List<BoardItem> boardItems  = boardItemDao.selectAll(pages,20);
	pageContext.setAttribute("boardItems", boardItems);
	%>

	<div class='container-fluid'>
		<table class='table table-bordered'>
			<thead>
				<tr>
					<center>
						<b>자유게시판 - 전체 리스트</b>
					</center>
				</tr>
				<tr>
					<th width=100px height=40px>게시글 번호</th>
					<th width=500px>제목</th>
					<th width=100px>작성일</th>
					<th width=50px>조회수</th>
				</tr>
			</thead>
			<%
		if(boardItemDao.count() !=0){
	%>

			<tbody>
				<c:forEach var="item" items="${boardItems}">
					<tr>
						<th width=100px height=30px>${item.id}</th>
						<td><a href=oneview.jsp?id=${item.id}>${item.title}</a></td>
						<td><b>${item.created}</b></td>
						<td><b>${item.view}</b></td>
					</tr>
				</c:forEach>
		</table>
	</div>
	<center>
		<div>
			<b> <a href=allview.jsp?page=${pagination.pp}>&nbsp<<&nbsp</a><a
				href=allview.jsp?page=${pagination.p}>&nbsp<&nbsp</a> <c:forEach
					var="i" begin="${pagination.start}" end="${pagination.end}">
					<a href=allview.jsp?page=${i}>&nbsp${i}&nbsp</a>
				</c:forEach> <a href=allview.jsp?page=${pagination.n}>&nbsp>&nbsp</a><a
				href=allview.jsp?page=${pagination.nn}>&nbsp>>&nbsp</a></b>
		</div>
	</center>

	<%
		} else {
   %>
	<tbody>
		<tr>
			<td colspan="4"><center>게시글이 없습니다.</center></td>
		</tr>
	</tbody>
	</table>
	</div>

	<%
		}
   %>

	<button style="margin-left: 95.7%; width: 70px;"
		onClick="location.href='insert.jsp'">신규</button>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>