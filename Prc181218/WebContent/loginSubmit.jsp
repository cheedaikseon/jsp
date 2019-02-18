<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%@page import="javax.naming.*" %>
<%@page import="vo.FinMemberVo"%>

<jsp:useBean id="loginMember" class="vo.FinMemberVo"/>
<jsp:setProperty property="*" name="loginMember"/>

<%
	request.setCharacterEncoding("UTF-8");
	
	String u_id = request.getParameter("u_id");
	String u_pass = request.getParameter("u_pass");

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

try{
	Context init = new InitialContext();
	DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/oracleDB");
	con = ds.getConnection();
	
	String sql = "SELECT * FROM fin_member WHERE u_id = ? AND u_pass = ?";
	pstmt = con.prepareStatement(sql);		
	pstmt.setString(1, u_id);
	pstmt.setString(2, u_pass);
	rs = pstmt.executeQuery();
	
	FinMemberVo mem = null;
	
	while(rs.next()){
		mem = new FinMemberVo();
		mem.setU_id(rs.getString("u_id"));
		mem.setU_pass(rs.getString("u_pass"));
		mem.setU_age(rs.getInt("u_age"));
		mem.setU_gender(rs.getString("u_pass"));
	}
	
	if(mem != null){
		session.setAttribute("member", mem);
		out.print("<script>alert('로그인 성공');location.href='index.jsp';</script>");
	}else{
		out.print("<script>alert('로그인 실패');location.href='index.jsp';</script>");
	}
	
}catch(Exception e){
	e.printStackTrace();
	out.print("<script>");
	out.print("alert('Exception!!');location.href='index.jsp';");
	out.print("</script>");
}finally{
	rs.close();
	pstmt.close();
	con.close();
}
%>