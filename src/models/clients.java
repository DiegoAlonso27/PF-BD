package models;

import java.sql.Date;

public class clients {

    private int client_id;
    private String name;
    private String email;
    private String address;
    private String phone_number;
    private Date date_of_birth;
    private Date created_at;
    private Date updated_at;
    private Date deleted_at;

    // getters
    public int getClient_id() {
        return client_id;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getAddress(){
        return address;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public Date getDate_of_birth() {
        return date_of_birth;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public Date getUpdated_at() {
        return updated_at;
    }

    public Date getDeleted_at() {
        return deleted_at;
    }

    // setters

    public void setClient_id(int client_id) {
        this.client_id = client_id;
    }

    public void setName(String name) {
        this.name = name; 
    }

    public void setEmail(String email) {
        this.email = email; 
    }

    public void setAddress(String address){
        this.address = address;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number; 
    }

    public void setDate_of_birth(Date date_of_birth) {
        this.date_of_birth = date_of_birth; 
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at; 
    }

    public void setUpdated_at(Date updated_at) {
        this.updated_at = updated_at; 
    }

    public void setDeleted_at(Date deleted_at) {
        this.deleted_at = deleted_at; 
    }

    
}
