<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%@page import="javax.naming.*" %>

<% 
	request.setCharacterEncoding("utf-8");

	String num = request.getParameter("b_num");
	String auth = request.getParameter("b_auth");
	String content = request.getParameter("b_content");
	
	int b_num = Integer.parseInt(num);
	
	/* javax.naming.Context init = new javax.naming.InitialContext(); //import 를 사용하면 간략하게 사용 할 수 있음	 */

	PreparedStatement pstmt = null;
	Connection con = null;
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/oracleDB");
		
		con = ds.getConnection();
		
		String sql = "UPDATE board_test SET b_auth=? , b_content = ? WHERE b_num = ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,auth);
		pstmt.setString(2,content);
		pstmt.setInt(3,b_num);
		
		int result = pstmt.executeUpdate();
		
		if(result != 0){
			out.print("<script>");
			out.print("alert('수정완료');");
			out.print("location.href='index.jsp?page=writeIndex'");
			out.print("</script>");
		}	
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		
	}
	
%>