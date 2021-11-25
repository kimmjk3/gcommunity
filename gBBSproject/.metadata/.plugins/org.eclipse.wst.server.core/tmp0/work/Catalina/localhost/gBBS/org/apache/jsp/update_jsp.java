/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.54
 * Generated at: 2021-11-25 06:23:38 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.PrintWriter;
import bbs.Bbs;
import bbs.BbsDAO;

public final class update_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.io.PrintWriter");
    _jspx_imports_classes.add("bbs.Bbs");
    _jspx_imports_classes.add("bbs.BbsDAO");
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
      out.write("\r\n");
      out.write("\r\n");
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
      out.write("<body style = \"background-color:#F0FFFF;\">\r\n");
      out.write("	");

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
    
    
	
      out.write("\r\n");
      out.write("	<!--웹 사이트 제목-->\r\n");
      out.write("	<header>\r\n");
      out.write("		<a href=\"main.jsp\" style=\"text-decoration: none;\">\r\n");
      out.write("			<h1 style=\"text-align: center; font-family: 'Do Hyeon', sans-serif; color: black;\">게임커뮤니티</h1>\r\n");
      out.write("		</a>\r\n");
      out.write("	</header>\r\n");
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
      out.write("            <div class=\"collapse navbar-collapse\" id=\"navbarColor02\">\r\n");
      out.write("                <ul class=\"navbar-nav me-auto\">\r\n");
      out.write("                    <li class=\"nav-item\"><a class=\"nav-link\" href=\"bbs1.jsp\">자유게시판 <span class=\"visually-hidden\">(current)</span></a></li>\r\n");
      out.write("                    <li class=\"nav-item\"><a class=\"nav-link\" href=\"#\">추천글</a></li>\r\n");
      out.write("                    <li class=\"nav-item\"><a class=\"nav-link\" href=\"bbs2.jsp\">팁/공략</a></li>\r\n");
      out.write("                    <li class=\"nav-item\"><a class=\"nav-link\" href=\"bbs3.jsp\">공지사항</a></li>\r\n");
      out.write("                </ul>\r\n");
      out.write("            </div>\r\n");
      out.write("		</div>\r\n");
      out.write("	</nav>\r\n");
      out.write("\r\n");
      out.write("	<div class=\"container\">\r\n");
      out.write("		<div class=\"row\">\r\n");
      out.write("			<form method=\"post\" action=\"updateAction.jsp?post_Number=");
      out.print(post_Number);
      out.write("\">\r\n");
      out.write("				<table class=\"table table-striped\" style=\"text-align: center; border: 1px solid #dddddd;\">\r\n");
      out.write("					<thead>\r\n");
      out.write("						<tr>\r\n");
      out.write("							<th colspan=\"2\" style=\"background-color: #eeeeee; text-align: center;\">게시판 글 수정 양식</th>\r\n");
      out.write("						</tr>\r\n");
      out.write("					</thead>\r\n");
      out.write("					<tbody>\r\n");
      out.write("						<tr>\r\n");
      out.write("							<td>\r\n");
      out.write("								<select type=\"number\" class=\"form-control\" placeholder=\"게시판 번호\" name=\"board_Number\">\r\n");
      out.write("                                    <option value=\"");
      out.print( bbs.getBoard_Number());
      out.write("\" selected hidden>\r\n");
      out.write("									");
if(bbs.getBoard_Number()==1){
      out.write("자유게시판");
}
      out.write("\r\n");
      out.write("									");
if(bbs.getBoard_Number()==2){
      out.write("팁/공략");
}
      out.write("\r\n");
      out.write("									");
if(bbs.getBoard_Number()==3){
      out.write("공지사항");
}
      out.write("\r\n");
      out.write("									</option>\r\n");
      out.write("									<option value=\"1\">자유게시판</option>\r\n");
      out.write("									<option value=\"2\">팁/공략</option>\r\n");
      out.write("									<option value=\"3\">공지사항</option>\r\n");
      out.write("								</select>\r\n");
      out.write("							</td>\r\n");
      out.write("						</tr>\r\n");
      out.write("						<tr>\r\n");
      out.write("							<td>\r\n");
      out.write("								<select type=\"text\" class=\"form-control\" placeholder=\"카테고리\" name=\"post_Category\">\r\n");
      out.write("									<option value=\"");
      out.print( bbs.getPost_Category());
      out.write("\" selected hidden>");
      out.print( bbs.getPost_Category());
      out.write("</option>\r\n");
      out.write("									<option value=\"LOL\">LOL</option>\r\n");
      out.write("									<option value=\"오버워치\">오버워치</option>\r\n");
      out.write("									<option value=\"서든어택\">서든어택</option>\r\n");
      out.write("									<option value=\"디아블로\">디아블로</option>\r\n");
      out.write("								</select>\r\n");
      out.write("							</td>\r\n");
      out.write("						</tr>\r\n");
      out.write("						<tr>\r\n");
      out.write("							<td>\r\n");
      out.write("								<input type=\"text\" class=\"form-control\" placeholder=\"글 제목\" name=\"post_Title\" maxlength=\"50\" value=\"");
      out.print( bbs.getPost_Title());
      out.write("\">\r\n");
      out.write("							</td>\r\n");
      out.write("						</tr>\r\n");
      out.write("						<tr>\r\n");
      out.write("							<td>\r\n");
      out.write("								<textarea class=\"form-control\" placeholder=\"글 내용\" name=\"post_Contents\" maxlength=\"1000\" style=\"height: 350px;\">");
      out.print( bbs.getPost_Contents());
      out.write("</textarea>\r\n");
      out.write("							</td>\r\n");
      out.write("						</tr>\r\n");
      out.write("					</tbody>\r\n");
      out.write("				</table>\r\n");
      out.write("				<div>\r\n");
      out.write("					<input type=\"submit\" href=\"updateAction.jsp\" class=\"btn btn-primary\" style=\"float: right;\" value=\"글수정\">\r\n");
      out.write("				</div>\r\n");
      out.write("			</form>\r\n");
      out.write("\r\n");
      out.write("		</div>\r\n");
      out.write("	</div>\r\n");
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