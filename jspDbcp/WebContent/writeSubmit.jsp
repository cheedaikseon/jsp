<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%@page import="javax.naming.*" %>

<%
	request.setCharacterEncoding("UTF-8");
	String auth = request.getParameter("b_auth");
	String content = request.getParameter("b_content");
	
	Connection con = null;
	PreparedStatement pstmt = null;
	
	try{
		
		Context init = new InitialContext();
		DataSource dataSource = 
				(DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		con = dataSource.getConnection();
		
		String sql = "INSERT INTO board_test VALUES(b_num.nextval,?,?)";
		pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, auth);
		pstmt.setString(2,content);
		pstmt.executeUpdate();
		
		out.print("<script>alert('글작성완료');location.href='index.jsp';</script>");
	}catch(Exception e){
		e.printStackTrace();
		//out.print("<script>alert('글작성실패');location.href='writeForm.jsp';</script>");
		out.print("<script>alert('글작성실패');history.go(-1);</script>");
	}finally{
		pstmt.close();
		con.close();
	}
	
%>