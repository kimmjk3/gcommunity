<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 화면 최적화 -->
<meta name="viewport" content="width-device-width", initial-scale="1">
<!-- 루트 폴더에 부트스트랩을 참조하는 링크 -->
<link rel="stylesheet" href="css/bootstrap.css">
<!--제목폰트-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<!-- 로그인 제목 폰트-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<title>로그인</title>
</head>
<body style = "background-color:#F0FFFF;">
    <%
    // 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
    String user_ID = null;
    if (session.getAttribute("user_ID") != null) {
        user_ID = (String) session.getAttribute("user_ID");
    }
    %>
    <!--웹 사이트 제목-->
    <header>
        <a href="main.jsp" style="text-decoration: none;">
            <h1 style="text-align: center; font-family: 'Do Hyeon', sans-serif; color: black;">게임커뮤니티</h1>
        </a>
    </header>

    <%
    // 로그인 하지 않았을 때 보여지는 화면
    if (user_ID == null) {
    %>
    <a href="login.jsp" style="float: right; margin-bottom: 1px; text-decoration: none;" type="button" class="btn btn-secondary">로그인</a>
    <%
    // 로그인이 되어 있는 상태에서 보여주는 화면
    } else {
    %>
    <a href="logoutAction.jsp" style="float: right; margin-bottom: 1px; text-decoration: none;" type="button" class="btn btn-secondary">로그아웃</a>
    <%
    }
    %>
    <!-- 웹 사이트 메뉴 -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="text-align: center; width: 100%;">
        <div class="container-fluid">
            <a class="navbar-brand" href="main.jsp">게임커뮤니티</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02" aria-controls="navbarColor02"
                aria-expanded="false" aria-label="Toggle navigation"
            >
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarColor02">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item"><a class="nav-link" href="bbs1.jsp">자유게시판 <span class="visually-hidden">(current)</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="#">추천글</a></li>
                    <li class="nav-item"><a class="nav-link" href="bbs2.jsp">팁/공략</a></li>
                    <li class="nav-item"><a class="nav-link" href="bbs3.jsp">공지사항</a></li>
                </ul>
            </div>
        </div>
    </nav>
    
    <!-- 로그인 양식 -->
    <div class="container" style="text-align: center; width:30%; margin-top:50px;">     <!-- 하나의 영역 생성 -->
        <div>  <!-- 영역 크기 -->
            <!-- 점보트론은 특정 컨텐츠, 정보를 두드러지게 하기 위한 큰 박스 -->
            <div class="jumbotron" style="padding-top: 20px;">
                <form method="post" action="loginAction.jsp">
                    <h3 style="text-align: center;font-family: 'Jua', sans-serif; font-size: 30px;">로그인</h3>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="아이디" name="user_ID" maxlength="20">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="비밀번호" name="user_PW" maxlength="20">
                    </div>
                    <input type="submit" class="btn btn-primary form-control" value="로그인">
                    
                </form>
                    <button onclick=location="#" class="form-control">아이디/비밀번호찾기</button>
                    <button onclick=location="join.jsp" class="form-control">회원가입</button>
            </div>
        </div>  
    </div>
    
    
    <!-- 부트스트랩 참조 영역 -->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
</body>