<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@page import = "javax.sql.*" %>
<%@page import = "javax.naming.*" %>

<%
	request.setCharacterEncoding("utf-8");
	String num = request.getParameter("b_num");
	
	Connection con = null;
	PreparedStatement pstmt = null;
	
	try{
		Context context = new InitialContext();
		Context envContext = (Context)context.lookup("java:comp/env"); //db에 연동하기 위한 경로
		DataSource ds = (DataSource)envContext.lookup("jdbc/mysql");
		
		con = ds.getConnection();
		
		String sql = "DELETE FROM board_test WHERE b_num = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1,Integer.parseInt(num));
		
		
		int result = pstmt.executeUpdate();
		
		if(result != 0){
			out.print("<script>alert('삭제완료!!');location.href='index.jsp?page=writeIndex';</script>");
		}
		
	}catch(Exception e){
		e.printStackTrace();
		out.print("<script>alert('삭제실패 ㅜㅜ');location.href='index.jsp?page=writeIndex';</script>");
		
	}finally{
		pstmt.close();
		con.close();
	}
	
%>