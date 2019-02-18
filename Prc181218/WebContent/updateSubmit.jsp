<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%@page import="javax.naming.*" %>

<jsp:useBean id="updateMember" class="vo.FinMemberVo" />
<jsp:setProperty property="*" name="updateMember"/>
<%
	// 회원 정보 수정
	request.setCharacterEncoding("utf-8");
	
	Connection con = null;
	PreparedStatement pstmt = null;
	
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/oracleDB");
		con = ds.getConnection();
		
		String sql = "UPDATE fin_member SET u_id = ?, u_pass = ?, u_age = ?, u_gender = ? WHERE u_num =?";
		pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, updateMember.getU_id());
		pstmt.setString(2,updateMember.getU_pass());
		pstmt.setInt(3,updateMember.getU_age());
		pstmt.setString(4,updateMember.getU_gender());
		pstmt.setInt(5,updateMember.getU_num());
		

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
		pstmt.close();
		con.close();
	}
	
	
%>