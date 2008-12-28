<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%@include file="head.jsp"%>
<%@page import="java.sql.*;"  %>

<html>
  <head>
    
    <title>修改个人信息</title>
    
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
   <table width="900" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tbspan">
				<tr>
					<td width="880" background="/templets/img/31bg1.gif">
						<span class="STYLE61"><a href="/labmanagement/jsp/index.jsp">首页</a> | <a
							href="/labmanagement/jsp/labmem.jsp">修改个人信息</a> | <a href="/labmanagement/jsp/resrouse.jsp">资源</a>
							| <a href="/labmanagement/jsp/memproject.jsp">任务</a> | <a href="/labmanagement/jsp/morePubInfo.jsp">
								公共信息</a> | <a href="/labmanagement/jsp/equipment.jsp">设备</a> | <a href="mailto:zzxwill@buaa.edu.cn">联系我们</a> | <a href="/labmanagement/jsp/logout.jsp">注销</a>
						</span> 
					</td>
				</tr>
			</table>
  <%
			  Object id=session.getAttribute("memID");
		      Connection conn=null;
		      Statement stmt;
		      ResultSet res = null;
		      //加载Connector/J驱动
		      //这一句也可写为：Class.forName("com.mysql.jdbc.Driver");
		      Class.forName("com.mysql.jdbc.Driver").newInstance();
		      //建立到MySQL的连接
		      conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/labmanagement",
		                                         "root", "zzxwill");
		      //执行SQL语句
		      
		      stmt = (Statement) conn.createStatement();
            
		     res = stmt.executeQuery("select * from  labmem where memID='"+id+"'");
		     int memId=0;
		     String stuNo=null;
             String memName=null;
             String labNo=null;
             String QQ=null;
             String MSN=null;
             String telephone=null;
             String password=null;
             while (res.next()){
             password=res.getString(3);
             stuNo=res.getString(4);
             memName=res.getString(2);
             labNo=res.getString(5);
             QQ=res.getString(6);
             MSN=res.getString(7);
             telephone=res.getString(8);
             
             }
%>
 <%   request.setCharacterEncoding("gb2312");   %>
  
  <table align="center" width="900">

  <h2> 修改个人信息</h2>
  
    <form action="/labmanagement/servlet/LabMem" method="post"> 
    <input name="pass" type="hidden" value=<%=password %> size="25" ><br />
     实验室ID：<input name="memID" type="text" value=<%=id %> size="20" readonly><br />
     学号: <input name="stuNo" type="text" value=<%=stuNo %> size="25"  readonly><br />
     姓名:<input name="memName" type="text"  value=<%=memName%> size="25"  ><br />
    QQ：<input name="QQ"  type="text" value=<%=QQ %> size="25" ><br />
	MSN：<input name="MSN"  type="text" value=<%=MSN %> size="25" ><br />
	实验室号：<input name="labNo"  type="text" value=<%=labNo %> size="25" ><br />
	联系电话：<input name="telephone"  type="text" value=<%=telephone %> size="25" ><br />
	原密码：<input name="password" type="password" size="25" ><br />
	更改密码：<input name="npd"  type="password"  size="25" ><br />
	重新输入密码：<input name="npd2"  type="password"  size="25" ><br />
	<input type="submit" value="确认更改" /><br />
	</form>
	
	
	
	</table>
	
  </body>
</html>
