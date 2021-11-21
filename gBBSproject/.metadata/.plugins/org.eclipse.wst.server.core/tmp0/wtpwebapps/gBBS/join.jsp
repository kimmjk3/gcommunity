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
<title>회원가입</title>
</head>
<body>
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
            <!-- 헤더 우측에 나타나는 드랍다운 영역 -->
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle"
                        data-toggle="dropdown" role="button" aria-haspopup="true"
                        aria-expanded="false">접속하기<span class="caret"></span></a>
                    <!-- 드랍다운 아이템 영역 -->    
                    <ul class="dropdown-menu">
                        <li class="active"><a href="login.jsp">로그인</a></li>
                        <li><a href="join.jsp">회원가입</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
    
    <!-- 회원가입 양식 -->
    <div class="container">     <!-- 하나의 영역 생성 -->
        <div class="col-lg-4">  <!-- 영역 크기 -->
            <!-- 점보트론은 특정 컨텐츠, 정보를 두드러지게 하기 위한 큰 박스 -->
            <div class="jumbotron" style="padding-top: 20px;">
                <form method="post" action="joinAction.jsp" onsubmit="return checkPassFunction();"> <!-- form 태그 ation은 뭐냐면 보낸다고 폼태그안에 입력된 정보를 post 방식으로 -->
                    <h3 style="text-align: center;">회원가입 화면</h3>
                    
                    <h5 style="text-align: left;">아이디</h5>
                    <div class="form-group">
                        
	                        <input type="text" class="form-control" placeholder="10자 이내로 씁시다.."
	                         id="user_ID" name="user_ID" maxlength="10" onkeyup="idCheckReturn();">
	                        <input type="button" onclick="idCheckFunction();" value="중복체크">
	                        	                        
	                        <!-- <button onclick="action='./idCheckAction.jsp';">중복체크</button> -->
                        
                    </div>
                    
                    
                    
                    <h5 style="text-align: left;">비밀번호</h5>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="영문,숫자 포함 8자 이상 16자 이내" onkeyup="passwordCheckFunction();" 
                        id="user_PW1" name="user_PW" maxlength="20">
                    </div>
                    
                   <h5 style="text-align: left;">비밀번호 확인</h5>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="영문,숫자 포함 8자 이상 16자 이내" onkeyup="passwordCheckFunction();" 
                        id="user_PW2" name="user_PW" maxlength="20">
                        <h5 style="color: red;" id="passwordCheckMessage"></h5>
                    </div>
                    
                    
                   <!--  <tr>
                    <td style="text-align: Left" colspan="3"><h5 style="color: red;" id="passwordCheckMessage"></h5></td>
                    </tr> -->
                    
                    <h5 style="text-align: left;">이름</h5>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="한글 또는 영문 8자 이내" name="user_Name" maxlength="20">
                    </div>
                    
                    <h5 style="text-align: left;">닉네임</h5>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="한글 또는 영문 8자 이내" 
                        id="user_NickName" name="user_NickName" maxlength="20" onkeyup="nickCheckReturn();">
                        <input type="button" onclick="nickCheckFunction();" value="중복체크">
                    </div>
                    
                    <h5 style="text-align: left;">생년월일</h5>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="생년월일8자리" name="user_DOB" maxlength="20">
                    </div>
                    
                    <div class="form-group" style="text-align: center;">
                        <div class="btn-group" data-toggle="buttons">
                            <label class="btn btn-primary active">
                                <input type="radio" name="user_Gender" autocomplete="off" value="남자" checked>남자
                            </label>
                            <label class="btn btn-primary active">
                                <input type="radio" name="user_Gender" autocomplete="off" value="여자" checked>여자
                            </label>
                        </div>
                    </div>
                    
                    <h5 style="text-align: left;">이메일</h5>
                    <div class="form-group">
                        <input type="email" class="form-control" placeholder="이메일" 
                        id="user_Email" name="user_Email" maxlength="20" onkeyup="emailCheckReturn();">
                        <input type="button" onclick="emailCheckFunction();" value="중복체크">
                    </div>
                    
                    <h5 style="text-align: left;">휴대전화</h5>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="전화번호입력 - 빼고" 
                        name="user_PhoneNumber" id="user_PhoneNumber" maxlength="20">
                        <input type="button" onclick="CertifiedNumberCheck();" value="인증번호 받기">
                    </div>
                    
                    <input type="submit" class="btn btn-primary form-control" value="회원가입">
                </form>
            </div>
        </div>  
    </div>
    
    
    
    
    
    
    <!-- 부트스트랩 참조 영역 -->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    
    <script type="text/javascript">
    
    var idCheckPass = false;        //아이디중복 체크 확인변수
    var nickCheckPass = false;      //닉네임중복 체크 확인변수
    var emailCheckPass = false;     //이메일중복 체크 확인변수
    var allCheckPass = false;       //위 중복체크변수들 마지막 확인변수
    /* 아이디 중복 체크 펑션 */
    function idCheckFunction(){
       
        var user_ID = $('#user_ID').val();
        if(user_ID == null || user_ID == ""){
	         alert("아이디를 적어주세요");
         }else{
        	 $.ajax({
                 type: 'post', url: './UserIdCheck', data:{user_ID: user_ID},
              success: function(result){
                  if(result == 1){
                      alert("아이디가 중복입니다");
                  }else{
                      alert("아이디 사용 가능합니다");
                      
                      idCheckPass = true;
                  }
              }
             });
         }
    }
    
    /* 닉네임 중복 체크 펑션 */
    function nickCheckFunction(){
       
        var user_NickName = $('#user_NickName').val();
        if(user_NickName == null || user_NickName == ""){
             alert("닉네임을 적어주세요");
         }else{
             $.ajax({
                 type: 'post', url: './UserNickCheck', data:{user_NickName: user_NickName},
              success: function(result){
                  if(result == 1){
                      alert("닉네임을 중복입니다");
                  }else{
                      alert("닉네임 사용 가능합니다");
                      
                      nickCheckPass = true;
                  }
              }
             });
         }
    }
    
    /* 이메일 중복 체크 펑션 */
    function emailCheckFunction(){
       
        var user_Email = $('#user_Email').val();
        if(user_Email == null || user_Email == ""){
             alert("이메일을 적어주세요");
         }else{
             $.ajax({
                 type: 'post', url: './UserEmailCheck', data:{user_Email: user_Email},
              success: function(result){
                  if(result == 1){
                      alert("이메일 중복입니다");
                  }else{
                      alert("이메일 사용 가능합니다");
                      
                      emailCheckPass = true;
                  }
              }
             });
         }
    }
    
    
    function passwordCheckFunction(){    	//그뭐지 비밀번호 와 비밀번호확인이 같은지 
    	var user_PW1 = $('#user_PW1').val();
    	var user_PW2 = $('#user_PW2').val();
    	if(user_PW1 != user_PW2){ //비밀번호와 비밀번호확인이 같지 않다면 
    		$('#passwordCheckMessage').html('비밀번호가 서로 다릅니다');
    	}else{
    		$('#passwordCheckMessage').html('');
    	}
    }
    /* 중복체크 눌러서 확인 받았는지 체크하는 펑션 */
    
    function checkPassFunction(){
        if(idCheckPass == true && nickCheckPass == true && emailCheckPass == true){
        	return true;
        }else if(idCheckPass == false){
    		alert("아이디 중복 확인해야합니다.");
    		return false;
    	}else if(nickCheckPass == false){
            alert("닉네임 중복 확인해야합니다.");
            return false;
        }else if(emailCheckPass == false){
            alert("이메일 중복 확인해야합니다.");
            return false;
        }
    	
    }
 
 /*    var idCheckPass = false;        //아이디중복 체크 확인변수
    var nickCheckPass = false;      //닉네임중복 체크 확인변수
    var emailCheckPass = false;     //이메일중복 체크 확인변수 */
    
  /*  중복확인 값을 다시 적거나 고쳤을경우 다시 중복확인하게끔 */
   function idCheckReturn(){
	   idCheckPass = false;
    }
   function nickCheckReturn(){
	   nickCheckPass = false;
    }
   function emailCheckReturn(){
	   emailCheckPass = false;
    }
   
   
    
    
    </script>
</body>