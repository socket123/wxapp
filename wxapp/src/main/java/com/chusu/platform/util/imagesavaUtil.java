package com.chusu.platform.util;
import com.chusu.platform.util.DBUtil;
import com.chusu.platform.util.image.ImageUtil;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.*;
import java.sql.*;

/**
 * Created by songk on 2017/11/27.
 */
public class imagesavaUtil {
    /**
     *
     */
        // 将图片插入数据库
        public static String readImage2DB(InputStream in,String name,Integer type,String table) {
            String code ="";
            Connection conn = null;
            PreparedStatement ps = null;
            try {
                conn = DBUtil.getConn();
                String sql = table;
                ps = conn.prepareStatement(sql);
                ps.setString(1, name);
                ps.setInt(2, type);
                ps.setBinaryStream(3, in, in.available());
                int count = ps.executeUpdate();
                if (count > 0) {
                    code= "200";
                } else {
                    code= "0";
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                DBUtil.closeConn(conn);
                if (null != ps) {
                    try {
                        ps.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
            return code;
        }

        // 读取数据库中图片
        public static String readDB2Image(String image, Integer id) {
            String targetPath = "C:/Users/songk/Desktop/配电房监控/power_monitor/trunk/power_monitor/src/main/webapp/statics/images/imageprue/"+image;
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            try {
                conn = DBUtil.getConn();
                String sql = "select * from backgroundtable where id =?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, id);
                rs = ps.executeQuery();
                while (rs.next()) {
                    InputStream in = rs.getBinaryStream("backdate");
                    ImageUtil.readBin2Image(in, targetPath);
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                DBUtil.closeConn(conn);
                if (rs != null) {
                    try {
                        rs.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if (ps != null) {
                    try {
                        ps.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }

            }
            return image;
        }
    private static final long serialVersionUID = 1L;
    public static InputStream query_getPhotoImageBlob(int id) throws ClassNotFoundException, SQLException{
        String sql = "select backdate from backgroundtable where id="+id;
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        InputStream result = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://114.55.115.138/mainsql?user=root&password=root");
            stmt = con.createStatement();
            rs = stmt.executeQuery(sql);
            if (rs.next())
                result = rs.getBlob("backdate").getBinaryStream();
        } catch (SQLException e) {
            // TODO: handle exception
            System.err.println(e.getMessage());
        }finally{
            rs.close();
            stmt.close();
            con.close();
        }
        return result;
    }

}
