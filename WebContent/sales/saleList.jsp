<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, kr.co.myshop.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>구매 목록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%@ include file="../header.jsp" %>
<%
	List<Sales> salesList = (ArrayList<Sales>) request.getAttribute("salesList");
%>
<div class="container-fluid" id="content">
	<div class="row" id="content_row">
		<% if(sid!=null && sid.equals("admin")) { %>
		<%@ include file="../admin/sideBar.jsp" %>
		<% } %>
		<h2 class="title">구매목록</h2>
		<table class="table">
			<thead>
				<tr>
					<th>연번</th><th>구매내역</th><th>구매일</th>
				</tr>
			</thead>
			<tbody>
			<% for(int i=0;i<salesList.size();i++){
				Sales vo = salesList.get(i);
			%>
			<tr>
				<td><%=salesList.size()-i %></td>
				<td><a href="<%=request.getContextPath() %>/GetSalesDetailCtrl?saleNo=<%=vo.getSaleNo() %>"><%=vo.getProNo() %></a></td>
				<td><%=vo.getSaleDate() %></td>
			</tr>
			<% } %>	
			</tbody>
		</table>
	</div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>