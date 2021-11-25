<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>마이페이지</title>

</head>
<body style = "background-color:#F0FFFF;">
    <%
        // 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
        String user_ID = null;
        if(session.getAttribute("user_ID") != null){
            user_ID = (String)session.getAttribute("user_ID");
        }
       
    %>
    <nav class="navbar navbar-default"> <!-- 네비게이션 -->
        <div class="navbar-header">     <!-- 네비게이션 상단 부분 -->
            <!-- 네비게이션 상단 박스 영역 -->
            <button type="button" class="navbar-toggle collapsed"
                data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                aria-expanded="false">
                <!-- 이 삼줄 버튼은 화면이 좁아지면 우측에 나타난다 -->
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <!-- 상단 바에 제목이 나타나고 클릭하면 main 페이지로 이동한다 -->
            <a class="navbar-brand" href="main.jsp">Gcommunity</a>
        </div>
        <!-- 게시판 제목 이름 옆에 나타나는 메뉴 영역 -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="main.jsp">게시판</a></li>                
                <li><a href="bbs.jsp">추천글</a></li>
                <li><a href="bbs.jsp">팁/공략</a></li>
                
            </ul>
            <%
                // 로그인 하지 않았을 때 보여지는 화면
                if(user_ID == null){
            %>
            <!-- 헤더 우측에 나타나는 드랍다운 영역 -->
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle"
                        data-toggle="dropdown" role="button" aria-haspopup="true"
                        aria-expanded="false">접속하기<span class="caret"></span></a>
                    <!-- 드랍다운 아이템 영역 -->    
                    <ul class="dropdown-menu">
                        <li><a href="login.jsp">로그인</a></li>
                        <li><a href="join.jsp">회원가입</a></li>
                    </ul>
                </li>
            </ul>
            <%
                // 로그인이 되어 있는 상태에서 보여주는 화면
                }else{
            %>
            <!-- 헤더 우측에 나타나는 드랍다운 영역 -->
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle"
                        data-toggle="dropdown" role="button" aria-haspopup="true"
                        aria-expanded="false">회원관리<span class="caret"></span></a>
                    <!-- 드랍다운 아이템 영역 -->    
                    <ul class="dropdown-menu">
                        <li><a href="logoutAction.jsp">로그아웃</a></li>
                    </ul>
                </li>
            </ul>
            <%
                }
            %>
        </div>
    </nav>       
    
        <div class="container">
        <div class="row">
            <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
                <tbody>
                    
	                 <%
	                 user_ID=  "test2"; // 아이디가 일단 널로 해놓고 테스트로 미리 임시 아이디 지정 , 나중에 게시판에서 넘어올때 값을 들고오게끔 만들어야함
	                 if(request.getParameter("user_id") != null){ // 받아온 값이 아이디가 널이 아닐경우
	                     user_ID=request.getParameter("user_ID"); // 그 받아온 값을 user_ID에 넣는다
	                 }
	                 if(user_ID == null || user_ID == ""){// 예외처리
	                     PrintWriter script = response.getWriter();
	                     script.println("<script>");
	                     script.println("alert('뭔가 잘못됨')");
	                     script.println("history.back()");
	                     script.println("</script>");
	                 }
	                //뭐가 먼지.... UserDAO().getMyUser(user_ID)로 User에 담기는 정보를  myUser에 담는다...
	                User myUser = new UserDAO().getMyUser(user_ID); //아이디값이 잘담겼을때 실행됨
	                
	                %>
	                
	                <h3 style="text-align: center;"><%=myUser.getUser_ID()%>님 페이지</h3>
                         <tr>
                            <th style="background-color: #eeeeee; text-align: center;">이름</th>
                            <td><%=myUser.getUser_Name()%></td>
                        </tr>
                        
                        <tr>
                            <th style="background-color: #eeeeee; text-align: center;">아이디</th>
                            <td><%=myUser.getUser_ID()%></td>
                         </tr>
                         
                         <tr>
                            <th style="background-color: #eeeeee; text-align: center;">닉네임</th>
                            
                            <td><%=myUser.getUser_NickName()%></td>
                            
                         </tr>
                         
                         <tr>
                            <th style="background-color: #eeeeee; text-align: center;">비밀번호</th>
                            <td>이건 그냥 *******로 표시함</td>
                         </tr>
                         
                         <tr>
                            <th style="background-color: #eeeeee; text-align: center;">이메일</th>
                            <td><%=myUser.getUser_Email()%></td>
                         </tr>
                         
                         <tr>
                            <th style="background-color: #eeeeee; text-align: center;">휴대전화</th>
                            <td><%=myUser.getUser_PhoneNumber()%></td>
                         </tr>
                         
                         <tr>
                            <th style="background-color: #eeeeee; text-align: center;">내가 쓴 게시글</th>
                            <td>원리는 이해 했으니</td>
                         </tr>
                         
                         <tr>
                            <th style="background-color: #eeeeee; text-align: center;">내가 쓴 댓글</th>
                            <td>파일 받아서 하면될듯</td>
                        </tr>
               
                
               
                 
                    
                    
                </tbody>
            </table>
            
        </div>
    </div>
    <!-- 게시판 메인 페이지 영역 끝 -->
    <!-- 부트스트랩 참조 영역 -->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
</body>
</html>