package model;
// Generated Dec 25, 2017 7:47:58 PM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * News generated by hbm2java
 */
public class News  implements java.io.Serializable {


     private Integer idnews;
     private Users users;
     private String title;
     private String description;
     private String shortDescription;
     private Date createddate;
     private String featureimg;
     private Integer status;
     private String notes;
     private Set savednewses = new HashSet(0);
     private Set commentses = new HashSet(0);

    public News() {
    }

	
    public News(String title, String description) {
        this.title = title;
        this.description = description;
    }
    public News(Users users, String title, String description, String shortDescription, Date createddate, String featureimg, Integer status, String notes, Set savednewses, Set commentses) {
       this.users = users;
       this.title = title;
       this.description = description;
       this.shortDescription = shortDescription;
       this.createddate = createddate;
       this.featureimg = featureimg;
       this.status = status;
       this.notes = notes;
       this.savednewses = savednewses;
       this.commentses = commentses;
    }
   
    public Integer getIdnews() {
        return this.idnews;
    }
    
    public void setIdnews(Integer idnews) {
        this.idnews = idnews;
    }
    public Users getUsers() {
        return this.users;
    }
    
    public void setUsers(Users users) {
        this.users = users;
    }
    public String getTitle() {
        return this.title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
    public String getDescription() {
        return this.description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    public String getShortDescription() {
        return this.shortDescription;
    }
    
    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }
    public Date getCreateddate() {
        return this.createddate;
    }
    
    public void setCreateddate(Date createddate) {
        this.createddate = createddate;
    }
    public String getFeatureimg() {
        return this.featureimg;
    }
    
    public void setFeatureimg(String featureimg) {
        this.featureimg = featureimg;
    }
    public Integer getStatus() {
        return this.status;
    }
    
    public void setStatus(Integer status) {
        this.status = status;
    }
    public String getNotes() {
        return this.notes;
    }
    
    public void setNotes(String notes) {
        this.notes = notes;
    }
    public Set getSavednewses() {
        return this.savednewses;
    }
    
    public void setSavednewses(Set savednewses) {
        this.savednewses = savednewses;
    }
    public Set getCommentses() {
        return this.commentses;
    }
    
    public void setCommentses(Set commentses) {
        this.commentses = commentses;
    }




}

