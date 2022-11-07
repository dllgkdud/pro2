<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, kr.co.myshop.vo.*"%>
<%
	Custom custom = (Custom) request.getAttribute("custom");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="content container" id="content">
	<h2 class="title">회원정보 확인 및 수정</h2>
	<form name="frm" id="frm" action="<%=request.getContextPath() %>/UpdateCustomCtrl" method="post"  onsubmit="return updateCheck(this)">
		<table class="table">
			<tbody>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="cusId" id="cusId" class="form-control" placeholder="아이디 입력" value="<%=custom.getCusId() %>" required /></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<p>변경 시에만 입력하시기 바랍니다.</p>
						<input type="hidden" name="cusPw" id="cusPw" value="<%=custom.getCusPw() %>">
						<input type="password" name="editCusPw" id="editCusPw" class="form-control" placeholder="비밀번호 입력" required />
					</td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" name="editCusPw" id="editCusPw" class="form-control" placeholder="비밀번호 확인" required /></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="cusName" id="cusName" class="form-control" placeholder="이름 입력" value="<%=custom.getCusName() %>" required /></td>
				</tr>
				<tr>
				<tr>
					<th>주소</th>
					<td>
						<p><%=custom.getAddress() %></p>
						<input type="hidden" name="address" id="address">
						<p>변경 시에만 입력하시기 바랍니다.</p>
						<input type="text" name="editAddress1" id="editAddress1" class="form-control" placeholder="기본 주소" required /><br>
						<input type="text" name="editAddress2" id="editAddress2" class="form-control" placeholder="상세 주소" required />
						<input type="text" name="editpostcode" id="editpostcode" style="width:160px;float:left;margin-right:20px;" placeholder="우편번호" class="form-control">
						<button type="button" id="post_btn" onclick="findAddr()" class="btn btn-light">우편번호 검색</button>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="custel" id="custel" class="form-control" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" placeholder="전화번호 입력(XXX-XXXX-XXXX)" value="<%=custom.getTel() %>" required /></td>
				</tr>
				<tr>
					<th>회원 포인트</th>
					<td>
						<p><%=custom.getPoint() %></p>
					</td>
				</tr>
				<tr>
					<th>회원 등급</th>
					<td>
						<%
							if(custom.getPoint()>0){
								out.println("<span>씨앗회원</span>");
							} else if(custom.getPoint()>100){
								out.println("<span>새싹회원</span>");
							} else if(custom.getPoint()>300){
								out.println("<span>잎새회원</span>");
							} else if(custom.getPoint()>700){
								out.println("<span>열매회원</span>");
							} else if(custom.getPoint()>1000){
								out.println("<span>나무회원</span>");
							} else {
								out.println("<span>관리자</span>");
							}
						%>
					</td>
				</tr>
				<tr>
					<th>방문횟수</th>
					<td>
						<p><%=custom.getVisited() %></p>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="btn-group">
			<input type="reset" name="reset-btn" class="btn btn-light" value="취소">
			<input type="submit" name="submit-btn" class="btn btn-dark" value="정보수정">
		</div>
	</form>
	<script>
	function updateCheck(f){
		if(f.editCusPw.value!=f.editCusPw2.value) {
			alert("비밀번호가 서로 일치하지 않습니다.");
			f.editCusPw.focus();
			return false;
		}
	}
	</script>
	<script>
	function findAddr() {
		new daum.Postcode({
			oncomplete: function(data) {
				console.log(data);
				var roadAddr = data.roadAddress;
				var jibunAddr = data.jibunAddress;
				document.getElementById("editpostcode").value = data.zonecode;
				if(roadAddr !== '') {
					document.getElementById("editaddress1").value = roadAddr;				
				} else if(jibunAddr !== ''){
					document.getElementById("editaddress1").value = jibunAddr;
				}
			}
		}).open();
	}
	</script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>