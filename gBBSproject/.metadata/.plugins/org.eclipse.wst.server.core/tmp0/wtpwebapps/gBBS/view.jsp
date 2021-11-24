<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.User"%>
<%@ page import="user.UserDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<!--부트스트랩-->
<link rel="stylesheet" href="css/bootstrap.css" />
<!--제목폰트-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<title>메인</title>
</head>
<body>
	<%
	// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
	String user_ID = null;
	if (session.getAttribute("user_ID") != null) {
	    user_ID = (String) session.getAttribute("user_ID");
	}
	
	int post_Number = 0;
	if(request.getParameter("post_Number")!= null){
	    post_Number = Integer.parseInt(request.getParameter("post_Number"));
	}
	if(post_Number == 0){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('유효하지 않는 글입니다.')");
        script.println("location.href = 'bbs.jsp'");
        script.println("</script>");
	}
	
	User user = new UserDAO().getUser(user_ID);
	Bbs bbs = new BbsDAO().getBbs(post_Number);
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
					<li class="nav-item"><a class="nav-link active" href="bbs.jsp">자유게시판 <span class="visually-hidden">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#">추천글</a></li>
					<li class="nav-item"><a class="nav-link" href="#">팁/공략</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd;">
				<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글 보기</th>
					</tr>
				</thead>
				<tbody>
                    <tr>
                        <td style="width: 20%;">게시판</td>
                        <td colspan = "2">
                            <%if(bbs.getBoard_Number()==1){%>자유게시판<%}%>
                            <%if(bbs.getBoard_Number()==2){%>팁/공략<%}%>
                            <%if(bbs.getBoard_Number()==3){%>공지사항<%}%>
                        </td>
                    </tr>
					<tr>
                        <td style="width: 20%;">글 제목</td>
                        <td colspan = "2"><%= bbs.getPost_Title().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
                    <tr>
                        <td>작성자</td>
                        <td colspan = "2"><%= bbs.getUser_NickName() %></td>
                    </tr>
                    <tr>
                        <td>작성일자</td>
                        <td colspan = "2"><%= bbs.getPost_InputDate().substring(0,11) + " " + bbs.getPost_InputDate().substring(11,13)+"시 " + bbs.getPost_InputDate().substring(14,16) + "분"%></td>
                    </tr>
                    <tr>
                        <td>내용</td>
                        <td colspan = "2" style="min-height:200px; text-align:left;"><%= bbs.getPost_Contents().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
                    </tr>
				</tbody>
			</table>
			<a href="bbs.jsp" class="btn tn-primary">목록</a>
			<%
			    if(user_ID != null && user_ID.equals(bbs.getUser_ID())){
			%>
			         <a href="update.jsp?post_Number=<%= post_Number %>" class= "btn btn-primary">수정</a>
			         <a href="deleteAction.jsp?post_Number=<%= post_Number %>" class= "btn btn-primary">삭제</a>
			<%
			    }
			%>
		
			<div>
				<input type="submit" href="write.jsp" class="btn btn-primary" style="float: right;" value="글쓰기">
			</div>
		</div>
	</div>
</body>
</html>