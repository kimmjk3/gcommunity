package storage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//참고용입니다 어디에도 연결되있지 않고 사용하고 있지않습니다.
@WebServlet("/UserNickCheck")
public class UserNickCheck extends HttpServlet{
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String user_NickName = request.getParameter("user_NickName");
        PrintWriter out = response.getWriter();
        /*
         * UserDAO userDAO = new UserDAO(); int result =
         * userDAO.joinNickCheck(user_NickName); //개발자 확인용 if(result == 1) {
         * System.out.println("result =1 이미 존재한 닉네임입니다"); }else if(result == 2) {
         * System.out.println("result =2 닉네임 사용 가능합니다 "); }
         * 
         * out.write(result + "");
         */
    }
}



