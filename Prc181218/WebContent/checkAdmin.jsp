<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="vo.FinMemberVo" %>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%@page import="javax.naming.*" %>

<%
	FinMemberVo member = (FinMemberVo)session.getAttribute("member");

	String id = (String) session.getAttribute("id");
	if(member == null || !member.getU_id().equals("admin")){
		out.print("<script>alert('올바른 접근이 아닙니다.');location.href='index.jsp';</script>");
		return;
	}
%>