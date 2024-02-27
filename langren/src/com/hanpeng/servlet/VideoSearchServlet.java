package com.hanpeng.servlet;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baidu.speech.restapi.common.DemoException;
import com.database.DBManage;
//import com.sun.xml.internal.bind.v2.runtime.Location;
import com.hanpeng.servlet.speechclassify;

/**
 * Servlet implementation class VedioSearchServlet
 */
@WebServlet("/VedioSearchServlet")
public class VideoSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VideoSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String userName = "nihao";
		String testFileName =  "D://A狼人杀//语音//录音文件内容//"+userName+".wav";
		AsrMain demo = new AsrMain();
		//System.out.println("这是servlet1");
	        // 填写下面信息
		String result;
	       String res="";
	       
			try {
				result = demo.run(testFileName);
				res = ((result.split("\\[")[1]).split("\\]")[0]).split("\"")[1];
				String num=request.getParameter("num");
				System.out.println("num:"+num);
				String lunci=request.getParameter("lunci");
				System.out.println("lunci:"+lunci);
				 System.out.println("识别结束：结果是：");
				 System.out.println(res);
				 //文本处理
				 speechclassify sc=new speechclassify();
				 String number=num,speechs=res;
					String[] resultSpeech;
					String identity=request.getParameter("identity");
					System.out.println("跳的身份："+identity);
					resultSpeech=sc.classify(speechs,identity);
					//System.out.println("文本处理结果"+resultSpeech);
					//String[] result1=resultSpeech.split("#");
					
					//resultSpeech=resultSpeech.replace("\'", "\"");
					System.out.println("预测身份："+resultSpeech[1]);
				
					
					
				 //存数据库
				
				 String s = "select * from yuyin where  number='"+num+"'";
				 javax.sql.rowset.WebRowSet r = com.database.DBManage.query(s);
				 String identity_result = "";
					while(r.next()){
						identity_result=r.getString("result");
						System.out.println("identity_result："+identity_result);
						if(!identity_result.equals("狼人")&&!lunci.equals("第1轮")){
							resultSpeech[1]=identity_result;
									
						}
					}
					
					
					 String sql="insert into yuyin values('"+lunci+"','"+num+"','"+resultSpeech[0]+"','"+identity+"','"+resultSpeech[1]+"')";
					 int ret=DBManage.executeSql(sql);
				 /*
				 
				 //分词
				 String fenci = (resultSpeech.split("\\(")[1]).split("\\}")[0];
					System.out.println(fenci);
					String str[] = fenci.split(", ");
					for(int i=0;i<str.length;i++) {
						str[i] = str[i].split("\"")[1];
						System.out.println(str[i]);
					}
					String sql1="select*from `rule1` where rule='"+str[1]+"'";
					//查找
					javax.sql.rowset.WebRowSet rs=DBManage.query(sql1);
					String shenfen="";
					String rule="";
					while (rs.next()) {			
						rule=rs.getString("rule");
						shenfen=rs.getString("result");
						System.out.print(rule);
						System.out.print(shenfen);
					}
					*/
			        this.getServletContext().setAttribute("fayan"+num,resultSpeech[0]);
			        this.getServletContext().setAttribute("shenfen"+num,resultSpeech[1]);
			        this.getServletContext().setAttribute("lunci",lunci);
			        this.getServletContext().setAttribute("tiao_ide"+num,identity);
			        
			        response.sendRedirect("video.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (DemoException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			/*catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} */ catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

				
					
					
     
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
