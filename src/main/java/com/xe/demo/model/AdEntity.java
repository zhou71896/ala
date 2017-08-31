package com.xe.demo.model;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by Rock on 2017/8/31.
 */
@Entity
@Table(name = "ad", schema = "spring_boot", catalog = "")
public class AdEntity {
    private long id;
    private String name;
    private Byte type;
    private String icon;
    private String content;
    private Integer status;
    private Timestamp updateDate;
    private Timestamp createDate;
    private Long userId;

    @Id
    @Column(name = "id")
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "type")
    public Byte getType() {
        return type;
    }

    public void setType(Byte type) {
        this.type = type;
    }

    @Basic
    @Column(name = "icon")
    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    @Basic
    @Column(name = "content")
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Basic
    @Column(name = "status")
    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Basic
    @Column(name = "update_date")
    public Timestamp getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Timestamp updateDate) {
        this.updateDate = updateDate;
    }

    @Basic
    @Column(name = "create_date")
    public Timestamp getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Timestamp createDate) {
        this.createDate = createDate;
    }

    @Basic
    @Column(name = "user_id")
    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        AdEntity adEntity = (AdEntity) o;

        if (id != adEntity.id) return false;
        if (name != null ? !name.equals(adEntity.name) : adEntity.name != null) return false;
        if (type != null ? !type.equals(adEntity.type) : adEntity.type != null) return false;
        if (icon != null ? !icon.equals(adEntity.icon) : adEntity.icon != null) return false;
        if (content != null ? !content.equals(adEntity.content) : adEntity.content != null) return false;
        if (status != null ? !status.equals(adEntity.status) : adEntity.status != null) return false;
        if (updateDate != null ? !updateDate.equals(adEntity.updateDate) : adEntity.updateDate != null) return false;
        if (createDate != null ? !createDate.equals(adEntity.createDate) : adEntity.createDate != null) return false;
        if (userId != null ? !userId.equals(adEntity.userId) : adEntity.userId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (type != null ? type.hashCode() : 0);
        result = 31 * result + (icon != null ? icon.hashCode() : 0);
        result = 31 * result + (content != null ? content.hashCode() : 0);
        result = 31 * result + (status != null ? status.hashCode() : 0);
        result = 31 * result + (updateDate != null ? updateDate.hashCode() : 0);
        result = 31 * result + (createDate != null ? createDate.hashCode() : 0);
        result = 31 * result + (userId != null ? userId.hashCode() : 0);
        return result;
    }
}
