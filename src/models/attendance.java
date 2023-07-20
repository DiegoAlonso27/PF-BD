package models;

import java.sql.Date;

public class attendance {

    private int attendance_id;
    private int client_id;
    private int user_id;
    private Date date_attendance;
    private int type_assistances;
    private boolean valid;
    private Date created_at;
    private Date updated_at;
    private Date deleted_at;

    // getters
    public int getAttendance_id() {
        return attendance_id;
    }

    public int getClient_id() {
        return client_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public Date getDate_attendance() {
        return date_attendance;
    }

    public int getType_assistances() {
        return type_assistances;
    }

    public boolean isValid() {
        return valid;
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

    public void setAttendance_id(int attendance_id) {
        this.attendance_id = attendance_id;
    }

    public void setClient_id(int client_id) {
        this.client_id = client_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public void setDate_attendance(Date date_attendance) {
        this.date_attendance = date_attendance;
    }

    public void setType_assistances(int type_assistances){
        this.type_assistances = type_assistances;
    }

    public void setValid(boolean valid) {
        this.valid = valid;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public void setUpdated_at(Date updated_at){
        this.updated_at = updated_at;
    }

    public void setDeleted_at(Date deleted_at) {
        this.deleted_at = deleted_at;
    }
    
}
