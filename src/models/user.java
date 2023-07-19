package models;

import java.sql.Date;

public class user {

    private int id;
    private String name;
    private String email;
    private String password;
    private String phone_number;
    private Date created_at;
    private Date updated_at;
    private Date deleted_at;

    // setters
    public void setId(int id) {
        this.id = id;
    }
    public void setName(String name) {
        this.name = name; 
    }
    public void setEmail(String email) {
        this.email = email; 
    }
    public void setPassword(String password) {
        this.password = password; 
    }
    public void setPhoneNumber(String phone_number) {
        this.phone_number = phone_number; 
    }
    public void setCreatedAt(Date created_at) {
        this.created_at = created_at; 
    }
    public void setUpdatedAt(Date updated_at) {
        this.updated_at = updated_at; 
    }
    public void setDeletedAt(Date deleted_at) {
        this.deleted_at = deleted_at; 
    }

    // getters
    public int getId() {
        return this.id;
    }
    public String getName() {
        return this.name; 
    }
    public String getEmail() {
        return this.email; 
    }
    public String getPassword() {
        return this.password; 
    }
    public String getPhoneNumber() {
        return this.phone_number; 
    }
    public Date getCreatedAt() {
        return this.created_at; 
    }
    public Date getUpdatedAt() {
        return this.updated_at; 
    }
    public Date getDeletedAt() {
        return this.deleted_at; 
    }

    

}
