<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%@page import="javax.naming.*" %>

<jsp:include page="checkAdmin.jsp" />

<%
	request.setCharacterEncoding("utf-8");
	String num = request.getParameter("u_num");
	
	Connection con = null;
	PreparedStatement pstmt = null;
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/oracleDB");
		con = ds.getConnection();
		
		String sql = "DELETE FROM fin_member WHERE U_num = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1,Integer.parseInt(num));
		
		int result = pstmt.executeUpdate();
		
		if(result != 0){
			out.print("<script>alert('삭제완료!!');location.href='index.jsp';</script>");
		}
		
		
	}catch(Exception e){
		out.print("<script>alert('삭제실패 ㅜㅜ');location.href='index.jsp';</script>");
	}finally{

		pstmt.close();
		con.close();
	}
	
	

%>