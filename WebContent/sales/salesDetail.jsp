<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, kr.co.myshop.vo.*"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매내역상세페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%@ include file="../header.jsp" %>
<%
	Sales vo = (Sales) request.getAttribute("sales");
%>
<div class="container-fluid" id="content">
	<div class="row" id="content_row">
		<% if(sid!=null && sid.equals("admin")) { %>
		<%@ include file="../admin/sideBar.jsp" %>
		<% } %>
		<h2 class="title">구매상세내역</h2>
		<table class="table">
			<tbody>
				<tr>
					<th>구매번호</th>
					<td><%=vo.getSaleNo() %></td>
				</tr>
				<tr>
					<th>구매제품번호</th>
					<td><%=vo.getProNo() %></td>
				</tr>
				<tr>
					<th>구매수량</th>
					<td><%=vo.getAmount() %></td>
				</tr>
				<tr>
					<th>구매날짜</th>
					<td><%=vo.getSaleDate() %></td>
				</tr>
				<tr>
					<th>배송번호</th>
					<td><%=vo.getParselNo() %></td>
				</tr>
				<tr>
					<th>결제번호</th>
					<td><%=vo.getProNo() %></td>
				</tr>
			</tbody>
		</table>
		<div class="btn-group">
			<a href="<%=request.getContextPath() %>/GetMemberSalesInfoCtrl" class="btn btn-light">목록으로</a>
			<% if(vo.getCusId().equals(sid) && vo.getParselState()==0) { %>
			<a href="<%=request.getContextPath() %>/DeleteSalesCtrl?saleNo=<%=vo.getSaleNo() %>" class="btn btn-light">결제취소</a>
			<a href="<%=request.getContextPath() %>/UpdateSalesCtrl?parselNo=<%=vo.getParselNo() %>" class="btn btn-dark">배송정보수정</a>
			<% } %>
		</div>
	</div>	
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>