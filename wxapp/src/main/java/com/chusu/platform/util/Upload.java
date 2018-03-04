package com.chusu.platform.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

/**
 * Created by songk on 2018/1/31.
 */
public class Upload {
    public static String Uploadiamge(MultipartFile file){
        String filename="";
        String pic_path;
        String directory="";
        try
        {

            if (file == null) {
                throw new Exception("上传失败：文件为空");
            }
            if(file.getSize()>10000000)
            {
                throw new Exception("上传失败：文件大小不能超过10M");
            }
            //得到文件名
            filename=file.getOriginalFilename();

            if(file.getSize()>0){
                try {
                    String tomcat_path = System.getProperty( "user.dir" );
                    System.out.println(tomcat_path);
                    //获取Tomcat服务器所在路径的最后一个文件目录
                    String bin_path = tomcat_path.substring(tomcat_path.lastIndexOf("\\")+1,tomcat_path.length());
                    if(directory!=""&&directory!=null){
                        pic_path = tomcat_path.substring(0,System.getProperty( "user.dir" ).lastIndexOf("\\")) +"\\webapps"+"\\imagelist\\"+"\\"+directory+"\\";
                    }else {
                        pic_path = tomcat_path.substring(0,System.getProperty( "user.dir" ).lastIndexOf("\\")) +"\\webapps"+"\\imagelist\\";
                    }
                    File file1 = new File(pic_path);
                    if (file1.exists()) {
                        if (file1.isDirectory()) {
                            System.out.println("已存在");
                        } else {
                            System.out.println("已有同名的目录");
                        }
                    } else {
                        file1.mkdir();//创建一个目录
                    }
                    SaveFileFromInputStream(file.getInputStream(),pic_path,filename);
                } catch (IOException e) {
                    System.out.println(e.getMessage());
                }
            }
            else{
                throw new Exception("上传失败：上传文件不能为空");
            }
        }
        catch(Exception ex)
        {
            System.out.println(ex.getMessage());
        }
        return "images" + "/"+ filename;
    }

    /**保存文件
     * @param stream
     * @param path
     * @param filename
     * @throws IOException
     */
    public static void SaveFileFromInputStream(InputStream stream, String path, String filename) throws IOException
    {
        FileOutputStream fs=new FileOutputStream( path + "/"+ filename);
        byte[] buffer =new byte[1024*1024];
        int bytesum = 0;
        int byteread = 0;
        while ((byteread=stream.read(buffer))!=-1)
        {
            bytesum+=byteread;
            fs.write(buffer,0,byteread);
            fs.flush();
        }
        fs.close();
        stream.close();
    }
}
