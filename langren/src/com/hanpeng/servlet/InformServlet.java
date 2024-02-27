package com.hanpeng.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InformServlet
 */
@WebServlet("/InformServlet")
public class InformServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InformServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 保存数据到数据库
		request.setCharacterEncoding("utf-8");
		// 接收数据
		String round = request.getParameter("round");
		String number = request.getParameter("number");
		String identity = request.getParameter("identity");
		String peer = request.getParameter("peer");
		String bekilled = request.getParameter("bekilled");
		String bechecked1 = request.getParameter("bechecked1");
		String nature1 = request.getParameter("nature1");
		String bechecked2 = request.getParameter("bechecked2");
		String nature2 = request.getParameter("nature2");
		String beshooted = request.getParameter("beshooted");
		String dead1 = request.getParameter("dead1");
		String dead1_shenfen=request.getParameter("dead1_shenfen");

		//构造SQL insert...
		String sql = "insert into information values('"+round+"','"+number+"','"+identity+"','"+peer+"','"+bekilled+"','"+bechecked1+"','"+nature1+"','"+bechecked2+"','"+nature2+"','"+beshooted+"','"+dead1+"','"+dead1_shenfen+"' )";
		//执行SQL写入DB
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/wolfkill?useUnicode=true&characterEncoding=UTF-8", "root", "tanianta.");
			Statement stmt = conn.createStatement();
			System.out.println("sql:" + sql);
			
			int ret = stmt.executeUpdate(sql);
			System.out.println(ret);
	
			stmt.close();
			conn.close();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		//返回页面listsusers
		response.sendRedirect("left.jsp");
	}

}
