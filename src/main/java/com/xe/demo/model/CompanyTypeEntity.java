package com.xe.demo.model;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by Rock on 2017/9/5.
 */
@Entity
@Table(name = "company_type", schema = "spring_boot", catalog = "")
public class CompanyTypeEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String name;
    private Integer status;
    private String update_date;
    private String create_date;
    private Integer user_id;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
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
    @Column(name = "status")
    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Basic
    @Column(name = "update_date")
    public String getUpdate_date() {
        return update_date;
    }

    public void setUpdate_date(String update_date) {
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
    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CompanyTypeEntity that = (CompanyTypeEntity) o;

        if (id != that.id) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (status != null ? !status.equals(that.status) : that.status != null) return false;
        if (update_date != null ? !update_date.equals(that.update_date) : that.update_date != null) return false;
        if (create_date != null ? !create_date.equals(that.create_date) : that.create_date != null) return false;
        if (user_id != null ? !user_id.equals(that.user_id) : that.user_id != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (status != null ? status.hashCode() : 0);
        result = 31 * result + (update_date != null ? update_date.hashCode() : 0);
        result = 31 * result + (create_date != null ? create_date.hashCode() : 0);
        result = 31 * result + (user_id != null ? user_id.hashCode() : 0);
        return result;
    }
}
