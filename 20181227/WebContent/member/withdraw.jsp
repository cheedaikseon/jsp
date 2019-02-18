<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<h1>비밀번호 입력</h1>
	<form action="withdrawSubmit.mb" method="post">
		<input type="password" name="tempPass"/>
		<input type="submit" value="확인"/>	
	</form>
</body>
</html>