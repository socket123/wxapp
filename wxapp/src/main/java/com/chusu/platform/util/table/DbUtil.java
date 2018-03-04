package com.chusu.platform.util.table;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

public class DbUtil {
    private static String user = null;

    private static String password = null;

    private static String driver = null;

    private static String url = null;

    private static Connection conn = null;

    private static Properties p = null;

    //单利模式 --懒汉式(双重锁定)保证线程的安全性
    public static DbUtil db = null;

    private DbUtil() {

    }

    public static DbUtil getInstance() {
        if (db == null) {
            synchronized (DbUtil.class) {
                if (db == null) {
                    db = new DbUtil();
                }
            }
        }
        return db;
    }

    //读取配置文件且加载数据库驱动
    static {
        //实例化一个properties对象用来解析我们的配置文件
        p = new Properties();
        //通过类加载器来读取我们的配置文件，以字节流的形式读取
        InputStream in = DbUtil.class.getClassLoader().getResourceAsStream(
                "/config/jdbc.properties");
        try {
            //将配置文件自如到Propreties对象，来进行解析
            p.load(in);
            //读取配置文件
            driver = p.getProperty("jdbc_driverClassName");
            url = p.getProperty("jdbc_url");
            user = p.getProperty("jdbc_username");
            password = p.getProperty("jdbc_password");
            //加载驱动
            Class.forName(driver);
        } catch (IOException e1) {
            e1.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }

    //建立数据库的连接
    public Connection getConn() {
        try {
            return DriverManager.getConnection(url, user, password);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    //查询返回List容器
    public List<Map<String, Object>> query(String sql) {
        return query(sql, new Object());
    }

    //查询返回List容器
    public List<Map<String, Object>> query(String sql, Object... params) {
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            //获得连接
            conn = getConn();
            //获得preparedSttement对象进行预编译（？占位符）
            pst = conn.prepareStatement(sql);
            int paramsIndex = 1;
            for (Object p : params) {
                pst.setObject(paramsIndex++, p);
            }
            //执行sql语句获得结果集的对象
            rs = pst.executeQuery();
            //获得结果集中列的信息
            ResultSetMetaData rst = rs.getMetaData();
            //获得结果集的列的数量
            int column = rst.getColumnCount();
            //创建List容器
            List<Map<String, Object>> rstList = new ArrayList<Map<String, Object>>();
            //处理结果
            while (rs.next()) {
                //创建Map容器存取每一列对应的值
                Map<String, Object> m = new HashMap<String, Object>();
                for (int i = 1; i <= column; i++) {
                    m.put(rst.getColumnName(i), rs.getObject(i));
                }
                //将Map容器放入List容器中
                rstList.add(m);
            }
            return rstList;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            //关闭资源
            close(rs, pst, conn);
        }
    }

    public List<Map<String, Object>> query(String sql, List<Object> params) {
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            //获得连接
            conn = getConn();
            //获得preparedSttement对象进行预编译（？占位符）
            pst = conn.prepareStatement(sql);
            int paramsIndex = 1;
            for (Object p : params) {
                pst.setObject(paramsIndex++, p);
            }
            //执行sql语句获得结果集的对象
            rs = pst.executeQuery();
            //获得结果集中列的信息
            ResultSetMetaData rst = rs.getMetaData();
            //获得结果集的列的数量
            int column = rst.getColumnCount();
            //创建List容器
            List<Map<String, Object>> rstList = new ArrayList<Map<String, Object>>();
            //处理结果
            while (rs.next()) {
                //创建Map容器存取每一列对应的值
                Map<String, Object> m = new HashMap<String, Object>();
                for (int i = 1; i <= column; i++) {
                    m.put(rst.getColumnName(i), rs.getObject(i));
                }
                //将Map容器放入List容器中
                rstList.add(m);
            }
            return rstList;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            //关闭资源
            close(rs, pst, conn);
        }
    }

    //分页查询总共有多少条记录totleSize
    public long queryLong(String sql, Object... params) {
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            //获得连接
            conn = getConn();
            //获得preparedSttement对象进行预编译（？占位符）
            pst = conn.prepareStatement(sql);
            int paramsIndex = 1;
            for (Object p : params) {
                pst.setObject(paramsIndex++, p);
            }
            //执行sql语句获得结果集的对象
            rs = pst.executeQuery();
            while (rs.next()) {
                return Long.valueOf(rs.getLong(1));
            }
            return 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    //插入
    public boolean insert(String sql, Object... params) {
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            //获得连接
            conn = getConn();
            //获得PrepareStatement对象进行预编译
            pst = conn.prepareStatement(sql);
            //处理将数据插入占位符
            int paramsIndex = 1;
            for (Object p : params) {
                pst.setObject(paramsIndex++, p);
            }
            //执行sql语句
            pst.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            //关闭资源
            close(null, pst, conn);
        }
    }

    //修改
    public boolean update(String sql, Object... params) {
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            //获得连接
            conn = getConn();
            //获得PrepareStatement对象进行预编译
            pst = conn.prepareStatement(sql);
            //处理将数据插入占位符
            int paramsIndex = 1;
            for (Object p : params) {
                pst.setObject(paramsIndex++, p);
            }
            //执行sql语句
            pst.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            //关闭资源
            close(null, pst, conn);
        }
    }

    //删除
    public boolean delete(String sql, Object... params) {
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            //获得连接
            conn = getConn();
            //获得PrepareStatement对象进行预编译
            pst = conn.prepareStatement(sql);
            //处理将数据插入占位符
            int paramsIndex = 1;
            for (Object p : params) {
                pst.setObject(paramsIndex++, p);
            }
            //执行sql语句
            pst.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            //关闭资源
            close(null, pst, conn);
        }
    }

    //关闭资源
    public static void close(ResultSet rs, PreparedStatement pst, Connection conn) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            rs = null;
        }
        if (pst != null) {
            try {
                pst.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            pst = null;
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            conn = null;
        }
    }
}
