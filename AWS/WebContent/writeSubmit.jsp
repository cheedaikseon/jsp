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
	PreparedStatement pstmt = null; //쿼리문 날림 statement확장한것
	
	try{
		
		Context init = new InitialContext();
		DataSource dataSource = 
				(DataSource)init.lookup("java:comp/env/jdbc/mysql");
		con = dataSource.getConnection();	
		
		String sql = "INSERT INTO board_test VALUES(null,?,?)";//쿼리를 먼저 날리고 와일드카드로 나중에 값을 넣어줌
		pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, auth);
		pstmt.setString(2,content);
		pstmt.executeUpdate();
		
		out.print("<script>alert('글작성완료');location.href='index.jsp?page=writeIndex';</script>");
	}catch(Exception e){
		e.printStackTrace();
		//out.print("<script>alert('글작성실패');location.href='writeForm.jsp';</script>");
		out.print("<script>alert('글작성실패');history.go(-1);</script>");
	}finally{
		pstmt.close();
		con.close();
	}
	
%>