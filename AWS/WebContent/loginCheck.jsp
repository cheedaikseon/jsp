<%@page import="vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>
<% 
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String login = request.getParameter("login");
	

	Connection con = null; //세션의 기본 정보를 들고 있음, 오토커밋기능이 있음(ex>con.setAutoCommit(true)이게 디폴트가 트루임)
	PreparedStatement pstmt =null;
	ResultSet rs = null;
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
		con = ds.getConnection();
		
		String sql = "SELECT * FROM test_member WHERE id = ? AND pass =?";
		
		pstmt = con.prepareStatement(sql); //연결된 정보를 가지고 쿼리문을 남김
		pstmt.setString(1, id);
		pstmt.setString(2, pass);
		
		rs = pstmt.executeQuery();
		
		MemberVo m = null;
		
		while(rs.next()){
			m = new MemberVo();
			m.setId(rs.getString("id"));
			m.setPass(rs.getString("pass"));
			m.setName(rs.getString("name"));
			m.setAddr(rs.getString("addr"));
			m.setPhone(rs.getString("phone"));
		}
		if(m != null){
			
				session.setAttribute("member",m);
				
				if(login != null){
					Cookie cookie = new Cookie("id",m.getId());
					cookie.setMaxAge(60*60);
					response.addCookie(cookie);
				}		
				
				
				out.print("<script>alert('로그인 성공');location.href='index.jsp';</script>");
			}else{
				out.print("<script>alert('로그인 실패');location.href='index.jsp?page=login';</script>");
			}
		
	}catch(Exception e){
		e.printStackTrace();
		out.print("<script>");
		out.print("alert('로그인 실패');location.href='index.jsp?page=login';");
		out.print("</script>");
	}finally{
		rs.close();
		pstmt.close();
		con.close();
	}



	
%>