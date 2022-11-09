<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, kr.co.myshop.vo.*"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송관리목록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
.title {
	height: 40px;
}
.btn-group {
	float: left;
	height: 45px;
}
.btn {
	clear: both;
	content: "";
	display: block;
}
.tb_ck  { 
	display:none; 
}
#parsel0, #parsel1, #parsel2, #parsel3, #parsel4 { 
	display:none; 
}
#tb_ck1:checked ~ #parsel0 { display:table; }
#tb_ck2:checked ~ #parsel1 { display:table; }
#tb_ck3:checked ~ #parsel2 { display:table; }
#tb_ck4:checked ~ #parsel3 { display:table; }
#tb_ck5:checked ~ #parsel4 { display:table; }
.table caption { 
	caption-side:top; 
}
</style>
<body>
<%@ include file="../header.jsp" %>
<%
	List<Parsel> parList = (ArrayList<Parsel>) request.getAttribute("parList");
%>
<div class="container-fluid" id="content">
	<div class="row" id="content_row">
		<% if(sid!=null && sid.equals("admin")) { %>
		<%@ include file="../admin/sideBar.jsp" %>
		<% } %>
		<h2 class="title">배송 관리 목록</h2>
		<input type="radio" name="tb_ck" class="tb_ck" id="tb_ck1" checked>
		<input type="radio" name="tb_ck" class="tb_ck" id="tb_ck2">
		<input type="radio" name="tb_ck" class="tb_ck" id="tb_ck3">
		<input type="radio" name="tb_ck" class="tb_ck" id="tb_ck4">
		<input type="radio" name="tb_ck" class="tb_ck" id="tb_ck5">
		<div class="btn-group" id="tb_btn_box">
			<label for="tb_ck1" class="btn btn-dark">배송준비</label>
			<label for="tb_ck2" class="btn btn-outline-dark">배송출발</label>
			<label for="tb_ck3" class="btn btn-outline-dark">배송도착</label>
			<label for="tb_ck4" class="btn btn-outline-dark">구매결정</label>
			<label for="tb_ck5" class="btn btn-outline-dark">점검중</label>
		</div>
		<table class="table" id="parsel0">
			<caption><h3>배송준비</h3></caption>
			<thead>
				<tr>
					<th>번호</th><th>배송지</th><th>고객 연락처</th>
					<th>배송회사</th><th>기사 연락처</th>
					<th>화물코드</th>
				</tr>
			</thead>
			<tbody>
			<% for(int i=0;i<parList.size();i++){
				Parsel vo = parList.get(i);
					if(vo.getParselState()==0){
			%>
						<tr>
							<td><%=parList.size()-i %></td>
							<td><%=vo.getParselAddr() %></td>
							<td><%=vo.getCusTel() %></td>
							<td><%=vo.getParselCom() %></td>
							<td><%=vo.getParselTel() %></td>
							<td>
								<a href="<%=vo.getParselUrl(vo.getParselCom()) %><%=vo.getBaleCode() %>" target="_blank"><%=vo.getBaleCode() %></a>
							</td>
						</tr>
			<%
						}
				}
			%>
			</tbody>
		</table>
		<table class="table" id="parsel1">
				<caption><h3>배송출발</h3></caption>
				<thead>
					<tr>
						<th>번호</th><th>배송지</th><th>고객 연락처</th>
						<th>배송회사</th><th>기사 연락처</th>
						<th>화물코드</th>
					</tr>
				</thead>
				<tbody>
				<% for(int i=0;i<parList.size();i++){
						Parsel vo = parList.get(i);
						if(vo.getParselState()==1){
				%>
				<tr>
					<td><%=parList.size()-i %></td>
					<td><%=vo.getParselAddr() %></td>
					<td><%=vo.getCusTel() %></td>
					<td><%=vo.getParselCom() %></td>
					<td><%=vo.getParselTel() %></td>
					<td>
						<a href="<%=vo.getParselUrl(vo.getParselCom()) %><%=vo.getBaleCode() %>" target="_blank"><%=vo.getBaleCode() %></a>
					</td>
				</tr>
				<%
					}
				} 
				%>	
			</tbody>
		</table>
		<table class="table" id="parsel2">
				<caption><h3>배송도착</h3></caption>
				<thead>
					<tr>
						<th>번호</th><th>배송지</th><th>고객 연락처</th>
						<th>배송회사</th><th>기사 연락처</th>
						<th>화물코드</th>
					</tr>
				</thead>
				<tbody>
				<% for(int i=0;i<parList.size();i++){
					Parsel vo = parList.get(i);
					if(vo.getParselState()==2){
				%>
				<tr>
					<td><%=parList.size()-i %></td>
					<td><%=vo.getParselAddr() %></td>
					<td><%=vo.getCusTel() %></td>
					<td><%=vo.getParselCom() %></td>
					<td><%=vo.getParselTel() %></td>
					<td>
						<a href="<%=vo.getParselUrl(vo.getParselCom()) %><%=vo.getBaleCode() %>" target="_blank"><%=vo.getBaleCode() %></a>
					</td>
				</tr>
				<%
					}
				} 
				%>	
				</tbody>
			</table>
		<table class="table" id="parsel3">
				<caption><h3>구매결정</h3></caption>
				<thead>
					<tr>
						<th>번호</th><th>배송지</th><th>고객 연락처</th>
						<th>배송회사</th><th>기사 연락처</th>
						<th>화물코드</th>
					</tr>
				</thead>
				<tbody>
				<% for(int i=0;i<parList.size();i++){
						Parsel vo = parList.get(i);
						if(vo.getParselState()==3){
				%>
				<tr>
					<td><%=parList.size()-i %></td>
					<td><%=vo.getParselAddr() %></td>
					<td><%=vo.getCusTel() %></td>
					<td><%=vo.getParselCom() %></td>
					<td><%=vo.getParselTel() %></td>
					<td>
						<a href="<%=vo.getParselUrl(vo.getParselCom()) %><%=vo.getBaleCode() %>" target="_blank"><%=vo.getBaleCode() %></a>
					</td>
				</tr>
				<%
							}
					} 
				%>	
				</tbody>
			</table>
			<table class="table" id="parsel4">
				<caption><h3>점검중</h3></caption>
				<thead>
					<tr>
						<th>번호</th><th>배송지</th><th>고객 연락처</th>
						<th>배송회사</th><th>기사 연락처</th>
						<th>화물코드</th>
					</tr>
				</thead>
				<tbody>
				<% for(int i=0;i<parList.size();i++){
						Parsel vo = parList.get(i);
						if(vo.getParselState()>=4){
				%>
				<tr>
					<td><%=parList.size()-i %></td>
					<td><%=vo.getParselAddr() %></td>
					<td><%=vo.getCusTel() %></td>
					<td><%=vo.getParselCom() %></td>
					<td><%=vo.getParselTel() %></td>
					<td>
						<a href="<%=vo.getParselUrl(vo.getParselCom()) %><%=vo.getBaleCode() %>" target="_blank"><%=vo.getBaleCode() %></a>
					</td>
				</tr>
				<%
							}
					} 
				%>	
				</tbody>
			</table>
			<script>
			$(document).ready(function(){
				$("#tb_btn_box label").click(function(){
					$(this).removeClass("btn-outline-dark").addClass("btn-dark");
					$(this).siblings("label").removeClass("btn-dark").addClass("btn-outline-dark");
				});
			});
		</script>
	</div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>