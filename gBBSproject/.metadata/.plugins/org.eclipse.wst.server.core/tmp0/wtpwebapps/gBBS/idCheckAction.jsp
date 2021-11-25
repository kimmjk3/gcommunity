<%@page import="java.io.PrintWriter"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="user_ID" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복검사 기능</title>
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