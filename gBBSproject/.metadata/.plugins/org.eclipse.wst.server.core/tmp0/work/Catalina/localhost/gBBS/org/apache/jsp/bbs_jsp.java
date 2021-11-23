/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.54
 * Generated at: 2021-11-22 05:10:01 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class bbs_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width\" , initial-scale=\"1\">\r\n");
      out.write("<!--부트스트랩-->\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/bootstrap.css\" />\r\n");
      out.write("<!--제목폰트-->\r\n");
      out.write("<link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\r\n");
      out.write("<link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\r\n");
      out.write("<link href=\"https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap\" rel=\"stylesheet\">\r\n");
      out.write("<title>메인</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	");

        // 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
        String user_ID = null;
        if(session.getAttribute("user_ID") != null){
            user_ID = (String)session.getAttribute("user_ID");
        }
    
      out.write("\r\n");
      out.write("	<!--웹 사이트 제목-->\r\n");
      out.write("	<header>\r\n");
      out.write("		<a href=\"main.jsp\" style=\"text-decoration: none;\">\r\n");
      out.write("			<h1 style=\"text-align: center; font-family: 'Do Hyeon', sans-serif; color: black;\">게임커뮤니티</h1>\r\n");
      out.write("		</a>\r\n");
      out.write("	</header>\r\n");
      out.write("\r\n");
      out.write("	");

        // 로그인 하지 않았을 때 보여지는 화면
        if(user_ID == null){
    
      out.write("\r\n");
      out.write("	<a href=\"login.jsp\" style=\"float: right; margin-bottom: 1px; text-decoration: none;\" type=\"button\" class=\"btn btn-secondary\">로그인</a>\r\n");
      out.write("	");

        // 로그인이 되어 있는 상태에서 보여주는 화면
        }else{
    
      out.write("\r\n");
      out.write("	<a href=\"logoutAction.jsp\" style=\"float: right; margin-bottom: 1px; text-decoration: none;\" type=\"button\" class=\"btn btn-secondary\">로그아웃</a>\r\n");
      out.write("	");

        }
    
      out.write("\r\n");
      out.write("	<!-- 웹 사이트 메뉴 -->\r\n");
      out.write("	<nav class=\"navbar navbar-expand-lg navbar-dark bg-dark\" style=\"text-align: center; width: 100%;\">\r\n");
      out.write("		<div class=\"container-fluid\">\r\n");
      out.write("			<a class=\"navbar-brand\" href=\"main.jsp\">게임커뮤니티</a>\r\n");
      out.write("			<button class=\"navbar-toggler\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#navbarColor02\" aria-controls=\"navbarColor02\"\r\n");
      out.write("				aria-expanded=\"false\" aria-label=\"Toggle navigation\"\r\n");
      out.write("			>\r\n");
      out.write("				<span class=\"navbar-toggler-icon\"></span>\r\n");
      out.write("			</button>\r\n");
      out.write("\r\n");
      out.write("			<div class=\"collapse navbar-collapse\" id=\"navbarColor02\">\r\n");
      out.write("				<ul class=\"navbar-nav me-auto\">\r\n");
      out.write("					<li class=\"nav-item\"><a class=\"nav-link active\" href=\"bbs.jsp\">자유게시판 <span class=\"visually-hidden\">(current)</span>\r\n");
      out.write("					</a></li>\r\n");
      out.write("					<li class=\"nav-item\"><a class=\"nav-link\" href=\"#\">추천글</a></li>\r\n");
      out.write("					<li class=\"nav-item\"><a class=\"nav-link\" href=\"#\">팁/공략</a></li>\r\n");
      out.write("				</ul>\r\n");
      out.write("			</div>\r\n");
      out.write("		</div>\r\n");
      out.write("	</nav>\r\n");
      out.write("\r\n");
      out.write("	<div class=\"container\">\r\n");
      out.write("		<div class=\"row\">\r\n");
      out.write("			<table class=\"table table-striped\" style=\"text-align: center; border: 1px solid #dddddd;\">\r\n");
      out.write("				<thead>\r\n");
      out.write("					<tr>\r\n");
      out.write("						<th style=\"background-color: #eeeeee; text-align: center;\">번호</th>\r\n");
      out.write("						<th style=\"background-color: #eeeeee; text-align: center;\">카테고리</th>\r\n");
      out.write("						<th style=\"background-color: #eeeeee; text-align: center;\">제목</th>\r\n");
      out.write("						<th style=\"background-color: #eeeeee; text-align: center;\">작성자</th>\r\n");
      out.write("						<th style=\"background-color: #eeeeee; text-align: center;\">추천수</th>\r\n");
      out.write("						<th style=\"background-color: #eeeeee; text-align: center;\">작성일</th>\r\n");
      out.write("					</tr>\r\n");
      out.write("				</thead>\r\n");
      out.write("				<tbody>\r\n");
      out.write("					<tr>\r\n");
      out.write("						<td>1</td>\r\n");
      out.write("						<td>LOL</td>\r\n");
      out.write("						<td>하이하이</td>\r\n");
      out.write("						<td>홍길동</td>\r\n");
      out.write("						<td>4</td>\r\n");
      out.write("						<td>2021-11-22</td>\r\n");
      out.write("					</tr>\r\n");
      out.write("				</tbody>\r\n");
      out.write("			</table>\r\n");
      out.write("			<div>\r\n");
      out.write("				<a href=\"write.jsp\" class=\"btn btn-primary\" style=\"float: right;\">글쓰기</a>\r\n");
      out.write("			</div>\r\n");
      out.write("		</div>\r\n");
      out.write("	</div>\r\n");
      out.write("\r\n");
      out.write("	<!--하단 footer-->\r\n");
      out.write("	<footer style=\"background-color: gray\">\r\n");
      out.write("		<div>\r\n");
      out.write("			<p>\r\n");
      out.write("				footer<br>footer<br>footer1\r\n");
      out.write("			</p>\r\n");
      out.write("		</div>\r\n");
      out.write("	</footer>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
