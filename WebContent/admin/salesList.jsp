<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, kr.co.myshop.vo.*"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매목록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%@ include file="../header.jsp" %>
<%
	List<Sales> saleList = (ArrayList<Sales>) request.getAttribute("saleList");
%>
<div class="container-fluid" id="content">
	<div class="row" id="content_row">
		<% if(sid!=null && sid.equals("admin")) { %>
		<%@ include file="../admin/sideBar.jsp" %>
		<% } %>
		<h2 class="title">판매 목록</h2>
		<table class="table">
			<thead>
				<tr>
					<th>번호</th><th>판매제품코드</th><th>판매일</th><th>배송상태</th>
				</tr>
			</thead>
			<tbody>
			<% for(int i=0;i<saleList.size();i++){
						Sales vo = saleList.get(i);
			%>
						<tr>
							<td><%=saleList.size()-i %></td>
							<td><a href="<%=request.getContextPath() %>/GetAdminSalesDetailCtrl?saleNo=<%=vo.getSaleNo() %>"><%=vo.getProNo() %></a></td>
							<td><%=vo.getSaleDate() %></td>
							<td>
								<% if(vo.getParselState()==0) { %>
								<span>배송준비</span>
								<% } else if(vo.getParselState()==1) { %>
								<span>배송시작</span>
								<% } else if(vo.getParselState()==2) { %>
								<span>제품도착</span>
								<% } else if(vo.getParselState()==3) { %>
								<span>구매결정</span>
								<% }  else {%>
								<span>점검중</span>
								<% } %>
							</td>
						</tr>
			<% } %>	
			</tbody>
		</table>
	</div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>