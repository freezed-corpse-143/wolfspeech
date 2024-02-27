<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/inform.css">
</head>
<%
request.setCharacterEncoding("utf-8");
String key = request.getParameter("round");
String sql = "select * from information";
String s = "select * from yuyin";
if(key!=null && key.length()>0){
	sql += " where round like '%"+key+"%'";
}else{
	sql += " where round like '第1轮'";
}
if(key!=null && key.length()>0){
	s += " where lunci like '%"+key+"%'";
}else{
	s += " where round like '第1轮'";
}
javax.sql.rowset.WebRowSet rs = com.database.DBManage.query(sql);
javax.sql.rowset.WebRowSet r = com.database.DBManage.query(s);
%>
<body>
<ul>
  <li><a href="frame.html">主页</a></li>
  <li><a href="analysis.jsp">分析结果展示</a></li>
</ul>
<h3>各轮次信息查看</h3>
<hr>
<br>
<form method="post">
	<input type="submit" value="第1轮" name="round" class="sub"/>
	<input type="submit" value="第2轮" name="round" class="sub"/>
	<input type="submit" value="第3轮" name="round" class="sub"/>
	<input type="submit" value="第4轮" name="round" class="sub"/>
	<input type="submit" value="第5轮" name="round" class="sub"/>
</form>
<hr>
<div class="information">
	<div class="left-box">
		<table border="1">
	<%
		while(rs.next()){
			String number = rs.getString("number");
			String identity = rs.getString("identity");
			String peer = rs.getString("peer");
			String bekilled = rs.getString("bekilled");
			String bechecked1 = rs.getString("bechecked1");
			String nature1 = rs.getString("nature1");
			String bechecked2 = rs.getString("bechecked2");
			String nature2 = rs.getString("nature2");
			String beshooted = rs.getString("beshooted");
			String dead1 = rs.getString("dead1");
			String dead2 = rs.getString("dead2");
			String vote1 = rs.getString("vote1");
			String vote2 = rs.getString("vote2");
			String vote3 = rs.getString("vote3");
			String vote4 = rs.getString("vote4");
			String vote5 = rs.getString("vote5");
			String vote6 = rs.getString("vote6");
		%>
		
	       <tr>
	         <td colspan="3">用户编号</td>
	         <td colspan="2"><%=number%></td>
	       </tr>
	       <tr>
	         <td colspan="3">用户身份</td>
	         <td colspan="2"><%=identity%></td>
	       </tr>
	       <tr>
	         <td colspan="3">若身份为狼人，则同伴编号为</td>
	         <td colspan="2"><%=peer%></td>
	       </tr>
	       <tr>
	         <td colspan="3">狼人刀的玩家</td>
	         <td colspan="2"><%=bekilled%></td>
	       </tr>
	       <tr>
	         <td colspan="3">预言家1验的玩家</td>
	         <td colspan="2"><%=bechecked1%></td>
	       </tr>
	       <tr>
	         <td colspan="3">预言家1验的玩家善恶</td>
	         <td colspan="2"><%=nature1%></td>
	       </tr>
	       <tr>
	         <td colspan="3">预言家2验的玩家</td>
	         <td colspan="2"><%=bechecked2%></td>
	       </tr>
	       <tr>
	         <td colspan="3">预言家2验的玩家善恶</td>
	         <td colspan="2"><%=nature2%></td>
	       </tr>
	       <tr>
	         <td colspan="3">猎人开枪编号</td>
	         <td colspan="2"><%=beshooted%></td>
	       </tr>
	       <tr>
	         <td colspan="3">死亡玩家编号</td>
	         <td colspan="2"><%=dead1%></td>
	       </tr>
	       <tr>
	         <td colspan="3"> </td>
	         <td colspan="2"><%=dead2%></td>
	       </tr>
	       <tr>
	         <td colspan="3">投票情况：</td>
	       </tr>
	       <tr>
	         <td colspan="3">1号玩家投</td>
	         <td colspan="2"><%=vote1%></td>
	       </tr>
	       <tr>
	         <td colspan="3">1号玩家投</td>
	         <td colspan="2"><%=vote2%></td>
	       </tr>
	       <tr>
	         <td colspan="3">3号玩家投</td>
	         <td colspan="2"><%=vote3%> </td>
	       </tr>
	       <tr>
	         <td colspan="3">4号玩家投</td>
	         <td colspan="2"><%=vote4%></td>
	       </tr>
	       <tr>
	         <td colspan="3">5号玩家投</td>
	         <td colspan="2"><%=vote5%></td>
	       </tr>
	       <tr>
	         <td colspan="3">6号玩家投</td>
	         <td colspan="2"><%=vote6%></td>
	       </tr>
		<%
		}
		rs.close();
		%>
		
		</table>
	</div>
		<div class="right-box">
	       <div class="show">
	<%
		while(r.next()){
			String wanjia = r.getString("wanjia");
			String content = r.getString("content");
		%>
			<div class="output-box">
		       <table>
		       	<tr>
		       		<td>
		       			<%=wanjia	 %>号玩家:
		       		</td>
		       		<td>
		       			<%=content %>
		       		</td>
		       	</tr>
		       </table>
		    </div>
	<% } %>
	       </div>
	</div>
</div>
</body>
</html>