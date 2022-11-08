<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, kr.co.myshop.vo.*"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체회원목록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%@ include file="../header.jsp" %>
<%
	List<Custom> cusList = (ArrayList<Custom>) request.getAttribute("cusList");
%>
<div class="container-fluid" id="content">
<div class="row" id="content_row">
    <%@ include file="sideBar.jsp" %>
    <h2 class="title">공지사항 목록</h2>
	<table class="table">
		<thead>
			<tr>
				<th>연번</th><th>아이디</th><th>이름</th><th>가입일</th><th>회원등급</th>
			</tr>
		</thead>
		<tbody>
		<% for(int i=0;i<cusList.size();i++){
			Custom vo = cusList.get(i);
		%>
		<tr>
			<td><%=cusList.size()-i %></td>
			<td><a href="<%=request.getContextPath() %>/GetCustomDetailCtrl?cusId=<%=vo.getCusId() %>"><%=vo.getCusId() %></a></td>
			<td><%=vo.getCusName() %></td>
			<td><%=vo.getRegDate() %></td>
			<td>
			<%
			if(vo.getPoint()>0){
				out.println("<span>씨앗회원</span>");
			} else if(vo.getPoint()>100){
				out.println("<span>새싹회원</span>");
			} else if(vo.getPoint()>300){
				out.println("<span>잎새회원</span>");
			} else if(vo.getPoint()>700){
				out.println("<span>열매회원</span>");
			} else if(vo.getPoint()>1000){
				out.println("<span>나무회원</span>");
			} else {
				out.println("<span>관리자</span>");
			}
			%>
			</td>
		</tr>
		<% } %>	
		</tbody>
	</table>
<%@ include file="../footer.jsp" %>
</body>
</html>