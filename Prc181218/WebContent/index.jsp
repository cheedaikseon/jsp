<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vo.FinMemberVo" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
		
		
		FinMemberVo member = (FinMemberVo)session.getAttribute("member");
	
%>
</head>
<body>
		<%if(member != null && member.getU_id() != null){%>
			<%= member.getU_id() %>님 반갑습니다. 
			<%if(member.getU_id().equals("admin")){ %>
				<a href="memberList.jsp">회원관리</a>
			<%}%>
			<a href="logOut.jsp">로그아웃</a>
		<%	
		}else{
		%>
		<a href="login.jsp">로그인</a> | <a href="join.jsp">회원가입</a>
		<%
		}
	    %>		
</body>
</html>