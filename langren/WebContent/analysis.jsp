<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/analysis.css">
</head>
<body>
<ul>
  <li><a href="frame.html">主页</a></li>
  <li><a href="inform2.jsp">各轮次信息查看</a></li>
</ul>
<hr>

<h3>分析结果展示</h3>
<div class="analysis-bottom">
  <div class="predict-identity-right">
    <div class="predict-box" id="predict">
      <h3 class="service-item-title">身份预测(各玩家可能是各身份的概率）</h3>
      <div class="predict-output" id="predict_output"></div>
    </div>
  </div>
  <div class="predict-identity-right">
    <div class="analysis-box" id="analysis">
      <h3 class="service-item-title">统计分析</h3>
      <div class="analysis-output" id="analysis_output"></div>
    </div>
  </div> 
</div>
</body>
</html>