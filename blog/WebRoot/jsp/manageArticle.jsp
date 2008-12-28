<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%@ include file="head.jsp" %>
<%@ page import="java.sql.*"  %>
<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
	
	<head>
	<style type="text/css">
.style1 {
	text-align: center;
}
</style>
	</head>

	<body style="margin: 100px 150px; background-image: url('../images/background2.png');">
	
		<table width="600" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tbspan" style="height: 19px">
				<tr>
											<td width="85%" valign="top" style="padding-left: 6px"
												colspan="2">
												<table width="100%" border="0" cellspacing="1"
													cellpadding="1" align="center">
												<tr>
													日志 <br><br>
												</tr>
												
		<tr>
			<td width=40% class=indl1>日期	</td>
			<td width=40% class=indl1>文章标题</td>
			<td width=40% class=indl1>修改</td>
			<td width=40% class=indl1>删除</td>
		</tr>										
													
		<%
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
		  res=stmt.executeQuery("select * from article");
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
              int[] x=new int[100]; //信息ID
              int i=0;
              String[] inTi=new String[100];//信息标题
              String[] inTm=new String[100];//发布时间
		      while (res.next())
		      {
		        x[i]=res.getInt(1);
		        inTi[i]=res.getString(2);
		        inTm[i]=res.getString(4);
		        i++;
		      }
		      for(i=0;x[i]!=0;i++){
		  
		      out.print("<tr><td width=40% class=indl1 >");
		      out.print(inTm[i]+"</td><td>");
		      
		      System.out.print(x[i]);
		      out.print("<a href='/blog/jsp/article_detail.jsp?inid="+x[i]+"'>"+inTi[i]+"</a></td><td>");
		      //request.setAttribute("inid",x[i] );
		     // out.print("</a></td>");
		     out.print("<a href='/blog/jsp/updateArticle.jsp?inid="+x[i]+"'><img src=\"../images/updateArticle.gif\" width=\"16\" height=\"16\"></a></td><td>");
		    out.print("<a href='/blog/servlet/DeleteArticle?inid="+x[i]+"'><img src=\"../images/deleteArticle.gif\" width=\"16\" height=\"16\"></a></td>");
		     
		      out.print("</tr>");
		     
		      }
		      
		  
		      res.close();
//		      out.println("Successful!");

		    }
		    catch (Exception ex)
		    {
		      System.out.println("Error : " + ex.toString());
		    }

	
	%>
			</table>
		
	</body>
</html>

			
			
			

