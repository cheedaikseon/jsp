<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		
			Cookie cookies[] = request.getCookies();
			if(cookies != null){
				for(int i= 0; i<cookies.length; i++){
					if(cookies[i].getName().equals("id")){
						session.setAttribute("id",cookies[i].getValue());
					}
				}
			}
			
		
			// id값은 session의 정보
			String id = (String)session.getAttribute("id"); 
			
		%>
		<%if(id != null && !id.equals("")){
		%>
		<li><a href="index.jsp?page=info"><%= id %></a>님 반갑습니다.</li>
		<li><a href="logOut.jsp">로그아웃</a></li>
		<%	
		}else{
		%>
		<li><a href="index.jsp?page=login">로그인</a></li>
		<li><a href="index.jsp?page=join">회원가입</a></li>
		<%} %>
	</ul>
</header>