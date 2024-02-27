<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Insert title here</title>
<style>
h2 {text-align:center;}

</style>
</head>
<body>
<div class="input-box">
  <div class="lib_Contentbox_sx ">  
       <h2>信息录入</h2>
       <div class="information-input" id="information">
     <form action="InformServlet" method="post">
             <table>
           <tr>
             <td colspan="2">轮次</td>
             <td>
               <select id="round" name="round">
                 <option selected="selected" value="0">-请选择-</option>
                 <option value="第1轮">第1轮</option>
                 <option value="第2轮">第2轮</option>
                 <option value="第3轮">第3轮</option>
                 <option value="第4轮">第4轮</option>
                 <option value="第5轮">第5轮</option>
               </select>
             </td>
           </tr>
           <tr>
             <td colspan="2">用户编号</td>
             <td>
               <select id="number" name="number">
                 <option selected="selected" value="0">-请选择-</option>
                 <option value="1号">1号</option>
                 <option value="2号">2号</option>
                 <option value="3号">3号</option>
                 <option value="4号">4号</option>
                 <option value="5号">5号</option>
                 <option value="6号">6号</option>
               </select>
             </td>
           </tr>
           <tr>
             <td colspan="2">用户身份</td>
             <td>
               <select id="identity" name="identity">
                 <option selected="selected" value="0">-请选择-</option>
                 <option value="狼人">狼人</option>
                 <option value="预言家">预言家</option>
                 <option value="猎人">猎人</option>
                 <option value="平民">平民</option>
               </select>
             </td>
           </tr>
           <tr>
             <td colspan="3">若身份为狼人，则同伴编号为</td>
             <td>
               <select id="peer" name="peer">
                 <option selected="selected" value="0">-请选择-</option>
                 <option value="1号">1号</option>
                 <option value="2号">2号</option>
                 <option value="3号">3号</option>
                 <option value="4号">4号</option>
                 <option value="5号">5号</option>
                 <option value="6号">6号</option>
               </select>
             </td>
           </tr>
           <tr>
             <td colspan="2">狼人刀的玩家</td>
             <td>
               <select id="bekilled" name="bekilled">
                 <option selected="selected" value="0">-请选择-</option>
                 <option value="未知">未知</option>
                 <option value="1号">1号</option>
                 <option value="2号">2号</option>
                 <option value="3号">3号</option>
                 <option value="4号">4号</option>
                 <option value="5号">5号</option>
                 <option value="6号">6号</option>
               </select>
             </td>
           </tr>
           <tr>
             <td colspan="2">预言家1验的玩家及善恶</td>
             <td>
               <select id="bechecked1" name="bechecked1">
                 <option selected="selected" value="0">-请选择-</option>
                 <option value="未知">未知</option>
                 <option value="1号">1号</option>
                 <option value="2号">2号</option>
                 <option value="3号">3号</option>
                 <option value="4号">4号</option>
                 <option value="5号">5号</option>
                 <option value="6号">6号</option>
               </select>
             </td>
             <td>
               <select id="nature1" name="nature1">
                 <option selected="selected" value="0">-请选择-</option>
                 <option value="好人">好人</option>
                 <option value="狼人">狼人</option>
               </select>
             </td>
           </tr>
           <tr>
             <td colspan="2">预言家2验的玩家及善恶</td>
             <td>
               <select id="bechecked2" name="bechecked2">
                 <option selected="selected" value="0">-请选择-</option>
                 <option value="未知">未知</option>
                 <option value="1号">1号</option>
                 <option value="2号">2号</option>
                 <option value="3号">3号</option>
                 <option value="4号">4号</option>
                 <option value="5号">5号</option>
                 <option value="6号">6号</option>
               </select>
             </td>
             <td>
               <select id="nature2" name="nature2">
                 <option selected="selected" value="0">-请选择-</option>
                 <option value="好人">好人</option>
                 <option value="狼人">狼人</option>
               </select>
             </td>
           </tr>
           <tr>
             <td colspan="2">猎人开枪编号</td>
             <td>
               <select id="beshooted" name="beshooted">
                 <option selected="selected" value="0">-请选择-</option>
                 <option value="未开枪">未开枪</option>
                 <option value="1号">1号</option>
                 <option value="2号">2号</option>
                 <option value="3号">3号</option>
                 <option value="4号">4号</option>
                 <option value="5号">5号</option>
                 <option value="6号">6号</option>
               </select>
             </td>
           </tr>
           <tr>
             <td colspan="2">死亡玩家编号</td>
             <td>
               <select id="dead1" name="dead1">
                 <option selected="selected" value="0">-请选择-</option>
                 <option value="平安夜">平安夜</option>
                 <option value="1号">1号</option>
                 <option value="2号">2号</option>
                 <option value="3号">3号</option>
                 <option value="4号">4号</option>
                 <option value="5号">5号</option>
                 <option value="6号">6号</option>
               </select>
             </td>
           </tr>
            <tr>
             <td colspan="2">死亡玩家身份：</td>
             <td>
               <select id="dead1_shenfen" name="dead1_shenfen">
                 <option selected="selected" value="0">-请选择-</option>
                 <option value="狼人">狼人</option>
                 <option value="预言家">预言家</option>
                 <option value="猎人">猎人</option>
                 <option value="平民">平民</option>
               </select>
             </td>
             
           </tr>
           
           <tr>
            <tr>
             <td>
               <input type="submit" value="提交"/>
             </td>
           </tr>
           </table>
</form>
           
           
           
          
 <form action="Inform2Servlet" method="post">
            <table>
           <tr>
             <td colspan="2">投票情况：
             </td>
           </tr>
            <tr>
             <td colspan="2">轮次</td>
             <td>
               <select id="round" name="round">
                 <option selected="selected" value="0">-请选择-</option>
                 <option value="第1轮">第1轮</option>
                 <option value="第2轮">第2轮</option>
                 <option value="第3轮">第3轮</option>
                 <option value="第4轮">第4轮</option>
                 <option value="第5轮">第5轮</option>
               </select>
             </td>
           </tr>
           <tr>
             <td>1号玩家投</td>
             <td>
               <select id="vote1" name="vote1">
                 <option selected="selected" value="0">-请选择-</option>
                 <option value="1号">1号</option>
                 <option value="2号">2号</option>
                 <option value="3号">3号</option>
                 <option value="4号">4号</option>
                 <option value="5号">5号</option>
                 <option value="6号">6号</option>
               </select>
             </td>
             <td>2号玩家投</td>
             <td>
               <select id="vote2" name="vote2">
                 <option selected="selected" value="0">-请选择-</option>
                 <option value="1号">1号</option>
                 <option value="2号">2号</option>
                 <option value="3号">3号</option>
                 <option value="4号">4号</option>
                 <option value="5号">5号</option>
                 <option value="6号">6号</option>
               </select>
             </td>
           </tr>
           <tr>
             <td>3号玩家投</td>
             <td>
               <select id="vote3" name="vote3">
                 <option selected="selected" value="0">-请选择-</option>
                 <option value="1号">1号</option>
                 <option value="2号">2号</option>
                 <option value="3号">3号</option>
                 <option value="4号">4号</option>
                 <option value="5号">5号</option>
                 <option value="6号">6号</option>
               </select>
             </td>
             <td>4号玩家投</td>
             <td>
               <select id="vote4" name="vote4">
                 <option selected="selected" value="0">-请选择-</option>
                 <option value="1号">1号</option>
                 <option value="2号">2号</option>
                 <option value="3号">3号</option>
                 <option value="4号">4号</option>
                 <option value="5号">5号</option>
                 <option value="6号">6号</option>
               </select>
             </td>
           </tr>
           <tr>
             <td>5号玩家投</td>
             <td>
               <select id="vote5" name="vote5">
                 <option selected="selected" value="0">-请选择-</option>
                 <option value="1号">1号</option>
                 <option value="2号">2号</option>
                 <option value="3号">3号</option>
                 <option value="4号">4号</option>
                 <option value="5号">5号</option>
                 <option value="6号">6号</option>
               </select>
             </td>
             <td>6号玩家投</td>
             <td>
               <select id="vote6" name="vote6">
                 <option selected="selected" value="0">-请选择-</option>
                 <option value="1号">1号</option>
                 <option value="2号">2号</option>
                 <option value="3号">3号</option>
                 <option value="4号">4号</option>
                 <option value="5号">5号</option>
                 <option value="6号">6号</option>
               </select>
             </td>
           </tr>
         
           
            <tr>
             <td colspan="2">投票结果：</td>
           </tr>
           
           <tr>
             <td colspan="2">公投出局玩家编号：</td>
             <td>
               <select id="dead2" name="dead2">
                 <option selected="selected" value="0">-请选择-</option>
                 <option value="1号">1号</option>
                 <option value="2号">2号</option>
                 <option value="3号">3号</option>
                 <option value="4号">4号</option>
                 <option value="5号">5号</option>
                 <option value="6号">6号</option>
               </select>
             </td>
             </tr>
             <tr>
             <td colspan="2">公投出局玩家身份：</td>
             <td>
               <select id="dead2_shenfen" name="dead2_shenfen">
                 <option selected="selected" value="0">-请选择-</option>
                 <option value="狼人">狼人</option>
                 <option value="预言家">预言家</option>
                 <option value="猎人">猎人</option>
                 <option value="平民">平民</option>
               </select>
             </td>
             
           </tr>
           
           <tr>
             <td>
               <input type="submit" value="提交"/>
             </td>
           </tr>
            </table>
           </form>
           
        
       </div>
  </div>
</div>


</body>
</html>