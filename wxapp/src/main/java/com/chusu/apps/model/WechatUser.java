package com.chusu.apps.model;

import javax.persistence.*;
import java.util.Date;

@Table(name = "wechat_user")
public class WechatUser {
    /**
     * 用户表id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 创建时间
     */
    @Column(name = "createDate")
    private Date createdate;

    /**
     * 是否删除
     */
    private Boolean deleted;

    /**
     * 版本id
     */
    private Integer version;

    /**
     * ??????????
     */
    private Double balance;

    /**
     * ???????????????
     */
    private Double commission;

    /**
     * 最后的登陆ip
     */
    @Column(name = "lastLoginIp")
    private String lastloginip;

    /**
     * 最后的登陆时间
     */
    @Column(name = "lastLoginTime")
    private Date lastlogintime;

    /**
     * 登录次数
     */
    @Column(name = "loginCount")
    private Integer logincount;

    /**
     * 用户名称
     */
    private String name;

    /**
     * 用户密码
     */
    private String password;

    /**
     * 用户手机
     */
    private String phone;

    /**
     * 注册ip
     */
    @Column(name = "registerIp")
    private String registerip;

    /**
     * 状态0关闭1正常
     */
    private Integer status;

    /**
     * ？？？？？？？？？？？
     */
    private String superior;

    /**
     * ？？？？？？？？
     */
    private String no;

    /**
     * 修改状态时间
     */
    @Column(name = "statusDate")
    private Date statusdate;

    /**
     * 联系人
     */
    private String contacts;

    /**
     * 收货地址
     */
    private String address;

    /**
     * 邮编
     */
    private Integer post;

    /**
     * 微信openid
     */
    private String openid;

    /**
     * 昵称
     */
    private String nickname;

    /**
     * 头像
     */
    private String headimg;

    /**
     * 性别
     */
    private String sex;

    /**
     * 省
     */
    private String province;

    /**
     * 市
     */
    private String city;

    /**
     * 区县
     */
    private String country;

    /**
     * ？？？？
     */
    @Column(name = "focusTime")
    private String focustime;

    /**
     * ？？？
     */
    @Column(name = "focusStatus")
    private String focusstatus;

    /**
     * 等级id
     */
    @Column(name = "levelID")
    private Integer levelid;

    /**
     * 成绩等级
     */
    @Column(name = "levelScore")
    private String levelscore;

    /**
     * 创建人id
     */
    @Column(name = "createUser")
    private Integer createuser;

    /**
     * 获取用户表id
     *
     * @return id - 用户表id
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置用户表id
     *
     * @param id 用户表id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取创建时间
     *
     * @return createDate - 创建时间
     */
    public Date getCreatedate() {
        return createdate;
    }

    /**
     * 设置创建时间
     *
     * @param createdate 创建时间
     */
    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    /**
     * 获取是否删除
     *
     * @return deleted - 是否删除
     */
    public Boolean getDeleted() {
        return deleted;
    }

    /**
     * 设置是否删除
     *
     * @param deleted 是否删除
     */
    public void setDeleted(Boolean deleted) {
        this.deleted = deleted;
    }

    /**
     * 获取版本id
     *
     * @return version - 版本id
     */
    public Integer getVersion() {
        return version;
    }

    /**
     * 设置版本id
     *
     * @param version 版本id
     */
    public void setVersion(Integer version) {
        this.version = version;
    }

    /**
     * 获取??????????
     *
     * @return balance - ??????????
     */
    public Double getBalance() {
        return balance;
    }

    /**
     * 设置??????????
     *
     * @param balance ??????????
     */
    public void setBalance(Double balance) {
        this.balance = balance;
    }

    /**
     * 获取???????????????
     *
     * @return commission - ???????????????
     */
    public Double getCommission() {
        return commission;
    }

    /**
     * 设置???????????????
     *
     * @param commission ???????????????
     */
    public void setCommission(Double commission) {
        this.commission = commission;
    }

    /**
     * 获取最后的登陆ip
     *
     * @return lastLoginIp - 最后的登陆ip
     */
    public String getLastloginip() {
        return lastloginip;
    }

    /**
     * 设置最后的登陆ip
     *
     * @param lastloginip 最后的登陆ip
     */
    public void setLastloginip(String lastloginip) {
        this.lastloginip = lastloginip;
    }

    /**
     * 获取最后的登陆时间
     *
     * @return lastLoginTime - 最后的登陆时间
     */
    public Date getLastlogintime() {
        return lastlogintime;
    }

    /**
     * 设置最后的登陆时间
     *
     * @param lastlogintime 最后的登陆时间
     */
    public void setLastlogintime(Date lastlogintime) {
        this.lastlogintime = lastlogintime;
    }

    /**
     * 获取登录次数
     *
     * @return loginCount - 登录次数
     */
    public Integer getLogincount() {
        return logincount;
    }

    /**
     * 设置登录次数
     *
     * @param logincount 登录次数
     */
    public void setLogincount(Integer logincount) {
        this.logincount = logincount;
    }

    /**
     * 获取用户名称
     *
     * @return name - 用户名称
     */
    public String getName() {
        return name;
    }

    /**
     * 设置用户名称
     *
     * @param name 用户名称
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取用户密码
     *
     * @return password - 用户密码
     */
    public String getPassword() {
        return password;
    }

    /**
     * 设置用户密码
     *
     * @param password 用户密码
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * 获取用户手机
     *
     * @return phone - 用户手机
     */
    public String getPhone() {
        return phone;
    }

    /**
     * 设置用户手机
     *
     * @param phone 用户手机
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * 获取注册ip
     *
     * @return registerIp - 注册ip
     */
    public String getRegisterip() {
        return registerip;
    }

    /**
     * 设置注册ip
     *
     * @param registerip 注册ip
     */
    public void setRegisterip(String registerip) {
        this.registerip = registerip;
    }

    /**
     * 获取状态0关闭1正常
     *
     * @return status - 状态0关闭1正常
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * 设置状态0关闭1正常
     *
     * @param status 状态0关闭1正常
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * 获取？？？？？？？？？？？
     *
     * @return superior - ？？？？？？？？？？？
     */
    public String getSuperior() {
        return superior;
    }

    /**
     * 设置？？？？？？？？？？？
     *
     * @param superior ？？？？？？？？？？？
     */
    public void setSuperior(String superior) {
        this.superior = superior;
    }

    /**
     * 获取？？？？？？？？
     *
     * @return no - ？？？？？？？？
     */
    public String getNo() {
        return no;
    }

    /**
     * 设置？？？？？？？？
     *
     * @param no ？？？？？？？？
     */
    public void setNo(String no) {
        this.no = no;
    }

    /**
     * 获取修改状态时间
     *
     * @return statusDate - 修改状态时间
     */
    public Date getStatusdate() {
        return statusdate;
    }

    /**
     * 设置修改状态时间
     *
     * @param statusdate 修改状态时间
     */
    public void setStatusdate(Date statusdate) {
        this.statusdate = statusdate;
    }

    /**
     * 获取联系人
     *
     * @return contacts - 联系人
     */
    public String getContacts() {
        return contacts;
    }

    /**
     * 设置联系人
     *
     * @param contacts 联系人
     */
    public void setContacts(String contacts) {
        this.contacts = contacts;
    }

    /**
     * 获取收货地址
     *
     * @return address - 收货地址
     */
    public String getAddress() {
        return address;
    }

    /**
     * 设置收货地址
     *
     * @param address 收货地址
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * 获取邮编
     *
     * @return post - 邮编
     */
    public Integer getPost() {
        return post;
    }

    /**
     * 设置邮编
     *
     * @param post 邮编
     */
    public void setPost(Integer post) {
        this.post = post;
    }

    /**
     * 获取微信openid
     *
     * @return openid - 微信openid
     */
    public String getOpenid() {
        return openid;
    }

    /**
     * 设置微信openid
     *
     * @param openid 微信openid
     */
    public void setOpenid(String openid) {
        this.openid = openid;
    }

    /**
     * 获取昵称
     *
     * @return nickname - 昵称
     */
    public String getNickname() {
        return nickname;
    }

    /**
     * 设置昵称
     *
     * @param nickname 昵称
     */
    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    /**
     * 获取头像
     *
     * @return headimg - 头像
     */
    public String getHeadimg() {
        return headimg;
    }

    /**
     * 设置头像
     *
     * @param headimg 头像
     */
    public void setHeadimg(String headimg) {
        this.headimg = headimg;
    }

    /**
     * 获取性别
     *
     * @return sex - 性别
     */
    public String getSex() {
        return sex;
    }

    /**
     * 设置性别
     *
     * @param sex 性别
     */
    public void setSex(String sex) {
        this.sex = sex;
    }

    /**
     * 获取省
     *
     * @return province - 省
     */
    public String getProvince() {
        return province;
    }

    /**
     * 设置省
     *
     * @param province 省
     */
    public void setProvince(String province) {
        this.province = province;
    }

    /**
     * 获取市
     *
     * @return city - 市
     */
    public String getCity() {
        return city;
    }

    /**
     * 设置市
     *
     * @param city 市
     */
    public void setCity(String city) {
        this.city = city;
    }

    /**
     * 获取区县
     *
     * @return country - 区县
     */
    public String getCountry() {
        return country;
    }

    /**
     * 设置区县
     *
     * @param country 区县
     */
    public void setCountry(String country) {
        this.country = country;
    }

    /**
     * 获取？？？？
     *
     * @return focusTime - ？？？？
     */
    public String getFocustime() {
        return focustime;
    }

    /**
     * 设置？？？？
     *
     * @param focustime ？？？？
     */
    public void setFocustime(String focustime) {
        this.focustime = focustime;
    }

    /**
     * 获取？？？
     *
     * @return focusStatus - ？？？
     */
    public String getFocusstatus() {
        return focusstatus;
    }

    /**
     * 设置？？？
     *
     * @param focusstatus ？？？
     */
    public void setFocusstatus(String focusstatus) {
        this.focusstatus = focusstatus;
    }

    /**
     * 获取等级id
     *
     * @return levelID - 等级id
     */
    public Integer getLevelid() {
        return levelid;
    }

    /**
     * 设置等级id
     *
     * @param levelid 等级id
     */
    public void setLevelid(Integer levelid) {
        this.levelid = levelid;
    }

    /**
     * 获取成绩等级
     *
     * @return levelScore - 成绩等级
     */
    public String getLevelscore() {
        return levelscore;
    }

    /**
     * 设置成绩等级
     *
     * @param levelscore 成绩等级
     */
    public void setLevelscore(String levelscore) {
        this.levelscore = levelscore;
    }

    /**
     * 获取创建人id
     *
     * @return createUser - 创建人id
     */
    public Integer getCreateuser() {
        return createuser;
    }

    /**
     * 设置创建人id
     *
     * @param createuser 创建人id
     */
    public void setCreateuser(Integer createuser) {
        this.createuser = createuser;
    }
}