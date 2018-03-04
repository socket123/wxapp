package com.chusu.apps.controller.jy;

import com.alibaba.fastjson.JSONObject;
import com.chusu.apps.config.Constants;
import com.chusu.apps.controller.BaseAction;
import com.chusu.apps.model.TableList;
import com.chusu.apps.model.business.User;
import com.chusu.apps.model.business.WxProduct;
import com.chusu.apps.model.jy.JyBaoming;
import com.chusu.apps.model.jy.JyKecheng;
import com.chusu.apps.model.jy.JyTeacher;
import com.chusu.apps.model.jy.JyUser;
import com.chusu.apps.model.sys.SysAdmin;
import com.chusu.apps.service.business.WxProductService;
import com.chusu.apps.service.jy.*;
import com.chusu.platform.util.CommonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import static com.chusu.platform.util.Upload.Uploadiamge;

@Controller
@RequestMapping("/web/jy")
public class jyWebController extends BaseAction{

    // 报名
    @Autowired
    JyBaomingService jyBaomingService;

    // 分类
    @Autowired
    JyFenlieService jyFenlieService;

    // 课程
    @Autowired
    JyKechengService jyKechengService;

    // 老师
    @Autowired
    JyTeacherService jyTeacherService;
    // 用户
    @Autowired
    JyUserService jyUserService;

    /**
     *获取课程信息
     * @param jyKecheng
     * @return
     */
    @RequestMapping(value = "/keChengList")
    @ResponseBody
    public List<JyKecheng> selectjsonlist(JyKecheng jyKecheng) {
        List<JyKecheng> jyKechengList = jyKechengService.selectListByWhere(jyKecheng);
        List<JyKecheng> jyKechengListKes = new ArrayList<JyKecheng>();
        for (JyKecheng jyKecheng1:jyKechengList){
            JyBaoming jyBaoming = new JyBaoming();
            jyBaoming.setKechengId(jyKecheng1.getId());
            jyKecheng1.setJyBaomingInts(jyBaomingService.selectListByWhere(jyBaoming).size());
            jyKechengListKes.add(jyKecheng1);
        }
        return  jyKechengListKes;
    }


    /**
     *获取单个课程信息
     * @param jyKecheng
     * @return
     */
    @RequestMapping(value = "/keChengGet")
    @ResponseBody
    public List<JyKecheng> selectjsonGet(JyKecheng jyKecheng) {
        List<JyKecheng> jyKechengList = jyKechengService.selectListByWhere(jyKecheng);
        List<JyKecheng> jyKecheng2 = new ArrayList<JyKecheng>();
        if(null != jyKechengList && jyKechengList.size() > 0){
            for(JyKecheng jyKecheng1:jyKechengList){
                if(null !=jyKecheng1.getOpenId()){
                    JyTeacher jyTeacher =  jyTeacherService.selectByPrimaryKey(Integer.parseInt(jyKecheng1.getOpenId()));
                    jyKecheng1.setJyTeacher(jyTeacher);
                }
                JyBaoming jyBaoming = new JyBaoming();
                jyBaoming.setKechengId(jyKecheng1.getId());
                jyKecheng1.setJyBaomingInts(jyBaomingService.selectListByWhere(jyBaoming).size());
                jyKecheng2.add(jyKecheng1);
            }
        }
        return  jyKecheng2;
    }
    /**
     *获取课程报名信息
     * @param jyKecheng
     * @return
     */
    @RequestMapping(value = "/keChengUserList")
    @ResponseBody
    public List<JyKecheng> keChengUserList(JyKecheng jyKecheng) {
        List<JyKecheng> jyKechengList = jyKechengService.selectListByWhere(jyKecheng);
        List<JyKecheng> jyKechengListKes = new ArrayList<JyKecheng>();
        for (JyKecheng jyKecheng1:jyKechengList){
            JyBaoming jyBaoming = new JyBaoming();
            jyBaoming.setKechengId(jyKecheng1.getId());
            jyKecheng1.setJyBaomingInts(jyBaomingService.selectListByWhere(jyBaoming).size());
            jyKechengListKes.add(jyKecheng1);
        }
        return  jyKechengListKes;
    }
    /**
     *获取单个课程信息 报名
     * @param jyBaoming
     * @return
     */
    @RequestMapping(value = "/keChengSet")
    @ResponseBody
    public  int  keChengSet(JyBaoming jyBaoming) throws UnsupportedEncodingException {
        JyBaoming jyBaoming1 = new JyBaoming();
        String strUTF8 = "";
        byte source [] = jyBaoming.getName().getBytes("iso8859-1");
        strUTF8 = new String (source,"UTF-8");
        jyBaoming.setName(strUTF8);
        JyUser jyUser = new JyUser();
        jyUser.setName(jyBaoming.getName());
        jyUser.setPhone(jyBaoming.getPhone());
        jyUser.setId(jyBaoming.getUserId());
        jyUserService.updateSelective(jyUser);
        jyBaoming1.setUserId(jyBaoming.getUserId());
        jyBaoming1.setKechengId(jyBaoming.getKechengId());
        JyBaoming jyBaoming2 =  jyBaomingService.selectOne(jyBaoming1);
            if(null != jyBaoming2){
                int i = 0;
                return  i;
            }
           int i =  jyBaomingService.save(jyBaoming);
          return  i;
    }

    /**
     * 从 openId zhong chazhao
     * @return
     */
    @RequestMapping(value = "/setOpenId")
    @ResponseBody
    public  JyUser  keChengSet(JyUser jyuser) throws UnsupportedEncodingException {
        JyBaoming jyBaoming1 = new JyBaoming();
        JyUser jyuser1 = new JyUser();
        jyuser1.setOpenId(jyuser.getOpenId());
        JyUser jyuser2 = jyUserService.selectOne(jyuser1);
        if(null == jyuser2 ){
            int i =  jyUserService.save(jyuser);
            return  jyuser;
        }else{

            return  jyuser2;
        }
//        String strUTF8 = "";
//        byte source [] = jyBaoming.getName().getBytes("iso8859-1");
//        strUTF8 = new String (source,"UTF-8");



    }

    /**
     *
     * @param jyKecheng
     * @return
     */
    @RequestMapping(value = "/keChengUserListPersion")
    @ResponseBody
    public List<JyBaoming> keChengUserListPersion(JyKecheng jyKecheng) {
        JyBaoming jyBaoming = new JyBaoming();
        jyBaoming.setKechengId(jyKecheng.getId());
        List<JyBaoming> jyKechengList = jyBaomingService.selectListByWhere(jyBaoming);
        return  jyKechengList;
    }


    /**
     * Description: <br>
     *
     *
     * @param model
     * @return <br>
     */
    @RequestMapping("/jyKechengPages")
    public String selectList(ModelMap model) {
        JyKecheng jyKecheng = new JyKecheng ();
        List<JyKecheng> jyKechengsLsit = new ArrayList<JyKecheng>();
       List<JyKecheng> jyKechengs =  jyKechengService.selectListByWhere(jyKecheng);
       for (JyKecheng jyKecheng1: jyKechengs){
           JyBaoming jyBaoming = new JyBaoming();
           jyBaoming.setKechengId(jyKecheng1.getId());
          List<JyBaoming> jyBaomings =  jyBaomingService.selectListByWhere(jyBaoming);
           jyKecheng1.setOpenId(jyBaomings.size()+"");
           jyKecheng1.setJyBaoming(jyBaomings);
           jyKechengsLsit.add(jyKecheng1);
       }
        model.put("jyKecheng",jyKechengsLsit);
        return "mobles/indexs";
    }
    /**
     * Description: <br>
     *
     *获取每个人的报名信息
     * @param model
     * @return <br>
     */
    @RequestMapping("/getUserBaoming")
    @ResponseBody
    public List<JyKecheng>  getUserBaoming(JyBaoming jyBaoming) {
        List<JyKecheng> jyKechengsLsit = new ArrayList<JyKecheng>();
        List<JyBaoming> jyKechengList = jyBaomingService.selectListByWhere(jyBaoming);
        for (JyBaoming jyBaomings :  jyKechengList){
            JyKecheng jyKecheng = jyKechengService.selectByPrimaryKey(jyBaomings.getKechengId());
            jyKechengsLsit.add(jyKecheng);
        }
        return  jyKechengsLsit;
    }
    /**
     *
     * @param jyKecheng
     * @return
     */
    @RequestMapping(value = "/deletuser")
    @ResponseBody
    public int  deletuser(JyBaoming jyBaoming) {
//        JyBaoming jyBaoming = new JyBaoming();
//        jyBaoming.setKechengId(jyKecheng.getId());
        int i = jyBaomingService.deleteByWhere(jyBaoming);
        return  i;
    }

    /**
     * 获取 opendid
     * @param jyKecheng
     * @return
     */
    @RequestMapping(value = "/getOpenIds")
    @ResponseBody
    public JyUser  getOpenIds(JyUser jyUser,String code) throws UnsupportedEncodingException {
        String appId = "wx507c144c8268e268";
        String secret = "cb41328273ec5525ef2a8011eebc32e1";
        String codes = code ;
        JyUser jyUser1 = new JyUser();
        String strUTF8 = "";
        byte source [] = jyUser.getNicName().getBytes("iso8859-1");
        strUTF8 = new String (source,"UTF-8");
        jyUser.setNicName(strUTF8);
        String users = "https://api.weixin.qq.com/sns/jscode2session?appid="+appId+"&secret="+secret+"&grant_type=authorization_code&js_code="+codes+"";
        JSONObject jsonObjectURLD = CommonUtil.httpsRequest(users, "GET", null);
        if(null != jsonObjectURLD){
            jyUser1.setOpenId(jsonObjectURLD.getString("openid"));
        }
       JyUser jyUser2 =  jyUserService.selectOne(jyUser1);
        if(null != jyUser2){
            return  jyUser2;
        }else{
            jyUser.setOpenId(jyUser1.getOpenId());
            jyUserService.save(jyUser);
            return  jyUser;
        }

    }


}
