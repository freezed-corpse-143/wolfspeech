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
 * Servlet implementation class Inform2Servlet
 */
@WebServlet("/Inform2Servlet")
public class Inform2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Inform2Servlet() {
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
		String vote1 = request.getParameter("vote1");
		String vote2 = request.getParameter("vote2");
		String vote3 = request.getParameter("vote3");
		String vote4 = request.getParameter("vote4");
		String vote5 = request.getParameter("vote5");
		String vote6 = request.getParameter("vote6");
		String dead2 = request.getParameter("dead2");
		String dead2_shenfen = request.getParameter("dead2_shenfen");
		//构造SQL insert...
		String sql = "insert into vote_result values('"+round+"','"+vote1+"','"+vote2+"','"+vote3+"','"+vote4+"','"+vote5+"','"+vote6+"','"+dead2+"','"+dead2_shenfen+"')";
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