<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, kr.co.myshop.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품입고</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%@ include file="../header.jsp" %>
<%
	Product vo = (Product) request.getAttribute("pro");
%>
<div class="content container" id="content">
	<h2 class="title">제품 입고</h2>
	<form name="frm" id="frm" action="ProductWearingCtrl" method="post">
		<table class="table">
			<tbody>
				<tr>
					<th>제품이미지</th>
					<td><img src="<%=request.getContextPath() %>/upload/<%=vo.getProPic() %>" alt="<%=vo.getProName() %>"></td>
				</tr>
				<tr>
					<th>제품번호</th>
					<td><%=vo.getProNo() %><br>
						<input type="hidden" name="proNo" id="proNo" value="<%=vo.getProNo() %>">
					</td>
				</tr>
				<tr>
					<th>카테고리번호</th>
					<td><%=vo.getCateNo() %></td>
				</tr>
				<tr>
					<th>제품명</th>
					<td><%=vo.getProName() %></td>
				</tr>
				<tr>
					<th><strong>입고수량</strong></th>
					<td>
						<input type="number" name="amount" id="amount" class="form-control" />
					</td>
				</tr>
			</tbody>
		</table>
		<div class="btn-group">
			<a href="<%=request.getContextPath() %>/GetProductListCtrl" class="btn btn-light">목록으로</a>		
			<button type="submit" class="btn btn-dark">제품 입고</button>
		</div>
	</form>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>