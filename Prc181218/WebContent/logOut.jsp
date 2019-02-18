<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그아웃 처리
	session.removeAttribute("member");
%>

<script>
	alert("로그아웃 하였습니다.");
	location.href="index.jsp";
</script>