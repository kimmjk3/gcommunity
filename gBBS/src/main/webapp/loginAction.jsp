<%@page import = "java.io.PrintWriter" %>
<%@page import = "user.UserDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="user.User" scope = "page" />
<jsp:setProperty name="user" property="user_ID"/>
<jsp:setProperty name="user" property="user_PW"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width", initial-scale="1">
<title>로그인 기능</title>
</head>
<body>
    <%
    
	 // 현재 세션 상태를 체크한다
	    String user_ID = null;
	    if(session.getAttribute("user_ID") != null){
	        user_ID = (String)session.getAttribute("user_ID");
	    }
	    // 이미 로그인했으면 다시 로그인을 할 수 없게 한다
	    if(user_ID != null){
	        PrintWriter script = response.getWriter();
	        script.println("<script>");
	        script.println("alert('이미 로그인이 되어 있습니다')");
	        script.println("location.href='main.jsp'");
	        script.println("</script>");
	    }
        UserDAO userDAO = new UserDAO();
        int result = userDAO.login(user.getUser_ID(),user.getUser_PW());
        if(result == 1){
            PrintWriter script = response.getWriter();
            session.setAttribute("user_ID", user.getUser_ID());
            script.println("<script>");
            script.println("alert('로그인 성공')");
            script.println("location.href='main.jsp'");
            script.println("</script>");
        }else if(result == 0){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('비밀번호 틀림')");
            script.println("history.back()");
            script.println("</script>");
        }else if(result == -1){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('아이디와 비밀번호 입력값이 잘못 되었습니다')");
            script.println("history.back()");
            script.println("</script>");
        }else if(result == -2){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('데이터베이스 오류')");
            script.println("history.back()");
            script.println("</script>");
        }else if(result == -3){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('탈퇴,정지한 아이디 확인')");
            script.println("history.back()");
            script.println("</script>");
        }
    %>
</body>
</html>