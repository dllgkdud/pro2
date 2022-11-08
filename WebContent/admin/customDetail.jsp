<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, kr.co.myshop.vo.*, kr.co.myshop.util.*"%>
<%
	Custom custom = (Custom) request.getAttribute("custom");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원상세정보</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="container-fluid" id="content">
	<div class="row" id="content_row">
		<%@ include file="sideBar.jsp" %>
		<h2 class="title">회원 상세 정보 확인 및 수정</h2>
		<form name="frm" id="frm" action="<%=request.getContextPath() %>/DirectUpdateCustomCtrl" method="post">
			<table class="table">
				<tbody>
					<tr>
						<th>아이디</th>
						<td>
							<input type="text" name="cusId" id="cusId" placeholder="아이디 입력" class="form-control" value="<%=custom.getCusId() %>" readonly required />
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<%
						/*	String cusPw = "";
					        String key = "%02x";
							cusPw = AES256.decryptAES256(custom.getCusPw(), key); */
							%>
							<input type="text" name="cusPw" id="cusPw" placeholder="비밀번호 입력" value="<%=custom.getCusPw() %>" class="form-control" readonly /><button type="button" class="btn btn-dark" onclick="defaultPass()">비밀번호 초기화</button>
							<input type="hidden" name="changePw" id="changePw" value="no">
						</td>
					</tr>
					<tr>
						<th>고객이름</th>
						<td><input type="text" name="cusName" id="cusName" placeholder="이름 입력" class="form-control" value="<%=custom.getCusName() %>" required /></td>
					</tr>
					<tr>
						<th>주소</th>
						<td>
							<p><%=custom.getAddress() %></p>
						</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type="tel" name="tel" id="tel" placeholder="전화번호 입력 000-0000-0000" class="form-control" value="<%=custom.getTel() %>" required></td>
					</tr>
					<tr>
						<th>포인트</th>
						<td><input type="number" name="point" id="point" class="form-control" value="<%=custom.getPoint() %>" required></td>
					</tr>
					<tr>
						<th>회원등급</th>
						<td>
							<select name="level">
							<%
								if(custom.getPoint()>0){
									out.println("<option value='0' selected>씨앗회원</option>");
									out.println("<option value='1'>새싹회원</option>");
									out.println("<option value='2'>잎새회원</option>");
									out.println("<option value='3'>열매회원</option>");
									out.println("<option value='4'>나무회원</option>");
									out.println("<option value='5'>관리자</option>");
								} else if(custom.getPoint()>100){
									out.println("<option value='0'>씨앗회원</option>");
									out.println("<option value='1' selected>새싹회원</option>");
									out.println("<option value='2'>잎새회원</option>");
									out.println("<option value='3'>열매회원</option>");
									out.println("<option value='4'>나무회원</option>");
									out.println("<option value='5'>관리자</option>");
								} else if(custom.getPoint()>300){
									out.println("<option value='0'>씨앗회원</option>");
									out.println("<option value='1'>새싹회원</option>");
									out.println("<option value='2' selected>잎새회원</option>");
									out.println("<option value='3'>열매회원</option>");
									out.println("<option value='4'>나무회원</option>");
									out.println("<option value='5'>관리자</option>");
								} else if(custom.getPoint()>700){
									out.println("<option value='0'>씨앗회원</option>");
									out.println("<option value='1'>새싹회원</option>");
									out.println("<option value='2'>잎새회원</option>");
									out.println("<option value='3' selected>열매회원</option>");
									out.println("<option value='4'>나무회원</option>");
									out.println("<option value='5'>관리자</option>");
								} else if(custom.getPoint()>1000){
									out.println("<option value='0'>씨앗회원</option>");
									out.println("<option value='1'>새싹회원</option>");
									out.println("<option value='2'>잎새회원</option>");
									out.println("<option value='3'>열매회원</option>");
									out.println("<option value='4' selected>나무회원</option>");
									out.println("<option value='5'>관리자</option>");
								} else {
									out.println("<option value='0'>씨앗회원</option>");
									out.println("<option value='1'>새싹회원</option>");
									out.println("<option value='2'>잎새회원</option>");
									out.println("<option value='3'>열매회원</option>");
									out.println("<option value='4'>나무회원</option>");
									out.println("<option value='5' selected>관리자</option>");
								}
							%>					
							</select>
						</td>
					</tr>
					<tr>
						<th>방문횟수</th>
						<td><input type="number" name="visited" id="visited" class="form-control" value="<%=custom.getVisited() %>" required></td>
					</tr>
				</tbody>
			</table>
			<div class="btn-group">
				<input type="reset" name="reset-btn" class="btn btn-light" value="취소">			
				<input type="submit" name="submit-btn" class="btn btn-dark" value="정보수정">
			</div>
		</form>	
<%@ include file="../footer.jsp" %>
</body>
</html>