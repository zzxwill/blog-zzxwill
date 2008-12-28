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
  
  <body>
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
			</table>
 
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
		      //执行SQL语句
		      
		      stmt = (Statement) conn.createStatement();
//		      res = stmt.executeQuery("select * from notice");
//		      stmt.executeUpdate("insert into notice(developer,content,submitTime,deadline,rank,title) values('developer','content','submitTime','deadline','rank','title')");
//		  int number=stmt.executeUpdate("update notice set developer="+developer+",content='"+content+"',submitTime='"+strSubmitTime+"',deadline='"+strDeadline+"',rank="+rank+",title='"+title+"' where id='"+strID+"'");
		  res=stmt.executeQuery("select * from article where articleID='"+Inid+"'");
//		      res=stmt.executeQuery("select * from labmem ");
				  
//		  out.print("添加的条数："+number);
		  /*
		   * 如果添加的条数为一，则表示成功插入了数据，因此，可以用这来判断数据库是否成功插入了数据。
		   */
		  
//		  if(number==1){
//			  out.println("恭喜您，公告更改成功！<br>");
//			  out.println("<a href='manageNotice-jsp.jsp'>返回公告管理页面</a>");
//		  }
//		  else{
//			  out.println("对不起，公告更新失败，请返回继续操作！");
//			  out.println("<a href='changeNotice.jsp'>返回公告管理页面</a>");
//		  }  
		  
//		      stmt.executeUpdate("insert into notice(developer,content,submitTime,deadline,rank,title) values('2','4','2008-11-22','2009-1-1','55','What the hell are you doing?')");
		      //处理结果集
              //int[] x=new int[100]; //信息ID
             //int i=0;
              //String[] inTi=new String[100];//信息标题
             // String[] inTm=new String[100];//发布时间
		    while (res.next())
		     { out.print("<table width=900 align=center border=0><tr><td align=center>");
		       out.print("<h2>"+res.getString(2)+"</h2></td></tr>");
		       out.print("<tr><td><p>"+res.getString(3)+"</p></td></tr>");
		       out.print("<tr><td align=right>"+res.getString(4)+"</td></tr>");
//		       out.print("</table>");
		        //x[i]=res.getInt(1);
		       // inTi[i]=res.getString(2);
		        //inTm[i]=res.getString(4);
		        //i++;
		     // }
		     // for(i=0;x[i]!=0;i++){
		  
		      
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
				姓名:<input type="text"  name="userName">(required)<br>
				密码:<input type="text"  name="userMail">(recommended)
				匿名评论<input type="checkbox" name="annoy">
				<br>
				评论内容:<textarea rows="8" cols="50"></textarea><br>
				<input type="submit" value="发表">
			</form>
		</td>
	</tr>
	
	</table>
  </body>
</html>
