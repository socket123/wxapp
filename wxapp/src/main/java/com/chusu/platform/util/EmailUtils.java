package com.chusu.platform.util;

/**
 * Created by Administrator on 2015/12/8.
 */

import com.chusu.platform.util.email.EmailConst;
import com.chusu.platform.util.email.EmailHandle;

import java.util.List;
import java.util.concurrent.TimeUnit;

import org.apache.commons.lang.StringUtils;

/**
 * 邮件发送工具类
 * @author jiang.li
 * @date 2013-12-19 14:27
 */
public class EmailUtils {


    /**
     * 发送邮件
     * @param smtp        邮件协议
     * @param fromAddress 发送人地址
     * @param fromPass    发送人密码
     * @param toAddress   收件人地址
     * @param subject     发送主题
     * @param content     发送内容
     * @throws Exception
     */
    public static void send(String smtp,String fromAddress,String fromPass,String toAddress, String subject, String content){
        try{
            System.out.println("开始向" + toAddress + "发送邮件");
            EmailHandle emailHandle = new EmailHandle(smtp);
            emailHandle.setFrom(fromAddress);
            emailHandle.setNeedAuth(true);
            emailHandle.setSubject(subject);
            emailHandle.setBody(content);
            emailHandle.setTo(toAddress);
            emailHandle.setFrom(fromAddress);
            emailHandle.setNamePass(fromAddress, fromPass);
            emailHandle.sendEmail();
            System.out.println("邮件发送结束!");
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    /**
     * 发送邮件
     * @param smtp        邮件协议
     * @param fromAddress 发送人地址
     * @param fromPass    发送人密码
     * @param toAddress   收件人地址
     * @param ccAdress    抄送人地址
     * @param subject     发送主题
     * @param content     发送内容
     * @throws Exception
     */
    public static void send(String smtp,String fromAddress,String fromPass,String toAddress,String ccAdress, String subject, String content){
        try{
            System.out.println("开始向" + toAddress + "发送邮件");
            EmailHandle emailHandle = new EmailHandle(smtp);
            emailHandle.setFrom(fromAddress);
            emailHandle.setNeedAuth(true);
            emailHandle.setSubject(subject);
            emailHandle.setBody(content);
            emailHandle.setTo(toAddress);
            /**添加抄送**/
            if(StringUtils.isNotEmpty(ccAdress)){
                emailHandle.setCopyTo(ccAdress);
            }
            emailHandle.setFrom(fromAddress);
            emailHandle.setNamePass(fromAddress, fromPass);
            emailHandle.sendEmail();
            System.out.println("邮件发送结束!");
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    /**
     * 发送邮件
     * @param smtp        邮件协议
     * @param fromAddress 发送人地址
     * @param fromPass    发送人密码
     * @param toAddress   收件人地址
     * @param subject     发送主题
     * @param content     发送内容
     * @throws Exception
     */
    public static void send(String smtp,String fromAddress,String fromPass,String toAddress,String subject, String content,List<String> fileList){
        try{
            System.out.println("开始向" + toAddress + "发送邮件");
            EmailHandle emailHandle = new EmailHandle(smtp);
            emailHandle.setFrom(fromAddress);
            emailHandle.setNeedAuth(true);
            emailHandle.setSubject(subject);
            emailHandle.setBody(content);
            emailHandle.setTo(toAddress);
            emailHandle.setFrom(fromAddress);
            emailHandle.setNamePass(fromAddress, fromPass);
            /** 附件文件路径 **/
            for(String file : fileList){
                emailHandle.addFileAffix(file);
            }
            emailHandle.sendEmail();
            System.out.println("邮件发送结束!");
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    /**
     * 发送邮件
     * @param smtp        邮件协议
     * @param fromAddress 发送人地址
     * @param fromPass    发送人密码
     * @param toAddress   收件人地址
     * @param ccAdress    抄送人地址
     * @param subject     发送主题
     * @param content     发送内容
     * @throws Exception
     */
    public static void send(String smtp,String fromAddress,String fromPass,String toAddress,String ccAdress,String subject, String content,List<String> fileList){
        try{
            System.out.println("开始向" + toAddress + "发送邮件");
            EmailHandle emailHandle = new EmailHandle(smtp);
            emailHandle.setFrom(fromAddress);
            emailHandle.setNeedAuth(true);
            emailHandle.setSubject(subject);
            emailHandle.setBody(content);
            emailHandle.setTo(toAddress);
            /**添加抄送**/
            if(StringUtils.isNotEmpty(ccAdress)){
                emailHandle.setCopyTo(ccAdress);
            }
            emailHandle.setFrom(fromAddress);
            emailHandle.setNamePass(fromAddress, fromPass);
            /** 附件文件路径 **/
            for(String file : fileList){
                emailHandle.addFileAffix(file);
            }
            emailHandle.sendEmail();
            System.out.println("邮件发送结束!");
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
            send(EmailConst.SMTP_163, "supercodes@163.com", "gps131987310", "578540211@qq.com", "你有一条任务", "王总,任务来啦");
            try {
                TimeUnit.MICROSECONDS.sleep(500);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
    }
}