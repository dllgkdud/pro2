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
	Notice vo = (Notice) request.getAttribute("notice");
%>
<div class="content container">
	<h2 class="title">공지사항 수정</h2>
	<form name="frm" id="frm" action="UpdateBoardProCtrl" method="post" >
		<table class="table">
			<tbody>
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="title" id="title" class="form-control" value="<%=vo.getTitle() %>" required>
						<input type="hidden" name="notNo" id="notNo" value="<%=vo.getNotNo() %>" required>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea cols="100" rows="10" maxlength="1000" name="content" id="content" class="form-control" required><%=vo.getContent() %></textarea></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="author" id="author" value="admin" class="form-control" value="admin" readonly></td>
				</tr>
			</tbody>
		</table>
		<div class="btn-group">
			<input type="reset" name="reset-btn" class="btn btn-light" value="취소">
			<input type="submit" name="submit-btn" class="btn btn-dark" value="글 수정">
			<a href="GetBoardListCtrl" class="btn btn-dark">목록으로</a>
		</div>
	</form>
</div>
</body>
</html>