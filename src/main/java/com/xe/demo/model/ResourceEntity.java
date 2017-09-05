package com.xe.demo.model;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by Rock on 2017/9/5.
 */
@Entity
@Table(name = "resource", schema = "spring_boot", catalog = "")
public class ResourceEntity {
    private long id;
    private Long resourceId;
    private String url;
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
    @Column(name = "resourceId")
    public Long getResourceId() {
        return resourceId;
    }

    public void setResourceId(Long resourceId) {
        this.resourceId = resourceId;
    }

    @Basic
    @Column(name = "url")
    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
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
    @Column(name = "updateDate")
    public Timestamp getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Timestamp updateDate) {
        this.updateDate = updateDate;
    }

    @Basic
    @Column(name = "createDate")
    public Timestamp getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Timestamp createDate) {
        this.createDate = createDate;
    }

    @Basic
    @Column(name = "userId")
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

        ResourceEntity that = (ResourceEntity) o;

        if (id != that.id) return false;
        if (resourceId != null ? !resourceId.equals(that.resourceId) : that.resourceId != null) return false;
        if (url != null ? !url.equals(that.url) : that.url != null) return false;
        if (status != null ? !status.equals(that.status) : that.status != null) return false;
        if (updateDate != null ? !updateDate.equals(that.updateDate) : that.updateDate != null) return false;
        if (createDate != null ? !createDate.equals(that.createDate) : that.createDate != null) return false;
        if (userId != null ? !userId.equals(that.userId) : that.userId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (resourceId != null ? resourceId.hashCode() : 0);
        result = 31 * result + (url != null ? url.hashCode() : 0);
        result = 31 * result + (status != null ? status.hashCode() : 0);
        result = 31 * result + (updateDate != null ? updateDate.hashCode() : 0);
        result = 31 * result + (createDate != null ? createDate.hashCode() : 0);
        result = 31 * result + (userId != null ? userId.hashCode() : 0);
        return result;
    }
}
