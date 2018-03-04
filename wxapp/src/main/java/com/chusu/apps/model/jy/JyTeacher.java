package com.chusu.apps.model.jy;

import java.util.Date;
import javax.persistence.*;

@Table(name = "jy_teacher")
public class JyTeacher {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String name;

    @Column(name = "post_time")
    private Date postTime;

    @Column(name = "open_id")
    private String openId;

    private String phone;

    private Integer status;

    @Column(name = "is_dedle")
    private Integer isDedle;

    private String images;

    @Column(name = "nic_name")
    private String nicName;

    /**
     * @return id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * @return name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return post_time
     */
    public Date getPostTime() {
        return postTime;
    }

    /**
     * @param postTime
     */
    public void setPostTime(Date postTime) {
        this.postTime = postTime;
    }

    /**
     * @return open_id
     */
    public String getOpenId() {
        return openId;
    }

    /**
     * @param openId
     */
    public void setOpenId(String openId) {
        this.openId = openId;
    }

    /**
     * @return phone
     */
    public String getPhone() {
        return phone;
    }

    /**
     * @param phone
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * @return status
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * @param status
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * @return is_dedle
     */
    public Integer getIsDedle() {
        return isDedle;
    }

    /**
     * @param isDedle
     */
    public void setIsDedle(Integer isDedle) {
        this.isDedle = isDedle;
    }

    /**
     * @return images
     */
    public String getImages() {
        return images;
    }

    /**
     * @param images
     */
    public void setImages(String images) {
        this.images = images;
    }

    /**
     * @return nic_name
     */
    public String getNicName() {
        return nicName;
    }

    /**
     * @param nicName
     */
    public void setNicName(String nicName) {
        this.nicName = nicName;
    }
}