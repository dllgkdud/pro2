<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, kr.co.myshop.vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<body>
<%@ include file="../header.jsp" %>
<%
	Notice vo= (Notice) request.getAttribute("notice");
%>
<div class="content container">
	<h2 class="title">공지사항 목록</h2>
	<table class="table">
		<tbody>
			<tr>
				<th>번호</th>
				<td><%=vo.getNotNo() %></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><%=vo.getTitle() %></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><%=vo.getContent() %></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=vo.getAuthor() %></td>
			</tr>
			<tr>
				<th>작성일</th>
				<td><%=vo.getResDate() %></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td><%=vo.getVisited() %></td>
			</tr>
		</tbody>
	</table>
	<div class="btn-group">
		<a href="GetBoardListCtrl" class="btn btn-dark">목록으로</a>
		<% if(sid!=null && sid.equals("admin")) { %>
		<a href="UpdateBoardCtrl?notNo=<%=vo.getNotNo() %>" class="btn btn-light">글 수정</a>
		<a href="DeleteBoardCtrl?notNo=<%=vo.getNotNo() %>" class="btn btn-dark">글 삭제</a>
		<% } %>
	</div>
</div>
</body>
</html>