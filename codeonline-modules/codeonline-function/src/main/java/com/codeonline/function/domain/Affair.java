package com.codeonline.function.domain;

import com.codeonline.common.core.web.domain.BaseEntity;


/*
 * 统一的事务类
 * */
public class Affair extends BaseEntity {
    private Long affairId;//事务id

    private Long accessId;// 联系id
    private Long handlePeopleId;// 处理人id

    private Long affairPeopleId;// 事务人id

    private String affairPeopleName;// 事务人姓名

    private String content;// 事务内容


    private String affairType;// 事务类型


    private String affairStatus;// 事务状态

    private String reply;// 事务回复

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }

    public Long getAffairId() {
        return affairId;
    }

    public void setAffairId(Long affairId) {
        this.affairId = affairId;
    }

    public Long getHandlePeopleId() {
        return handlePeopleId;
    }

    public void setHandlePeopleId(Long handlePeopleId) {
        this.handlePeopleId = handlePeopleId;
    }

    public Long getAffairPeopleId() {
        return affairPeopleId;
    }

    public void setAffairPeopleId(Long affairPeopleId) {
        this.affairPeopleId = affairPeopleId;
    }

    public String getAffairPeopleName() {
        return affairPeopleName;
    }

    public void setAffairPeopleName(String affairPeopleName) {
        this.affairPeopleName = affairPeopleName;
    }

    public String getAffairType() {
        return affairType;
    }

    public void setAffairType(String affairType) {
        this.affairType = affairType;
    }


    public String getAffairStatus() {
        return affairStatus;
    }

    public void setAffairStatus(String affairStatus) {
        this.affairStatus = affairStatus;
    }

    public Long getAccessId() {
        return accessId;
    }

    public void setAccessId(Long accessId) {
        this.accessId = accessId;
    }
}
