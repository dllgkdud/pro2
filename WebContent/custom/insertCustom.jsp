<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, kr.co.myshop.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<body>
<%@ include file="../header.jsp" %>
<div class="content container" id="content">
	<h2 class="title">회원가입</h2>
	<form name="frm" id="frm" action="../InsertCustomCtrl" method="post"  onsubmit="return joinCheck(this)">
		<table class="table">
			<tbody>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="cusId" id="cusId" class="form-control" placeholder="아이디 입력" required />
						<input type="button" class="btn btn-dark"  onclick="idCheck()" value="아이디 중복 체크" >
						<input type="hidden" name="idCk" id="idCk" value="no">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="cusPw" id="cusPw" class="form-control" placeholder="비밀번호 입력" required /></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" name="cusPw2" id="cusPw2" class="form-control" placeholder="비밀번호 확인" required /></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="cusName" id="cusName" class="form-control" placeholder="이름 입력" required /></td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<input type="text" name="address1" id="address1" class="form-control" placeholder="기본 주소" required />
						<input type="text" name="address2" id="address2" class="form-control" placeholder="상세 주소" required />
						<input type="text" name="postcode" id="postcode" style="width:160px;float:left;margin-right:20px;" placeholder="우편번호" class="form-control">
						<button id="post_btn" onclick="findAddr()" class="btn btn-light">우편번호 검색</button>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="custel" id="custel" class="form-control" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" placeholder="전화번호 입력(XXX-XXXX-XXXX)" required /></td>
				</tr>
			</tbody>
		</table>
		<div class="btn-group">
			<input type="reset" name="reset-btn" class="btn btn-light" value="취소">
			<input type="submit" name="submit-btn" class="btn btn-dark" value="회원가입">
		</div>
	</form>
	<script>
	function idCheck(){
		var cusId = document.frm.cusId.value;
		var win = window.open("idCheck.jsp?cusId="+cusId, "ID 중복 체크란", "width=400", "height=300");
	}
	function joinCheck(f){
		if(f.cusPw.value != f.cusPw2.value){
			alert("비밀번호가 서로 일치하지 않습니다. ");
			f.cusPw.focus();
			return false;
		}
		if(f.idCk.value!="yes"){
			alert("아이디 중복 체크를 진행해주세요.");
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
				document.getElementById("postcode").value = data.zonecode;
				if(roadAddr !== '') {
					document.getElementById("address1").value = roadAddr;				
				} else if(jibunAddr !== ''){
					document.getElementById("address1").value = jibunAddr;
				}
				document.getElementById("address2").focus();
			}
		}).open();
	}
	</script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>