<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%@ include file="head.jsp" %>
<%@ page import="java.sql.*"  %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
  <head>
   
    <title>��ϸ��Ϣ</title>
    
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
						<span class="STYLE61"><a href="/blog/jsp/index.jsp">��ҳ</a>&gt;<a
							href="/blog/jsp/manageArticle.jsp">��־</a>
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
		      //����Connector/J����
		      //��һ��Ҳ��дΪ��Class.forName("com.mysql.jdbc.Driver");
		      Class.forName("com.mysql.jdbc.Driver").newInstance();
		      //������MySQL������
		      conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/blog",
		                                         "root", "zzxwill");
		      //ִ��SQL���
		      
		      stmt = (Statement) conn.createStatement();
//		      res = stmt.executeQuery("select * from notice");
//		      stmt.executeUpdate("insert into notice(developer,content,submitTime,deadline,rank,title) values('developer','content','submitTime','deadline','rank','title')");
//		  int number=stmt.executeUpdate("update notice set developer="+developer+",content='"+content+"',submitTime='"+strSubmitTime+"',deadline='"+strDeadline+"',rank="+rank+",title='"+title+"' where id='"+strID+"'");
		  res=stmt.executeQuery("select * from article where articleID='"+Inid+"'");
//		      res=stmt.executeQuery("select * from labmem ");
				  
//		  out.print("��ӵ�������"+number);
		  /*
		   * �����ӵ�����Ϊһ�����ʾ�ɹ����������ݣ���ˣ������������ж����ݿ��Ƿ�ɹ����������ݡ�
		   */
		  
//		  if(number==1){
//			  out.println("��ϲ����������ĳɹ���<br>");
//			  out.println("<a href='manageNotice-jsp.jsp'>���ع������ҳ��</a>");
//		  }
//		  else{
//			  out.println("�Բ��𣬹������ʧ�ܣ��뷵�ؼ���������");
//			  out.println("<a href='changeNotice.jsp'>���ع������ҳ��</a>");
//		  }  
		  
//		      stmt.executeUpdate("insert into notice(developer,content,submitTime,deadline,rank,title) values('2','4','2008-11-22','2009-1-1','55','What the hell are you doing?')");
		      //��������
              //int[] x=new int[100]; //��ϢID
             //int i=0;
              //String[] inTi=new String[100];//��Ϣ����
             // String[] inTm=new String[100];//����ʱ��
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
			���� (0) |  �Ķ� (2)  |  �̶����� |  ��� (JSP) |  ������ 14:54
		</td>
	</tr>
	<tr><td></td></tr><tr></tr>
	 <tr>
		<td>
			<form action="/blog/servlet/AddComment" method="post">
				����:<input type="text"  name="userName">(required)<br>
				����:<input type="text"  name="userMail">(recommended)
				��������<input type="checkbox" name="annoy">
				<br>
				��������:<textarea rows="8" cols="50"></textarea><br>
				<input type="submit" value="����">
			</form>
		</td>
	</tr>
	
	</table>
  </body>
</html>
