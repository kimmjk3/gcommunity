<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css" />
<title>Insert title here</title>
</head>
<body>
	<!--웹 사이트 제목-->
	<header>
		<a href="main.jsp" style="text-decoration: none;">
			<h1 style="text-align: center;">게임커뮤니티</h1>
		</a>
	</header>
	<!-- 웹 사이트 메뉴 -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="text-align: center; width:100%;">
		<div class="container-fluid">
			<a class="navbar-brand" href="main.jsp">게임커뮤니티</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02" aria-controls="navbarColor02"
				aria-expanded="false" aria-label="Toggle navigation"
			>
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarColor02">
				<ul class="navbar-nav me-auto">
					<li class="nav-item"><a class="nav-link" href="#">자유게시판 <span class="visually-hidden">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#">추천글</a></li>
					<li class="nav-item"><a class="nav-link" href="#">팁/공략</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	<!-- 게시글 리스트 -->
	<!--section-->
	<section style="margin-top: 5%; margin-left: 20%; margin-right: 20%; display: inline-block; width: 60%; height: 100%; border: 1px solid black;">
		<section style = "margin-top: 5%; margin-left:5%; margin-right:5%; width: 40%; height: 800px; border: 1px solid black;">
            
		</section>
		<section style = "margin-top: 5%; margin-left:5%; margin-right:5%; width: 40%; height: 400px; border: 1px solid black;">
            
        </section>

	</section>

	<!--하단 footer-->
	<footer style = "background-color : gray">
		<span>
			<p>
				제작자 : 김명진<br> 문의 : kimmjk35@naver.com
			</p>
		</span>
	</footer>
</body>
</html>