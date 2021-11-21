<%@page import="java.io.PrintWriter"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="user_ID" />
<jsp:setProperty name="user" property="user_PW" />
<jsp:setProperty name="user" property="user_Name" />
<jsp:setProperty name="user" property="user_NickName" />
<jsp:setProperty name="user" property="user_Gender" />
<jsp:setProperty name="user" property="user_DOB" />
<jsp:setProperty name="user" property="user_Email" />
<jsp:setProperty name="user" property="user_PhoneNumber" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
    <%
        if(user.getUser_ID() == null || user.getUser_PW() == null || user.getUser_Name() == null ||
            user.getUser_NickName() == null || user.getUser_Gender() == null ||
            user.getUser_DOB() == null ||
            user.getUser_Email() == null||user.getUser_PhoneNumber() == null ){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('입력이 안 된 사항이 있습니다')");
            script.println("history.back()");
            script.println("</script>");
        }else{
            UserDAO userDAO = new UserDAO();
            int result = userDAO.join(user);
            if(result == -1){
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('데이터 베이스 입력 오류됨UserDAO.join sql 문 이상한듯')");
                script.println("history.back()");
                script.println("</script>");
            }else {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('회원가입 성공')");
                script.println("location.href='login.jsp'");
                script.println("</script>");
            }
        }
    %>
</body>
</html>