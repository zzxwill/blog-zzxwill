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
													��־ <br><br>
												</tr>
												
		<tr>
			<td width=40% class=indl1>����	</td>
			<td width=40% class=indl1>���±���</td>
			<td width=40% class=indl1>�޸�</td>
			<td width=40% class=indl1>ɾ��</td>
		</tr>										
													
		<%
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
		  res=stmt.executeQuery("select * from article");
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
              int[] x=new int[100]; //��ϢID
              int i=0;
              String[] inTi=new String[100];//��Ϣ����
              String[] inTm=new String[100];//����ʱ��
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

			
			
			

