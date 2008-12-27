<%@   page   contentType="text/html;   charset=gb2312"   language="java"%>  
<%@page pageEncoding="GB2312"%>
<%@include file="head.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>实验室管理系统网站</title>
		
<style type="text/css">
.relatedLinks h3 {
	padding: 10px 0px 2px 0px;
}

.STYLE14 {
	color: #000099;
	font-size: 14px;
	font-family: "微软雅黑";
	font-weight: bold;
}

h3 {
	font-size: 100%;
	color: #334d55;
}

h3 {
	font-family: Arial, sans-serif;
	margin: 0px;
	padding: 0px;
}

.STYLE26 {
	font-family: "微软雅黑";
	font-weight: bold;
	background-color: #FFFF99;
}

.STYLE61 {
	font-family: "微软雅黑";
	font-size: 18px;
	color: #006699;
}

body
{
	margin:0;
}

body{margin:0;padding:0;background:#fff;color:#666;font:normal 12px/1.6em Verdana,Arial,sans-serif,"宋体";}
input.text{height:16px;padding:2px;line-height:14px;}
input.text{border:1px solid #ccc;outline:0 none;color:#333;}
input{color:#666;font:normal 12px/1.6em Verdana,Arial,sans-serif,"宋体";}
select.select{height:20px;}
select.select{border:1px solid #ccc;outline:0 none;color:#333;}
select{color:#666;font:normal 12px/1.6em Verdana,Arial,sans-serif,"宋体";}
input.button{background:url('btn_normal_bg.jpg') repeat-x center;
}
input.button{cursor:pointer;height:22px;padding:0 12px;*padding:0 4px;color:#666;}
input.button{border:1px solid #ccc;outline:0 none;color:#333;}
textarea{color:#666;font:normal 12px/1.6em Verdana,Arial,sans-serif,"宋体";}
.style2 {
	text-align: right;
	vertical-align: top;
	padding: 2px 0;
}
.style3 {
	text-align: left;
	vertical-align: top;
	padding: 2px 0;
}

</style>
</head>

	<body style="margin: 100px 150px; background-image: url('../images/background2.png');">
		<center>
		<%
		java.util.Date articleDate = new java.util.Date();//得到当前系统时间 
		out.println(articleDate);
//		String str_date1 = formatter.format(currentTime); //将日期时间格式化 
//		out.println(str_date1);
		String str_date2 = articleDate.toString(); //将Date型日期时间转换成字符串形式 
		out.println(str_date2); %>
			
			
			<table width="900" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tbspan">
				<tr>
					<td height="6" style="height: 3px"></td>
				</tr>
				<tr>
					<td style="height: 3px"><img src="../images/ico_write.gif" width="16" height="16"><a href="writeArticle.html">撰写新日志</a></td>
				</tr>
				<tr>
					<td height="6" style="height: 1px">&nbsp;</td>
				</tr>
				<tr>
					<td height="6" style="height: 1px">
					
					
					</td>
				</tr>
				<tr>
					<td height="6" style="height: 1px">&nbsp;</td>
				</tr>
				<tr>
					<td style="height: 6px">
			<form method="post" action="/blog/servlet/StoreArticle">		
      <table class="tableForm" width="100%" border="0" cellpadding="0" cellspacing="8">
        <tr>
          <td class="style2" width="80">日志标题：</td>
          <td class="style3">
			<input type="text" name="articleTitle" size="100" value="" id="entrytitle" class="text" title="entrytitle" style="height: 22px">&nbsp;

          </td>
        </tr>
        <tr>
          <td class="style2">标签：</td>
          <td class="style3">
			<input type="text" name="keywords" size="45" value="" id="keywords" class="text" style="height: 21px">&nbsp;
		  <span style="font-weight:bold; cursor:pointer; padding:0px 4px; border:1px solid #ccc;" title="什么是标签？" onclick="Element.toggle($('tagHelp'))">?</span>
		  标签间请用空格隔开
		  </td>
        </tr>
        <tr>
          <td class="style2">日志分类：</td>
          <td class="style3">
          <select name="categoryId" id="categoryId" class="select" style="height: 23px; width: 137px"><option value="0">默认分类</option>
         
              <option value="6371599">Computer science</option>
              
              <option value="6371601">MyDiary</option>
              
              <option value="6478924">社会性论文</option>
              
              <option value="6478931">计算机理论</option>
              
              <option value="6547311">PrettyEssay</option>
              
              <option value="6547328">收集</option>
              
              <option value="6838759">Java</option>
              
              <option value="6838784">JSP</option>
              
              <option value="7010566">Database</option>
              
              <option value="7021067">X3D</option></select> <span id="addGategoryBox" style="display:none;">
            <input name="newGategory" type="text" class="text" id="newGategory" size="20" maxlength="32" />
            <input type="button" name="Submit" value="新增" id="Submit" class="button" onclick="checkAddGategory()" />
            <a href="javascript:hideAddGategoryBox();">取消</a></span> <a href="javascript:showAddGategoryBox()" id="addGategoryBut">新增分类</a></td>
        </tr>
	
       	<!--<tr>
          <td valign="top" class="redfont" colspan="2"> 日志内容 </td>
		</tr>-->
		<tr>
			<td>
				<input type="hidden" value=<%=articleDate %> name="articleDate" >
			</td>
		</tr>
		<tr>
          <td class="style2" width="80">日志：</td>
          <td class="style3">&nbsp;

          </td>
        	</tr>
		<tr>
          <td colspan="2">		
				<textarea name="articleContent" cols="120" rows="20" align="center"></textarea></td>
        </tr>
	
        	
	
      </table>
    				</td>
				</tr>
				<tr>
					<td height="6" style="height: 1px"></td>
				</tr>
				<tr>
					<td height="6" style="height: 1px">

<div id="artItem-button" style="text-align:center;">
  <input type="submit" name="save" id="save" value="发布日志" class="submit">
  &nbsp;
  <input type="button" name="draft" id="draft" value="暂存为草稿" class="button" onclick="Editor.setContent();saveDraft();" />
  &nbsp;
  <input type="button" name="view" id="view" value="预览页面" class="button" onclick="Editor.preview();" />
</div>

					</td>
				</tr>
			</form>
				<tr>
					<td height="6" style="height: 1px"></td>
				</tr>
				<tr>
					<td height="6" style="height: 1px"></td>
				</tr>
				<tr>
					<td height="6" style="height: 1px"></td>
				</tr>
				<tr>
					<td height="6" style="height: 1px"></td>
				</tr>
				<tr>
					<td height="6" style="height: 1px"></td>
				</tr>
				<tr>
					<td height="6" style="height: 1px"></td>
				</tr>
				<tr>
					<td height="6" style="height: 1px"></td>
				</tr>
			</table>
		</center>
	</body>
</html>

