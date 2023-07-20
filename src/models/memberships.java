package models;

import java.sql.Date;

public class memberships {
    
    private int membership_id;
    private int client_id;
    private int type_membership_id;
    private Date start_date;
    private Date end_date;
    private float price;
    private Date created_at;
    private Date updated_at;
    private Date deleted_at;

    // getters

    public int getMembership_id() {
        return membership_id;
    }

    public int getClient_id() {
        return client_id;
    }

    public int getType_membership_id() {
        return type_membership_id;
    }

    public Date getStart_date() {
        return start_date;
    }

    public Date getEnd_date() {
        return end_date;
    }

    public float getPrice() {
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

    public void setMembership_id(int membership_id) {
        this.membership_id = membership_id;
    }

    public void setClient_id(int client_id) {
        this.client_id = client_id;
    }

    public void setType_membership_id(int type_membership_id) {
        this.type_membership_id = type_membership_id;
    }

    public void setStart_date(Date start_date) {
        this.start_date = start_date;
    }

    public void setEnd_date(Date end_date) {
        this.end_date = end_date;
    }

    public void setPrice(float price) {
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
