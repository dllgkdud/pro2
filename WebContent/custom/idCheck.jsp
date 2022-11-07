<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cusId = request.getParameter("cusId");
	if(cusId==null || cusId=="") cusId="";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>
</head>
<body>
	<div class="content">
		<h2>아이디 중복 체크</h2>
		<form action="../IdCheckCtrl" method="post" onsubmit="return invalidCheck(this)">
			<input type="text" name="cusId" id="cusId" value="<%=cusId %>" />
			<input type="submit" value="중복확인">
		</form>
		<script>
		function invalidCheck(f){
			var cusId = f.cusId.value;
			//trim()은 String에 적용된 공백을 제거하는 명령이다.
			cusId = cusId.trim();
			if(cusId.length<3){
				alert("아이디는 3자 이상이어야 합니다.");
				return false;
			}
		}
		</script>
	</div>
</body>
</html>