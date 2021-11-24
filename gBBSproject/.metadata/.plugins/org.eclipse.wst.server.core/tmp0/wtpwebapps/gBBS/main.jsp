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
<title>메인</title>
</head>
<body>
	<%
	// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
	String user_ID = null;
	if (session.getAttribute("user_ID") != null) {
	    user_ID = (String) session.getAttribute("user_ID");
	}
    /* 페이지처리 */
    int pageNumber = 1;    
    if(request.getParameter("pageNumber")!=null){
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
					<li class="nav-item"><a class="nav-link" href="bbs.jsp">자유게시판 <span class="visually-hidden">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#">추천글</a></li>
					<li class="nav-item"><a class="nav-link" href="#">팁/공략</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- 게시글 리스트 -->
	<!--section-->
	<section
		style="margin-top: 10px; margin-bottom: 10px; margin-left: 20%; margin-right: 20%; width: 60%; height: 800px; border: 1px solid; text-align: center; display: inline-block"
	>
		<div class="card text-white bg-dark mb-3" style="width: 45%; height:320px; display: inline-block">
			<div class="card-header">자유게시판</div>
			<div class="card-body">
				<table style = "text-align:center;">
					<% 
                       BbsDAO bbsDAO = new BbsDAO();
					   int board_Number1 = 1;
                       ArrayList<Bbs> list1 = bbsDAO.getList(board_Number1,pageNumber);
                       for(int i=0; i<list1.size(); i++){
                    %>
					<tr>
						<td>
							<a href="view.jsp?post_Number=<%=list1.get(i).getPost_Number() %>"><%= list1.get(i).getPost_Title().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></a>
						</td>
					</tr>
					<%
                       }
                    %>
				</table>
			</div>
		</div>

        <div class="card text-white bg-dark mb-3" style="width: 45%; height:320px; display: inline-block">
            <div class="card-header">추천글</div>
            <div class="card-body">
                <table style = "text-align:center;">
                    <% 
                       //BbsDAO bbsDAO = new BbsDAO();
                       //int board_Number1 = 1;
                       //ArrayList<Bbs> list1 = bbsDAO.getList(board_Number,pageNumber);
                       for(int i=0; i<list1.size(); i++){
                    %>
                    <tr>
                        <td>
                            <a href="view.jsp?post_Number=<%=list1.get(i).getPost_Number() %>"><%= list1.get(i).getPost_Title().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></a>
                        </td>
                    </tr>
                    <%
                       }
                    %>
                </table>
            </div>
        </div>

        <div class="card text-white bg-dark mb-3" style="width: 45%; height:320px; display: inline-block">
            <div class="card-header">팁/공략</div>
            <div class="card-body">
                <table style = "text-align:center;">
                    <% 
                       int board_Number2 = 2;
                       ArrayList<Bbs> list2 = bbsDAO.getList(board_Number2,pageNumber);
                       for(int i=0; i<list2.size(); i++){
                    %>
                    <tr>
                        <td>
                            <a href="view.jsp?post_Number=<%=list2.get(i).getPost_Number() %>"><%= list2.get(i).getPost_Title().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></a>
                        </td>
                    </tr>
                    <%
                       }
                    %>
                </table>
            </div>
        </div>
        <div class="card text-white bg-dark mb-3" style="width: 45%; height:320px; display: inline-block">
            <div class="card-header">공지사항</div>
            <div class="card-body">
                <table style = "text-align:center;">
                    <% 
                       int board_Number3 = 3;
                       ArrayList<Bbs> list3 = bbsDAO.getList(board_Number3,pageNumber);
                       for(int i=0; i<list3.size(); i++){
                    %>
                    <tr>
                        <td>
                            <a href="view.jsp?post_Number=<%=list3.get(i).getPost_Number() %>"><%= list3.get(i).getPost_Title().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></a>
                        </td>
                    </tr>
                    <%
                       }
                    %>
                </table>
            </div>
        </div>
	</section>

</body>
</html>