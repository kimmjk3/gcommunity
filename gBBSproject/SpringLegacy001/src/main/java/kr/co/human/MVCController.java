package kr.co.human;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MVCController {

    private static final Logger logger = LoggerFactory.getLogger(MVCController.class);

    @Autowired private loginService;
    
    @RequestMapping(value = "/helloMVC", method = RequestMethod.GET)
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.addObject("data", "안녕 스프링 MVC");
        mv.setViewName("helloMVC");
        return mv;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)

    public ModelAndView userLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = request.getParameter("userID");
        String pw = request.getParameter("userPassword");
        System.out.printf("화면에서 받아온 id : %s, pw : %s\n", id, pw);
        boolean result = loginService.login(id, pw);

        ModelAndView mv = new ModelAndView();
        mv.addObject("result", result);
        mv.setViewName("loginResult");
        return mv;
    }
}
