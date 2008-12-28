<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%@ include file="head.jsp" %>
<%@ page import="java.sql.*"  %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
  <head>
   
    <title>详细信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
	<body style="margin: 100px 150px; background-image: url('../images/background2.png');">
  <p><br>
	</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
  <table width="900" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tbspan">
				<tr>
					<td width="880" background="/templets/img/31bg1.gif">
						<span class="STYLE61"><a href="/blog/jsp/index.jsp">首页</a>&gt;<a
							href="/blog/jsp/manageArticle.jsp">日志</a>
						</span> 
					</td>
				</tr>
			
 
  <%  String   Inid=(String)request.getParameter("inid");
       // out.print(abc);
       
       try
		    {
		      Connection conn=null;
		      Statement stmt;
		      ResultSet res = null;
		      //加载Connector/J驱动
		      //这一句也可写为：Class.forName("com.mysql.jdbc.Driver");
		      Class.forName("com.mysql.jdbc.Driver").newInstance();
		      //建立到MySQL的连接
		      conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/blog",
		                                         "root", "zzxwill");
		      
		      stmt = (Statement) conn.createStatement();
		  res=stmt.executeQuery("select * from article where articleID='"+Inid+"'");
				  
		    while (res.next())
		     { out.print("<table width=900 align=center border=0><tr><td align=center>");
		       out.print("<h2>"+res.getString(2)+"</h2></td></tr>");
		       out.print("<tr><td><p>"+res.getString(3)+"</p></td></tr>");
		       out.print("<tr><td align=right>"+res.getString(4)+"</td></tr>");

		      
		      }
		      
		      res=stmt.executeQuery("select * from comment where articleID='"+Inid+"'");
		      while (res.next())
		     { out.print("<table width=900 align=center border=0><tr><td>");
		       out.print("<h3>"+res.getString(2)+"</h3>");
		       out.print("("+res.getString(3)+")</td></tr>");
		       out.print("<tr><td>"+res.getString(4)+"</td></tr>");
				out.print("</table>");
		      
		      }
		  
		      res.close();
//		      out.println("Successful!");

		    }
		    catch (Exception ex)
		    {
		      System.out.println("Error : " + ex.toString());
		    }

	%>
	<tr>
		<td>
			评论 (0) |  阅读 (2)  |  固定链接 |  类别 (JSP) |  发表于 14:54
		</td>
	</tr>
	<tr><td></td></tr><tr></tr>
	 <tr>
		<td>
			<form action="/blog/servlet/AddComment" method="post">
				<input type="hidden" name="articleID" value=<%=Inid %>>
				姓名:<input type="text"  name="userName">(required)<br>
				E-mail:<input type="text"  name="userMail">(recommended)
				匿名评论<input type="checkbox" name="annoy" value="annoy">
				<br>
				评论内容:<textarea name="comment" rows="8" cols="50"></textarea><br>
				<input type="submit" value="发表">
			</form>
		</td>
	</tr>
	
	</table>
  </body>
</html>
