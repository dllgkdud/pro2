<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, kr.co.myshop.vo.*"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송처리</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%@ include file="../header.jsp" %>
<%
	Parsel pro = (Parsel) request.getAttribute("parsel");
%>
<div class="container-fluid" id="content">
	<div class="row" id="content_row">
		<% if(sid!=null && sid.equals("admin")) { %>
		<%@ include file="../admin/sideBar.jsp" %>
		<% } %>
		<h2 class="title">배송정보등록 및 수정</h2>
		<form name="frm" id="frm" action="<%=request.getContextPath() %>/UpdateParselProCtrl" method="post" onsubmit="return postCheck(this)">
			<table class="table">
				<tbody>
					<tr>
						<th style="max-width:200px;width:200px;">배송코드</th>
						<td>
							<p><%=pro.getParselNo() %></p>
							<input type="hidden" name="parselNo" id="parselNo" value="<%=pro.getParselNo() %>">
						</td>
					</tr>
					<tr>
						<th>배송업체 선택</th>
						<td>
							<% if(pro.getParselState()!=0) { %>
							<p><%=pro.getParselCom() %></p>
							<% } %>
							<select name="parselCom" id="parselCom" placeholder="배송업체 선택" class="form-control" required>
								<option value="CJ대한통운">CJ대한통운</option>
								<option value="롯데택배">롯데택배</option>
								<option value="우체국택배">우체국택배</option>
								<option value="로젠택배">로젠택배</option>
								<option value="한진택배">한진택배</option>
							</select>
							
						</td>
					</tr>
					<tr>
						<th>화물코드</th>
						<td>
							<% if(pro.getParselState()!=0) { %>
							<input type="text" name="baleCode" id="baleCode" placeholder="배송회사의 화물코드숫자만 입력" class="form-control" value="<%=pro.getBaleCode() %>" required />
							<% } else { %>
							<input type="text" name="baleCode" id="baleCode" placeholder="배송회사의 화물코드숫자만 입력" class="form-control" required />
							<% } %>								
						</td>
					</tr>
					<tr>
						<th>배송기사 연락처</th>
						<td>
							<% if(pro.getParselState()!=0) { %>
							<input type="text" name="parselTel" id="parselTel" placeholder="배송회사의 화물코드숫자만 입력" class="form-control" value="<%=pro.getParselTel() %>" required />
							<% } else { %>
							<input type="tel" name="parselTel" id="parselTel" placeholder="배송기사 연락처 입력" class="form-control" required />
							<% } %>
						</td>
					</tr>
					<tr>
						<th>배송상태</th>
						<td>
							<% if(pro.getParselState()==0) { %>
								<p value="0">현재 상태 : <strong>배송준비</strong></p>
							<% } else if(pro.getParselState()==1) { %>
								<p value="1">현재 상태 : <strong>배송출발</strong></p>
							<% } else if(pro.getParselState()==2) { %>
								<p value="2">현재 상태 : <strong>배송도착</strong></p>
							<% } else if(pro.getParselState()==3) { %>
								<p value="3">현재 상태 : <strong>구매결정</strong></p>
							<% } else { %>
								<p value="4">현재 상태 : <strong>점검중</strong></p>
							<% } %>
							<select name="parselState" id="parselState" class="form-control">
								<option value="0">배송준비</option>
								<option value="1">배송출발</option>
								<option value="2">배송도착</option>
								<option value="3">구매결정</option>
								<option value="4">점검중</option>
							</select>
							<% 
								if(pro.getParselState()!=0) { 
									if(pro.getParselCom()=="CJ대한통운") {
							%>
									<p><a href="http://nplus.doortodoor.co.kr/web/detail.jsp?slipno=<%=pro.getBaleCode() %>">배송추적</a></p>
							<% } else if(pro.getParselCom()=="롯데택배") { %>	
									<p><a href="https://www.lotteglogis.com/mobile/reservation/tracking/linkView?InvNo=<%=pro.getBaleCode() %>">배송추적</a></p>
							<% } else if(pro.getParselCom()=="우체국택배") { %>	
									<p><a href="http://service.epost.go.kr/trace.RetrieveRegiPrclDeliv.postal?sid1=<%=pro.getBaleCode() %>">배송추적</a></p>
							<% } else if(pro.getParselCom()=="로젠택배") { %>	
									<p><a href="https://www.ilogen.com/m/personal/trace/<%=pro.getBaleCode() %>">배송추적</a></p>
							<% } else if(pro.getParselCom()=="한진택배") { %>
									<p><a href="https://www.hanjin.co.kr/kor/CMS/DeliveryMgr/WaybillResult.do?mCode=MN038&schLang=KR&wblnumText2=<%=pro.getBaleCode() %>">배송추적</a></p>
							<%
									}
								}
							%>	
						</td>
					</tr>
				</tbody>
			</table>
			<div class="btn-group">
				<input type="reset" name="reset-btn" class="btn btn-light" value="취소">			
				<input type="submit" name="submit-btn" class="btn btn-dark" value="배송정보 변경">
				<a href="<%=request.getContextPath() %>/GetMemberSalesInfoCtrl" class="btn btn-dark">목록으로</a>
			</div>
		</form>
		<script>
		function postCheck(f){
			var code = [10,12,13,11,12];
			var com = ["CJ대한통운","롯데택배","우체국택배","로젠택배","한진택배"];
			var baleCode = f.baleCode.value;
			baleCode = baleCode.trim();
			var parselCompany = f.parselCompany.value;
			for(var i=0;i<5;i++){
				if(parselCom==com[i]){
					if(baleCode.length!=code[i]){
						alert("택배사와 화물코드가 일치하지 않습니다.");
						f.baleCode.focus();
						return false;
					}
				}				
			}
		}
		</script>
	</div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>