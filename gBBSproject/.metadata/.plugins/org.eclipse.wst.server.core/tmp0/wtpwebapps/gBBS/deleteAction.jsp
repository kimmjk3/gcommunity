<%@page import="java.io.PrintWriter"%>
<%@page import="bbs.BbsDAO"%>
<%@page import="bbs.Bbs"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제 기능</title>
</head>
<body>
	<%
	String user_ID = null;
	if (session.getAttribute("user_ID") != null) { //세션의 userID속성이 null이 아니면
	    user_ID = (String) session.getAttribute("user_ID");
	}
	if (user_ID == null) { //로그인이 되어있는사람만 수정할수 있어야한다.   
	    PrintWriter script = response.getWriter();
	    script.println("<script>");
	    script.println("alert('로그인을 하세요')");
	    script.println("location.href = 'login.jsp'");
	    script.println("</script>");
	}
	int post_Number = 0;
	if (request.getParameter("post_Number") != null) {
	    post_Number = Integer.parseInt(request.getParameter("post_Number"));
	}
	
	Bbs bbs = new BbsDAO().getBbs(post_Number);
	
	if (post_Number == 0) {
	    PrintWriter script = response.getWriter();
	    script.println("<script>");
	    script.println("alert('유효하지 않는 글입니다.')");
	    script.println("location.href = 'bbs.jsp'");
	    script.println("</script>");
	}
	if (!user_ID.equals(bbs.getUser_ID())) {
	    PrintWriter script = response.getWriter();
	    script.println("<script>");
	    script.println("alert('권한이 없습니다.')");
	    script.println("location.href = 'bbs.jsp'");
	    script.println("</script>");
	} else { //로그인이 되어있다면
	    BbsDAO bbsDAO = new BbsDAO();
	    int result = bbsDAO.delete(post_Number);
	    if (result == -1) { //데이터베이스 오류
	        PrintWriter script = response.getWriter();
	        script.println("<script>");
	        script.println("alert('글 삭제에 실패했습니다.')");
	        script.println("history.back()");
	        script.println("</script>");
	    } else { //정상적으로 수정 완료    
	        PrintWriter script = response.getWriter();
	        script.println("<script>");
	        script.println("location.href = 'bbs.jsp'");
	        script.println("</script>");
	    }

	}
	%>
</body>
</html>