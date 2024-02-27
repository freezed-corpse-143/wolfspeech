<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主页</title>

<link rel="stylesheet" href="css/index.css">
<script src="js/jquery.min.js"></script>
<style>
td{text-align:center;}

</style>
  
	<script type="text/javascript" src="record.js"></script>
	<script>
		function changeTu(obj) {
			var a = $(obj).attr("class");
			console.log(a);
			$("." + a).hide();
			$(".0" + a).show();
			startRecording();
		}

		var recorder;
		var audio = document.querySelector('audio');

		function startRecording() {
			HZRecorder.get(function(rec) {
				recorder = rec;
				recorder.start();
			});
		}
		function stopRecording(obj) {
			var a = $(obj).attr("class");
			a = a.toString()
			var a1 = a[0];
			var a2 = a[1];
			recorder.stop();
			$("." + a).hide();
			$("." + a2).show();
			var lunci = document.getElementById("round").value;
			var identity = document.getElementById(a).value;
			
			

			recorder.upload("UploadVideoServlet.do", function(state, e) {
				switch (state) {
				case 'uploading':
					break;
				case 'ok':
					self.location.href = "VideoSearchServlet.do?num=" + a2
							+ "&lunci=" + lunci + "&identity=" + identity;
					break;
				case 'error':
					alert("上传失败");
					break;
				case 'cancel':
					alert("上传被取消");
					break;
				}
			});

		}
		553
		function playRecording() {
			recorder.play(audio);
		}
		function get_round(){
		    var str = document.getElementById("round");
		    var lunci = document.getElementById("round").value;
		    for(i=0;i<str.length;i++){
		        if(str[i].value==lunci)
		            str[i].selected = true;
		    }
		}

	
		
	</script>



</head>
<body >
  
	<div class="service-item service-item-taste">
		
		<div class="lunci" style="text-align:center;">
		
		<% 
		String key = request.getParameter("keyword");
%>

			轮次： <select id="round" name="round" >
				<option  
				<%if(application.getAttribute("lunci")==null){%>
										value="请选择"
									<%}else{%>
										value='<%= application.getAttribute("lunci")%>'
									<%} %>	  selected="selected">
				<%if(application.getAttribute("lunci")==null){%>
										请选择
									<%}else{%>
										<%= application.getAttribute("lunci")%>
									<%} %></option>
				<option  value="第1轮">第1轮</option>
				<option value="第2轮">第2轮</option>
				<option value="第3轮">第3轮</option>
				<option value="第4轮">第4轮</option>
				<option value="第5轮">第5轮</option>
			</select>
			
		</div>

		<div class="service-item-content service-item-taste-content">
			<div class="start-taste">
				<div class="start-taste-top">
					<%
						for (int i = 1; i <= 6; i++) {
					%>
					
					<div class="start-taste-button" style="width: calc(100% / 6)">
					<table>
						<tr>
							<td colspan="3" >
								<input type="submit" onclick="changeTu(this)" class="<%=i%>" value="<%=i%>号"  style="margin: 0 auto;height: 30px;width: 70px;font-size: 16px;letter-spacing: 6px;"/> 
								<input type="submit" onclick="stopRecording(this)" class="0<%=i%>" value="结束录音" style="margin: 0 auto;height: 35px;width: 100px;font-size: 16px;letter-spacing: 6px;display: none" />
							</td>
							</tr>
							
							<tr>
							<td> <br></td>
							</tr>
							<tr>
							<td width="20px"></td>
							
							<td>跳的身份:</td>
							
							<td>
								<select id="0<%=i%>" name="0<%=i%>" >
									<option  
									<%if(application.getAttribute("tiao_ide"+i)==null){%>
										value="请选择"
									<%}else{%>
										value='<%= application.getAttribute("tiao_ide"+i)%>'
									<%} %>									
									 selected="selected">
									 <%if(application.getAttribute("tiao_ide"+i)==null){%>
										请选择
									<%}else{%>
										<%= application.getAttribute("tiao_ide"+i)%>
									<%} %>	</option>
									<option value="村民">村民</option>
									<option value="猎人">猎人</option>
									<option value="预言家">预言家</option>
									<option value="狼人">狼人</option>
								</select>								
							</td>
							<td width="20px"></td>
								
							
							<!-- 
							<td>身份:</td>
							<td>								
								
								
							</td>
							 -->
							
						</tr>
					</table>
				<br>
					<%
					String picture;
						if (application.getAttribute("shenfen" + i) == null) {							
								picture="images/未知.jpg";
									} else {
										
								picture="images/"+application.getAttribute("shenfen" + i)+".jpg";
								
									}
								%>
						<div class="output-box" id="result_output<%=i%>" 
						style="height:320px;width:95%;border-radius: 12px;background-image:url(<%=picture%>);background-size:cover;color:white;" 
						>
							<%
								if (application.getAttribute("fayan" + i) == null) {
							%>
							   
							<%
								} else {
							%>
    
							<%=application.getAttribute("fayan" + i)%>
							<%
								}
							%>
						</div>
					</div>
					<%
						}
					%>
					
				
				</div>
			</div>
		</div>
	</div>


</body>
</html>