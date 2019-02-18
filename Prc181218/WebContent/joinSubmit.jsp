<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%@page import="javax.naming.*" %>

<jsp:useBean id="pinMember" class="vo.FinMemberVo"/>
<jsp:setProperty property="*" name="pinMember"/>

<%
	request.setCharacterEncoding("UTF-8"); 
	Connection con =null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;	
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/oracleDB");
		con = ds.getConnection();
		
		String sql = "SELECT * FROM fin_member WHERE u_id = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, pinMember.getU_id());
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			out.print("<script>alert('이미 존재하는 아이디입니다.'); location.href='index.jsp?page=join';</script>");
			return;
		}
		rs.close();

		sql = "INSERT INTO fin_member values(f_num.nextval,?,?,?,?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,pinMember.getU_id());
		pstmt.setString(2,pinMember.getU_pass());
		pstmt.setInt(3, pinMember.getU_age());
		pstmt.setString(4,pinMember.getU_gender());
		pstmt.executeUpdate();
		
		out.print("<script>alert('회원가입 완료');location.href='index.jsp';</script>");
		
		
	}catch(Exception e){
	out.print("연결실패");
	e.printStackTrace();
		
	}finally{
		pstmt.close();
		con.close();
	}
%>