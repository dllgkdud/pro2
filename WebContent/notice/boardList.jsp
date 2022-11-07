<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, kr.co.myshop.vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%@ include file="../header.jsp" %>
<%
	List<Notice> notList = (ArrayList<Notice>) request.getAttribute("notList");
%>
<div class="content container">
	<h2 class="title">공지사항 목록</h2>
	<table class="table">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
		<% for(int i=0; i<notList.size(); i++){
			Notice vo = notList.get(i);
		%>
			<tr>
				<td><%=vo.getNotNo() %></td>
				<td><a href="GetBoardDetailCtrl?notNo=<%=vo.getNotNo() %>"><%=vo.getTitle() %></a></td>
				<td><%=vo.getResDate() %></td>
			</tr>
		<%
			}
		%>
		</tbody>
	</table>
	<% if(sid!=null && sid.equals("admin")) { %>
	<div class="btn-group">
		<a href="./notice/insertBoard.jsp" class="btn btn-dark">글 등록</a>
	</div>
	<% } %>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>