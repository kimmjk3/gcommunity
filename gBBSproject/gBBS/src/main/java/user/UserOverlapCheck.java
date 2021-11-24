package user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserOverlapCheck")
public class UserOverlapCheck extends HttpServlet{
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
            try {
            UserDAO userDAO = new UserDAO();
            
            if(request.getParameter("user_ID") != null) {
                String user_ID = request.getParameter("user_ID");
                int result = userDAO.joinIdCheck(user_ID);
                PrintWriter out = response.getWriter();
                System.out.println("아이디 작동됨");
                if(result == 1) {
                    System.out.println("result =1 이미 존재한 아이디입니다");
                }else if(result == 2) {
                    System.out.println("result =2 아이디 사용 가능합니다 ");
                }
                out.write(result + "");
                
            }else if(request.getParameter("user_NickName") != null) {
                String user_NickName = request.getParameter("user_NickName");
                int result = userDAO.joinNickCheck(user_NickName);
                PrintWriter out = response.getWriter();
                System.out.println("닉네임 작동됨");
                if(result == 1) {
                    System.out.println("result =1 이미 존재한 닉네임입니다");
                }else if(result == 2) {
                    System.out.println("result =2 닉네임 사용 가능합니다 ");
                }
                out.write(result + "");
                
            }else if(request.getParameter("user_Email") != null) {
                String user_Email = request.getParameter("user_Email");
                int result = userDAO.joinEmailCheck(user_Email);
                PrintWriter out = response.getWriter();
                System.out.println("이메일 작동됨");
                if(result == 1) {
                    System.out.println("result =1 이미 존재한 이메일입니다");
                }else if(result == 2) {
                    System.out.println("result =2 이메일 사용 가능합니다 ");
                }
                out.write(result + "");
                
            }
            
            }catch(Exception e) {
                e.printStackTrace();
                System.out.println("뭔가 잘못됨");
            }
        
        
        
        
    }
    
    
}



