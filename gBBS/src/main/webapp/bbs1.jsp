<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.util.ArrayList"%>
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
<!-- 게시판 제목 폰트-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<title>게시판1</title>
<style>
a, a:hover {
	color: #000000;
	text-decoration: none;
}
</style>
</head>
<body style="background-color: #F0FFFF;">
	<%
	// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
	String user_ID = null;
	if (session.getAttribute("user_ID") != null) {
	    user_ID = (String) session.getAttribute("user_ID");
	}
	/* 페이지처리 */
	int pageNumber = 1;
	if (request.getParameter("pageNumber") != null) {
	    pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
					<li class="nav-item"><a class="nav-link active" href="bbs1.jsp">자유게시판<span class="visually-hidden">(current)</span></a></li>
					<li class="nav-item"><a class="nav-link" href="#">추천글</a></li>
					<li class="nav-item"><a class="nav-link" href="bbs2.jsp">팁/공략</a></li>
					<li class="nav-item"><a class="nav-link" href="bbs3.jsp">공지사항</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container" style="margin-top: 10px;">
		<div class="row">
			<div style="font-family: 'Jua', sans-serif; font-size: 30px;">자유게시판</div>
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd;">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">카테고리</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">추천수</th>
						<th style="background-color: #eeeeee; text-align: center;">조회수</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
					BbsDAO bbsDAO = new BbsDAO();
					int board_Number = 1;
					ArrayList<Bbs> list1 = bbsDAO.getList(board_Number, pageNumber);
					for (int i = 0; i < list1.size(); i++) {
					%>
					<tr>
						<td><%=list1.get(i).getPost_Number()%></td>
						<td><%=list1.get(i).getPost_Category()%></td>
						<td>
							<a href="view.jsp?post_Number=<%=list1.get(i).getPost_Number()%>"><%=list1.get(i).getPost_Title().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
        .replaceAll("\n", "<br>")%></a>
						</td>
						<td><%=list1.get(i).getUser_NickName()%></td>
						<td><%=list1.get(i).getPost_Recommend()%></td>
						<td><%=list1.get(i).getPost_Views()%></td>
						<td><%=list1.get(i).getPost_InputDate().substring(0, 11) + " " + list1.get(i).getPost_InputDate().substring(11, 13)
        + "시 " + list1.get(i).getPost_InputDate().substring(14, 16) + "분"%></td>
					</tr>

					<%
					}
					%>
				</tbody>
			</table>

			<!-- 페이징처리 -->
			<%
			if (pageNumber != 1) {
			%>
			<div>
				<div>
					<a href="bbs1.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-primary" style="float: left; margin-right: 2px;">이전</a>
				</div>
				<%
				}
				%>
				<%
				if (bbsDAO.nextPage(pageNumber + 1)) {
				%>
				<div>
					<a href="bbs1.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-primary" style="float: left;">다음</a>
				</div>
			</div>
			<%
			}
			%>

			<div>
				<a href="write.jsp" class="btn btn-primary" style="float: right;">글쓰기</a>
			</div>
		</div>
	</div>

</body>
</html>