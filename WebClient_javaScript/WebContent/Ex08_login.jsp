<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 이페이지가 서버에서 실행된다.
	// action="Ex08_login.jsp" -> 전송 -> 이페이지 실행

	// 요청주소 : 192.168.0.60:8090/WebClient/Ex08_login.jsp?txtuserid=...&txtpwd=....

	String id = request.getParameter("txtuserid");
	String pwd = request.getParameter("txtpwd");
	
	// 그 다음 작업 (DB insert, select) , 파일 처리하던지 말던지는 마음대로
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	서버확인 (Client 다시 전달)<br>
	<%=id %> <!-- %= 서버의 내용을 Client에 다시 전달 write  -->
	<%=pwd %>
</body>
</html>