<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.MemberVo" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>
<style>
	*{
		padding:0;
		margin:0;
	}
	
	body{
		width:900px;
		margin:auto;	
	}
	
	header{
		height:100px;
		border-bottom:1px solid #ccc;
	}
	
	ul{
		list-style:none;
		float:right;
		height:100px;
		line-height:100px;
	}
	
	ul li{
		float:left;	
		padding:10px;
	}
	
	ul li a{
		text-decoration:none;
		color:#000;
	}
	
	ul li a:hover{
		color:#ccc;
		cursor:pointer;
	}
</style>
<header>
	<ul>
		<% 
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
			con = ds.getConnection();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	
		Cookie cookies[] = request.getCookies();
		if(cookies != null){
			for(int i= 0; i<cookies.length; i++){
				if(cookies[i].getName().equals("id")){
					
					String sql = "SELECT * FROM test_member WHERE id = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,cookies[i].getValue());
					
					rs = pstmt.executeQuery();
					
					MemberVo member = null;
					
					while(rs.next()){
						member = new MemberVo();
						member.setId(rs.getString("id"));
						member.setPass(rs.getString("pass"));
						member.setName(rs.getString("name"));
						member.setAddr(rs.getString("addr"));
						member.setPhone(rs.getString("phone"));
					}
					
					if(member != null){
						session.setAttribute("member",member);	
					}
					
				}
			}
		}
		
		if(rs!=null){rs.close();}
		if(pstmt!=null){pstmt.close();}
		if(con!=null){con.close();}
		
		// id값은 session의 정보
		MemberVo sessionMember = (MemberVo)session.getAttribute("member"); 
			
		%>
		<%if(sessionMember != null){
		%>
		<li><a href="index.jsp?page=info"><%= sessionMember.getId()%></a>님 반갑습니다.</li>
		<li><a href="logOut.jsp">로그아웃</a></li>
		<li><a href="index.jsp?page=writeIndex">글쓰기</a></li>
		<%if(sessionMember.getId().equals("admin")){%>
		<li><a href="index.jsp?page=admin">회원 정보</a></li>
		<%} %>
		<%	
		}else{
		%>
		<li><a href="index.jsp?page=login">로그인</a></li>
		<li><a href="index.jsp?page=join">회원가입</a></li>
		<%} %>
	</ul>
</header>