<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test</title>
<style>
	article{
		height:500px;
		border-bottom:1px solid #ccc;
	}

</style>
<%
	String pageSelect = request.getParameter("page");
	if(pageSelect == null){
		pageSelect = "default";
	}
	
	pageSelect = pageSelect+".jsp";
%>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<article>
		<jsp:include page="<%=pageSelect%>"/>	
	</article>	
	<jsp:include page="footer.jsp"/>
</body>
</html>