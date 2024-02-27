package com.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.rowset.WebRowSet;

import com.sun.rowset.WebRowSetImpl;

public class DBManage {
//��ȡjdbc����
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost/wolfkill", "root", "tanianta.");
			System.out.println("DBManage=>getConnection  con" + con);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
//ִ��SQL��䷵�����ݼ�
	//select------ResultSet
	public static WebRowSet query(String sql) {
		WebRowSet wrs = null;//RowSet������������ӹر�ʱ�������Ȼ���ڣ����������ӵĽ������
		Connection con = getConnection();//�������
		Statement stm;//����statement����
		try {
			wrs = new WebRowSetImpl();//
			stm = con.createStatement();//statement����ͨ�����ӻ�ȡ
			System.out.println("DBManage=>WebRowSet query:" + sql);
			ResultSet rs = stm.executeQuery(sql);//statement����ִ��SQL��䣬���ؽ����
			wrs.populate(rs);//rs�������ת����WebRowSet���������rs�������װ�ص�wrs����
			rs.close();
			stm.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return wrs;
	}
//ִ��SQL��䷵���
	//Insert,Update,Delete------int
	public static int executeSql(String sql) {
		int retVal = 0;
		try {
			Connection con = getConnection();
			Statement stm = con.createStatement();
			System.out.println("DBManage=>executeSql sql:" + sql);
			retVal = stm.executeUpdate(sql);
			stm.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("DBManage=>executeSql retVal:" + retVal);

		return retVal;

	}
}
