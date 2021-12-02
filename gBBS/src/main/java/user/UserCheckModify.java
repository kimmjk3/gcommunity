package user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.tribes.util.Arrays;

@WebServlet("/UserCheckModify")
public class UserCheckModify extends HttpServlet{
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
            try {
            UserDAO userDAO = new UserDAO();
            
            String[] userCheckList = request.getParameterValues("userCheckList");
            String userCheckLength = request.getParameter("userCheckLength");
            int uCL = Integer.parseInt(userCheckLength);
            int[] uCList = new int[uCL];
            
         
              
                    for(int i=0; i<uCL; i++) {
                        uCList[i] = Integer.parseInt(userCheckList[i]);
                        System.out.println(uCList[i]);
                       
                    }
                    
                    for(int i=0; i<uCL; i++) {
                       int result = userDAO.userStop(uCList[i]);
                        PrintWriter out = response.getWriter();
                        out.write(result + "");
                    }
                        
                    
                    
            
            
            }catch(Exception e) {
                e.printStackTrace();
                System.out.println("뭔가 잘못됨");
            }
        
        
        
        
    }

    
    
    
}



