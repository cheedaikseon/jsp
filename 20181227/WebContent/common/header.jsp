<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header>
	<div>
		<ul>
			<c:choose>
				<c:when test="${!empty member}">
					<li><a href="info.mb">${member.name}</a></li>
					<li><a href="logout.mb">로그아웃</a></li>		
				</c:when>
				<c:otherwise>
					<li><a href="login.mb">로그인</a></li>
					<li><a href="join.mb">회원가입</a></li>
				</c:otherwise>
			</c:choose>
		</ul>	
	</div>
</header>