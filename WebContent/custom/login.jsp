<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="content container" id="content">
	<h2 class="title">로그인</h2>
	<form name="frm" id="frm" action="<%=request.getContextPath() %>/CustomLoginCtrl" method="post">
		<table class="table">
			<tbody>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="cusId" id="cusId" class="form-control" placeholder="아이디 입력" required /></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="cusPw" id="cusPw" class="form-control" placeholder="비밀번호 입력" required /></td>
				</tr>
			</tbody>
		</table>
		<div class="btn-group">
			<input type="reset" name="reset-btn" class="btn btn-light" value="취소">
			<input type="submit" name="submit-btn" class="btn btn-dark" value="로그인">
			<a href="<%=request.getContextPath() %>/custom/membership.jsp" class="btn btn-dark">회원가입</a>
		</div>
	</form>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>