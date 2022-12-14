<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sid = (String) session.getAttribute("sid");
	String sname = (String) session.getAttribute("sname");
%>
<style>
ul, ul li { 
	list-style:none; 
}
</style>
<nav class="navbar navbar-expand-lg navbar-light py-lg-2" id="mainNav">
 	<div class="container">
		<a class="navbar-brand fw-bold d-lg-none" href="index.jsp">OSULLOC</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mx-left">
	              <li class="nav-item dropdown px-lg-4">
	                  <a class="nav-link dropdown" href="" role="button" data-toggle="dropdown" aria-expanded="false">제품</a>
	                  <div class="dropdown-menu">
	                      <a class="dropdown-item" href="<%=request.getContextPath() %>/GetProductItemListCtrl?cateNo=1">베스트</a>
	                      <div class="dropdown-divider"></div>
	                      <a class="dropdown-item" href="<%=request.getContextPath() %>//GetProductItemListCtrl?cateNo=2">티 제품</a>
	                      <a class="dropdown-item" href="<%=request.getContextPath() %>//GetProductItemListCtrl?cateNo=3">티푸드</a>
	                      <a class="dropdown-item" href="<%=request.getContextPath() %>//GetProductItemListCtrl?cateNo=4">티웨어</a>
	                      <div class="dropdown-divider"></div>
	                      <a class="dropdown-item" href="<%=request.getContextPath() %>//GetProductItemListCtrl?cateNo=5">라이프스타일</a>
	                  </div>
	              </li>
	              <li class="nav-item dropdown px-lg-4">
	                  <a class="nav-link" href="#">선물추천</a>
	              </li>
	              <li class="nav-item dropdown px-lg-4">
	                  <a class="nav-link dropdown" href="#" role="button" data-toggle="dropdown" aria-expanded="false">다다일상</a>
	                  <div class="dropdown-menu">
	                      <a class="dropdown-item" href="#">다다일상 구독</a>
	                      <a class="dropdown-item" href="#">다다일상 기록</a>
	                  </div>
	              </li>
	              <li class="nav-item dropdown px-lg-4">
	                  <a class="nav-link dropdown" href="#" role="button" data-toggle="dropdown" aria-expanded="false">고객센터</a>
	                  <div class="dropdown-menu">
	                      <a class="dropdown-item" href="<%=request.getContextPath() %>/GetBoardListCtrl">공지사항</a>
	                      <a class="dropdown-item" href="#">contact</a>
	                  </div>
	              </li>
			</ul>
			<ul class="nav justify-content-end">
			  <% if(sid!=null) { %>
				  <li class="nav-item">
				    <span class="nav-link"><%=sname %>님</span>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link active" href="<%=request.getContextPath() %>/LogOutCtrl">로그아웃</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="<%=request.getContextPath() %>/GetCustomInfoCtrl">회원정보</a>
				  </li>
				  <% if(sid.equals("admin")) { %>
					  <li class="nav-item">
					    <a class="nav-link" href="<%=request.getContextPath() %>/admin/index.jsp">관리자페이지</a>
					  </li>
				  <% } else { %>
				  <li class="nav-item">
				    <a class="nav-link" href="<%=request.getContextPath() %>/GetMemberSalesInfoCtrl">구매내역</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="<%=request.getContextPath() %>/GetMemberCartListCtrl">장바구니</a>
				  </li>
				  <% } %>
			  <% } else { %>
			  			<li class="nav-item">
		                   	<a class="nav-link" href="<%=request.getContextPath() %>/custom/login.jsp">로그인</a>
		               	</li>
		               	<li class="nav-item">
		                   	<a class="nav-link" href="<%=request.getContextPath() %>/custom/membership.jsp">회원가입</a>
		               	</li>
		                <li class="nav-item">
		                    <a class="nav-link" href="#">배송조회</a>
		                </li>
			  <% } %>
			</ul>
		</div>
	</div>
</nav>