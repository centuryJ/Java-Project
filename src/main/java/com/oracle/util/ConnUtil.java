package com.oracle.util;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;
import javax.sql.DataSource;
import org.apache.commons.dbcp.BasicDataSourceFactory;

public class ConnUtil {
	private static DataSource ds;// 容器对象。
	private static ThreadLocal<Connection> local = new ThreadLocal<Connection>();
	static {
		try {
			InputStream is = ConnUtil.class.getResourceAsStream("jdbc.properties");
			Properties properties = new Properties();
			properties.load(is);
			// 通过加载的资源文件创建数据源对象
			ConnUtil.ds = BasicDataSourceFactory.createDataSource(properties);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 获得一个数据库连接对象
	 * 
	 * @return 数据库连接对象
	 * @throws SQLException
	 */
	public static Connection getConn() throws SQLException {
		Connection conn = local.get();
		if (conn == null || conn.isClosed()) {
			conn = ds.getConnection();
			local.set(conn);
		}
		return conn;
	}

	/**
	 * 关闭数据库连接对象的方法
	 */
	public static void closeConn() {
		try {
			Connection conn = local.get();
			if (conn != null && !conn.isClosed()) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			local.set(null);
		}
	}
}

