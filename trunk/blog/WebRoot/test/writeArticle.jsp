<%@page contentType="text/html;   charset=gb2312"   language="java"%>  
<%@page pageEncoding="GB2312"%>

<html>
<body>
	<table width="900" border="0" align="center"  >
		
			
			<form action="/blog/servlet/StoreArticle" method="post">
				<tr><td>日errt志标题：</td>
					<td>		
			<input type="text" name="articleTitle" size="100" ></td>
				</tr>
				
				<tr>
  <input type="submit" name="save" value="发布日志"></tr>
			</form>
			</table>
	</body>
</html>

