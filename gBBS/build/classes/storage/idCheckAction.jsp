<%@page import="java.io.PrintWriter"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="user_ID" />

<!DOCTYPE html>
<!-- //참고용입니다 어디에도 연결되있지 않고 사용하고 있지않습니다. -->
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
    <%  if(user.getUser_ID() == null){
	        PrintWriter script = response.getWriter();
	        script.println("<script>");
	        script.println("alert('아이디를 입력해주세요.')");
	        script.println("history.back()");
	        script.println("</script>");
	    }else{
		    UserDAO userDAO = new UserDAO();
		    int result = userDAO.joinIdCheck(user.getUser_ID());
	            if(result == 1){
	                PrintWriter script = response.getWriter();
	                script.println("<script>");
	                script.println("alert('중복된 아이디 입니다.')");
	                script.println("history.back()");
	                script.println("</script>");
	            }else if(result == 2){
	                PrintWriter script = response.getWriter();
	                script.println("<script>");
	                script.println("alert('사용 가능한 아이디입니다.')");
	                script.println("history.back()");
	                script.println("</script>");
	            }
	    }
            
    %>
</body>
</html>