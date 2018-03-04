package com.chusu.apps.model;

import java.util.List;

/**
 * Created by Administrator on 2017/11/25 0025.
 */
public class TableList<T> {
    private Integer sEcho;//
    private Integer iTotalRecords;//实际的行数
    private Integer iTotalDisplayRecords;//过滤之后，实际的行数。
    private List<T> aaData;
    private Integer allCount;//总数量
    private Integer offset;//起始页
    private Integer size;// 每页页数

    public Integer getAllCount() {
        return allCount;
    }

    public void setAllCount(Integer allCount) {
        this.allCount = allCount;
    }

    public Integer getOffset() {
        return offset;
    }

    public void setOffset(Integer offset) {
        this.offset = offset;
    }

    public Integer getSize() {
        return size;
    }

    public void setSize(Integer size) {
        this.size = size;
    }

    public TableList() {
        super();
    }

    public Integer getSEcho() {
        return sEcho;
    }

    public void setSEcho(Integer sEcho) {
        this.sEcho = sEcho;
    }

    public Integer getITotalRecords() {
        return iTotalRecords;
    }

    public void setITotalRecords(Integer iTotalRecords) {
        this.iTotalRecords = iTotalRecords;
    }

    public Integer getITotalDisplayRecords() {
        return iTotalDisplayRecords;
    }

    public void setITotalDisplayRecords(Integer iTotalDisplayRecords) {
        this.iTotalDisplayRecords = iTotalDisplayRecords;
    }



    public List<T> getAaData() {
        return aaData;
    }

    public void setAaData(List<T> aaData) {
        this.aaData = aaData;
    }

}
