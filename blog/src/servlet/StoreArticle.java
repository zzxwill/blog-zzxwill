package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
public class StoreArticle extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public StoreArticle() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 

		java.util.Date currentTime = new java.util.Date();//得到当前系统时间 
		System.out.println(currentTime);
		
		String str_date1 = formatter.format(currentTime); //将日期时间格式化 
		System.out.println(str_date1);
//		String str_date2 = currentTime.toString(); //将Date型日期时间转换成字符串形式 
//		System.out.println(str_date2);
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");

		
/*		
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 

		java.util.Date currentTime = new java.util.Date();//得到当前系统时间 
		out.println(currentTime);
		String str_date1 = formatter.format(currentTime); //将日期时间格式化 
		out.println(str_date1);
		String str_date2 = currentTime.toString(); //将Date型日期时间转换成字符串形式 
		out.println(str_date2);
*/
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("gb2312"); 
		response.setContentType("text/html;charset=gb2312");
		

		PrintWriter out = response.getWriter();
//		out.println("<%@page pageEncoding=\"GB2312\"%>");
//		Object articleName=request.getParameter("articleName");
//		System.out.println(articleName);
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
//		out.print("测试2");
		String articleTitle=request.getParameter("articleTitle");
		out.println(request.getParameter("articleTitle"));
		String articleContent=request.getParameter("articleContent");
		out.println(request.getParameter("articleContent"));
		
//		out.println(request.getParameter("articleDate"));
//		out.println(request.getParameterValues("articleContent"));
		
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		java.util.Date currentTime = new java.util.Date();//得到当前系统时间 
//		out.println("currentTime"+currentTime);
		String articleDate = formatter.format(currentTime); //将日期时间格式化 
		out.println(articleDate);
		String str_date2 = articleDate.toString(); //将Date型日期时间转换成字符串形式 
		out.println(str_date2);
		
		try{
			Connection conn=null;
			Statement stmt=null;
			ResultSet res=null;
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/blog?useUnicode=true&characterEncoding=GB2312","root","zzxwill");
			stmt=(Statement)conn.createStatement();
			res=stmt.executeQuery("select count(*) from article");
			int articleID=0;
			while(res.next()){
				articleID=res.getInt(1);
				
			}
			articleID++;
			System.out.print("articleID: "+articleID);
			int num=stmt.executeUpdate("insert into article values('"+articleID+"','"+articleTitle+"','"+articleContent+"','"+str_date2+"');");
			
			if(num==1){
				out.print("成功发表日志");
			}else{
				out.print("发表日志失败.");
			}
			out.print("<a href=\"/blog/jsp/writeArticle.jsp\">请返回</a>");
//			res.close();

	    }
	    catch (Exception ex)
	    {
	      System.out.println("Error : " + ex.toString());
	    }
		
		
		out.println("  </BODY>");
		out.println("</HTML>");
//		out.flush();
//		out.close();
	}

	/**
	 * Returns information about the servlet, such as 
	 * author, version, and copyright. 
	 *
	 * @return String information about this servlet
	 */
	public String getServletInfo() {
		return "This is my default servlet created by Eclipse";
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
