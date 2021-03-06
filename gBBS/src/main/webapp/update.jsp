<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "bbs.Bbs" %>
<%@ page import = "bbs.BbsDAO" %>
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
<title>게시글 수정</title>
</head>
<body style = "background-color:#F0FFFF;">
	<%
	// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
	String user_ID = null;

	if (session.getAttribute("user_ID") != null) {
	    user_ID = (String) session.getAttribute("user_ID");
	}
	if(user_ID == null){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('로그인을 하세요.')");
        script.println("location.href = 'bbs.jsp'");
        script.println("</script>");
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
    Bbs bbs = new BbsDAO().getBbs(post_Number);
    if(!user_ID.equals(bbs.getUser_ID())){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('권한이 없습니다.')");
        script.println("location.href = 'bbs.jsp'");
        script.println("</script>");
    }
    
    
	%>
	<!--웹 사이트 제목-->
	<header>
		<a href="main.jsp" style="text-decoration: none;">
			<h1 style="text-align: center; font-family: 'Do Hyeon', sans-serif; color: black;">게임커뮤니티</h1>
		</a>
	</header>
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

	<div class="container">
		<div class="row">
			<form method="post" action="updateAction.jsp?post_Number=<%=post_Number%>">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd;">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 수정 양식</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<select type="number" class="form-control" placeholder="게시판 번호" name="board_Number">
                                    <option value="<%= bbs.getBoard_Number()%>" selected hidden>
									<%if(bbs.getBoard_Number()==1){%>자유게시판<%}%>
									<%if(bbs.getBoard_Number()==2){%>팁/공략<%}%>
									<%if(bbs.getBoard_Number()==3){%>공지사항<%}%>
									</option>
									<option value="1">자유게시판</option>
									<option value="2">팁/공략</option>
									<option value="3">공지사항</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								<select type="text" class="form-control" placeholder="카테고리" name="post_Category">
									<option value="<%= bbs.getPost_Category()%>" selected hidden><%= bbs.getPost_Category()%></option>
									<option value="LOL">LOL</option>
									<option value="오버워치">오버워치</option>
									<option value="서든어택">서든어택</option>
									<option value="디아블로">디아블로</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" class="form-control" placeholder="글 제목" name="post_Title" maxlength="50" value="<%= bbs.getPost_Title()%>">
							</td>
						</tr>
						<tr>
							<td>
								<textarea class="form-control" placeholder="글 내용" name="post_Contents" maxlength="1000" style="height: 350px;"><%= bbs.getPost_Contents()%></textarea>
							</td>
						</tr>
					</tbody>
				</table>
				<div>
					<input onclick=update_event() type="submit" class="btn btn-primary" style="float: right;" value="글수정">
				</div>
                <script>
                function update_event(){
                    alert("수정되었습니다.")
                }
                </script>
			</form>

		</div>
	</div>
</body>
</html>