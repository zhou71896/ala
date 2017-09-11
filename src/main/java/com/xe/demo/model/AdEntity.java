package com.xe.demo.model;

import javax.persistence.*;

/**
 * Created by Rock on 2017/8/31.
 */
@Entity
@Table(name = "ad", schema = "spring_boot", catalog = "")
public class AdEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String name;
    private Byte type;
    private String icon;
    private String content;
    private Integer status;
    private String update_date;
    private String create_date;
    private Long user_id;

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
    public String getUpdateDate() {
        return update_date;
    }

    public void setUpdateDate(String update_date) {
        this.update_date = update_date;
    }

    @Basic
    @Column(name = "create_date")
    public String getCreate_date() {
        return create_date;
    }

    public void setCreate_date(String create_date) {
        this.create_date = create_date;
    }

    @Basic
    @Column(name = "user_id")
    public Long getUser_id() {
        return user_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
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
        if (update_date != null ? !update_date.equals(adEntity.update_date) : adEntity.update_date != null) return false;
        if (create_date != null ? !create_date.equals(adEntity.create_date) : adEntity.create_date != null) return false;
        if (user_id != null ? !user_id.equals(adEntity.user_id) : adEntity.user_id != null) return false;

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
        result = 31 * result + (update_date != null ? update_date.hashCode() : 0);
        result = 31 * result + (create_date != null ? create_date.hashCode() : 0);
        result = 31 * result + (user_id != null ? user_id.hashCode() : 0);
        return result;
    }
}
