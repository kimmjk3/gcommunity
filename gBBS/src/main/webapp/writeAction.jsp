<%@page import="java.io.PrintWriter"%>
<%@page import="bbs.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<jsp:setProperty name="bbs" property="board_Number" />
<jsp:setProperty name="bbs" property="post_Title" />
<jsp:setProperty name="bbs" property="post_Contents" />
<jsp:setProperty name="bbs" property="post_Category" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글작성 기능title>
</head>
<body>
    <%
    
        String user_ID = null;
        if (session.getAttribute("user_ID")!=null){  //세션의 userID속성이 null이 아니면
            user_ID = (String) session.getAttribute("user_ID");
        }
        if(user_ID == null){  //로그인이 되어있는사람만 글을 쓸수있어야 한다.        
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인을 하세요')");
            script.println("location.href = 'login.jsp'");
            script.println("</script>");
        } else{    //로그인이 되어있다면
            if(bbs.getBoard_Number() == null || bbs.getPost_Title()==null || bbs.getPost_Contents()==null || bbs.getPost_Category() == null){  //제목이나 내용을 입력안했다면
                        PrintWriter script = response.getWriter();
                        script.println("<script>");
                        script.println("alert('입력이 안 된 사항이 있습니다.')");
                        script.println("history.back()");
                        script.println("</script>");
            }else{  //제목과 내용이 정상 입력되었다면
                 BbsDAO bbsDAO = new BbsDAO();
                 int result = bbsDAO.write(bbs.getBoard_Number(), bbs.getPost_Title(), bbs.getPost_Contents(), bbs.getPost_Category(),user_ID);   //글쓰기 로직 실행
                 
                 if(result == -1){      //데이터베이스 오류
                     PrintWriter script = response.getWriter();
                     script.println("<script>");
                     script.println("alert('글쓰기에 실패했습니다.')");
                     script.println("history.back()");
                     script.println("</script>");
                 }
                 else {             //글쓰기 정상 실행     
                     PrintWriter script = response.getWriter();
                     script.println("<script>");
                     if(bbs.getBoard_Number() == 1){
                         script.println("location.href = 'bbs1.jsp'");
                     }else if(bbs.getBoard_Number() == 2){
                         script.println("location.href = 'bbs2.jsp'");
                     }else if(bbs.getBoard_Number() == 3){
                         script.println("location.href = 'bbs3.jsp'");
                     }
                     
                     script.println("</script>");
                 }
            }
        }
    

    %>
</body>
</html>