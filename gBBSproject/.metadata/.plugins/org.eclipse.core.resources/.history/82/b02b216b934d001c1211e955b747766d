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
<title>메인</title>

</head>
<body>
    <%
        // 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
        String user_ID = null;
        if(session.getAttribute("user_ID") != null){
            user_ID = (String)session.getAttribute("user_ID");
        }
        int pageNumber = 1; //기본은 1 페이지를 할당
        // 만약 파라미터로 넘어온 오브젝트 타입 'pageNumber'가 존재한다면
        // 'int'타입으로 캐스팅을 해주고 그 값을 'pageNumber'변수에 저장한다
        if(request.getParameter("pageNumber") != null){
            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
                <thead>
                    <tr>
                        <th style="background-color: #eeeeee; text-align: center;">
                            <input type="checkbox" class="check" id="allCheck" onclick="allCheckBox(this)">
                        </th>
                        <th style="background-color: #eeeeee; text-align: center;">회원번호</th>
                        <th style="background-color: #eeeeee; text-align: center;">아이디</th>
                        <th style="background-color: #eeeeee; text-align: center;">이름</th>
                        <th style="background-color: #eeeeee; text-align: center;">닉네임</th>
                        <th style="background-color: #eeeeee; text-align: center;">성별</th>
                        <th style="background-color: #eeeeee; text-align: center;">가입일</th>
                        <th style="background-color: #eeeeee; text-align: center;">탈퇴일</th>
                        <th style="background-color: #eeeeee; text-align: center;">활동상태</th>
                    </tr>
                </thead>
                <tbody>
                <%
                UserDAO userDAO = new UserDAO();
                ArrayList<User> list = userDAO.getList(pageNumber);
                for(int i = 0; i <list.size(); i=i+1){
                %>
                    <tr>
                        <!-- 유저 데이터들 -->
                        <td><input type="checkbox" class="check" name="rowCheck" 
                        onclick="rowCheckBox()" id="<%=list.get(i).getUser_Number()%>"></td>
                        
                        <td><%=list.get(i).getUser_Number()%></td>
                        <td><%=list.get(i).getUser_ID()%></td>
                        <td><%=list.get(i).getUser_Name()%></td>
                        <td><%=list.get(i).getUser_NickName()%></td>
                        
                        <td><%=list.get(i).getUser_Gender()%></td>
                        <td><%=list.get(i).getUser_JoinDate()%></td>
                        <td><%=list.get(i).getUser_SecessionDate()%></td>
                        <td><%=list.get(i).getUser_State()%></td>
                        
                        
                    </tr>
                    
                    <%
                        }
                     %>
                </tbody>
	                
	                
	               
            </table>
            <div>
            <button onclick="userStop()">선택정지</button>
            </div>
            
            <div>
            <td>활동상태 :0:탈퇴 1:활동중 2:정지</td>
            </div>
            
            <a href="" class="btn btn-primary pull-right">흠</a>
        </div>
    </div>
    <!-- 게시판 메인 페이지 영역 끝 -->
    <!-- 부트스트랩 참조 영역 -->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script type="text/javascript">
    
  //체크박스 전체 선택 클릭 이벤트
    function allCheckBox(target){
        
        if($(target).is(":checked")){
            //체크박스 전체 체크
            $(".check").prop("checked", true);
        }
        
        else{
            //체크박스 전체 해제
            $(".check").prop("checked", false);
        }
    }
  
    function rowCheckBox(){
        
        //체크박스 전체개수
        var allCount = $("input:checkbox[name=rowCheck]").length;
        
        //체크된 체크박스 전체개수
        var checkedCount = $("input:checkbox[name=rowCheck]:checked").length;
        
        //체크박스 전체개수와 체크된 체크박스 전체개수가 같으면 체크박스 전체 체크
        if(allCount == checkedCount){
            $(".check").prop("checked", true);
        }
        
        //같지않으면 전체 체크박스 해제
        else{
            $("#allCheck").prop("checked", false);
        }
    }
    </script>
    
    <script type="text/javascript">
    
     function userStop(){
    	 var userCheckLength = $("input[name='rowCheck']:checked").length;
         var userCheckList = new Array();
         $("input[name='rowCheck']:checked").each(function() {
        	 userCheckList.push($(this).attr('id'));
         });
         if(userCheckLength == 0){
        	 alert("선택된 유저가 없습니다.");
         }else{
        	 $.ajax = {
                     type: 'POST',
                     url: 'UserCheckModify',
                     traditional : true,
                     data: {userCheckList: userCheckList,userCheckLength: userCheckLength},
                     dataType:"json",
                     success: function(result){
                         if(result == 1) {
                             alert("수정 성공");
                         }
                         else{
                             alert("수정 실패");
                         }
                     }
                  };
        	   }
           } 
    </script>
</body>
</html>