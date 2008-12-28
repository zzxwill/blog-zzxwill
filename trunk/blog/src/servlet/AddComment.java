package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
public class AddComment extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddComment() {
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

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
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

		response.setContentType("text/html");
		request.setCharacterEncoding("gb2312"); 
		response.setContentType("text/html;charset=gb2312");

		PrintWriter out = response.getWriter();
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		//��־ID
		String articleID=request.getParameter("articleID");
		String select[]=request.getParameterValues("annoy");
		String userName=request.getParameter("userName");
		String userMail=request.getParameter("userMail");
		String comment=request.getParameter("comment");
		System.out.print(userName+"\t"+userMail+"\t"+comment);
		
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 

		java.util.Date currentTime = new java.util.Date();//�õ���ǰϵͳʱ�� 
		
		String commentTime = formatter.format(currentTime); //������ʱ���ʽ�� 	
		//ѡ����
		try{
			Connection conn=null;
			Statement stmt=null;
			ResultSet res=null;
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/blog?useUnicode=true&characterEncoding=GB2312","root","zzxwill");
			stmt=(Statement)conn.createStatement();
			
		if(select==null){
			
				int num=stmt.executeUpdate("insert into comment(userName,commentTime,comment,userMail,articleID) values('"+userName+"','"+commentTime+"','"+comment+"','"+userMail+"',"+articleID+");");
				
				
				if(num==1){
					out.print("�ɹ�������־");
				}else{
					out.print("������־ʧ��.");
				}
				out.print("<a href=\"/blog/jsp/article_detail.jsp?Inid=<%=articleID%>\">�뷵��</a>");
//				res.close();

		    
			
		}
		//û��ѡ��
		if(select!=null){			
			
				
				int num=stmt.executeUpdate("insert into comment(userName,commentTime,comment,userMail,articleID) values('�ο�','"+commentTime+"','"+comment+"','��',"+articleID+");");
				
				
				if(num==1){
					out.print("�ɹ�������־");
				}else{
					out.print("������־ʧ��.");
				}
				out.print("<a href=\"/blog/jsp/writeArticle.jsp\">�뷵��</a>");
//				res.close();

		   
			
		}
		
		
			
			

	    }
	    catch (Exception ex)
	    {
	      System.out.println("Error : " + ex.toString());
	    }
		
		
	
		
	
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		
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
