<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/inform.css">
<style>
h3{text-align:center}
</style>
</head>
<%
request.setCharacterEncoding("utf-8");
String key = request.getParameter("round");
String s = "select * from yuyin";
if(key!=null && key.length()>0){
	s += " where lunci like '%"+key+"%'";
}else{
	s += " where lunci like '第1轮'";
}
javax.sql.rowset.WebRowSet r = com.database.DBManage.query(s);
%>
<body>
<ul>
  <li><a href="frame.html">信息录入</a></li>
  
</ul>
<h3>各轮次信息查看</h3>
<hr>
<br>
<div style="width:100%;text-align:center">
<form method="post" alien="center">
	<input type="submit" value="第1轮" name="round" class="sub"/>
	<input type="submit" value="第2轮" name="round" class="sub"/>
	<input type="submit" value="第3轮" name="round" class="sub"/>
	<input type="submit" value="第4轮" name="round" class="sub"/>
	<input type="submit" value="第5轮" name="round" class="sub"/>
</form>
</div>
<br>

	      
	        <table border="1" align="center">
	         <tr>
	          <td >轮次</td>
		       <td >玩家号数</td>
		       <td >发言内容</td>
		       <td>跳的身份</td>
		       <td>预测身份</td>
		       </tr>
	<%
		while(r.next()){
			String lunci=r.getString("lunci");
			String number = r.getString("number");
			String content = r.getString("content");
			String identity_tiao=r.getString("identity_tiao");
			String identity_yuce=r.getString("result");
		%>
			

		       	<tr> 
		       	<td>
		       			<%=lunci %>
		       		</td>
		       	<td>
		       			<%=number %>号玩家:
		       		</td>
		       		
		       		<td>
		       			<%=content %>
		       		</td>
		       		<td>
		       			<%=identity_tiao %>
		       		</td>
		       		<td>
		       			<%=identity_yuce %>
		       		</td>
		       		
		       	</tr>
		 
	<% } %>
	    </table>
	     
	

</body>
</html>