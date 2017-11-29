package com.utonw.utonerp.core.dao;

import com.alibaba.druid.pool.DruidDataSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


@Repository
@Transactional
public class DBControl {

	@Resource(name="dataSource")
	private  DruidDataSource dataSource;

	String innersql = "int";
	private int sum;
	Logger logger = LoggerFactory.getLogger(getClass());

	public Connection getConnection(){
		Connection conn = null;
		try{
			conn = dataSource.getConnection();
		}catch (Exception e){
			e.printStackTrace();
		}
		return conn;
	}

	public ResultSet getData(Connection conn, String sql){
		ResultSet rs = null;
		try {
			Statement stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	public int update(Connection conn,String sql){

		try {
			Statement stmt=conn.createStatement();
			sum=stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn,null);
		}
		return sum;
	}



	public void setData(Connection conn,String sql){

		try{
			Statement stmt=conn.createStatement();
			stmt.execute(sql);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(conn,null);
		}
	}



	public void close(Connection conn, ResultSet rs) {
		try {

			if(rs!=null && !rs.isClosed()){
				rs.close();
			}
			if(conn!=null && !conn.isClosed()){
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
		}
	}


}
