package com.nastation.pm.beanhbm;

import java.util.HashSet;
import java.util.Set;

/**
 * @author 孙重阳 User bean
 */
public class Userhbm {

    private int id;
    private String name;
    private String password;
    private String fullName;
    private String email;
    private java.util.Date createDate;
    private boolean admin;
    private Set<Grouphbm> groups = new HashSet<>();

    public Set<Grouphbm> getGroups() {
        return groups;
    }

    public void setGroups(Set<Grouphbm> groups) {
        this.groups = groups;
    }

    public java.util.Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(java.util.Date createDate) {
        this.createDate = createDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
        if (id == 1) {
            this.admin = true;
        }
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isAdmin() {
        return admin;
    }

    public void setAdmin(boolean admin) {
        this.admin = admin;
    }

}
