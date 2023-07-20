package models;

import java.sql.Date;

public class type_memberships {

    private int type_membership_id;
    private String name;
    private int length;
    private double price;
    private Date created_at;
    private Date updated_at;
    private Date deleted_at;

    // getters
    public int getType_membership_id() {
        return type_membership_id;
    }

    public String getName() {
        return name;
    }

    public int getLength() {
        return length;
    }

    public double getPrice() {
        return price;
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

    public void setType_membership_id(int type_membership_id) {
        this.type_membership_id = type_membership_id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setLength(int length) {
        this.length = length;
    }

    public void setPrice(double price) {
        this.price = price;
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
