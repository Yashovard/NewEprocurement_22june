    
package com.eproc.domain;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
/*
 * Process Department SubDivision Form page with all setter() and getter()
 * Department can insert and update Department Division.
  #Author  Anshu Baghel
 */
@Entity
@Table(name = "SubDivision")
public class SubDivision implements Serializable {
 
    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "subdivision_id", unique = true, nullable = false)
    private Integer subdivision_id;
    
    @Column(name = "subdivision")
    private String subdivision;
      
     @Column(name = "created_Date")
    private Date  created_Date ;
    
    @Column(name = "circleid")
    private  Integer circleid;
    
    @Column(name = "division_id")
    private Integer division_id;
    
    @Column(name = "division")
    private String division; 
    
    @Column(name = "circle")
    private String circle;
    
    public SubDivision() {
    }

    public Integer getSubdivision_id() {
        return subdivision_id;
    }

    public void setSubdivision_id(Integer subdivision_id) {
        this.subdivision_id = subdivision_id;
    }

    public String getSubdivision() {
        return subdivision;
    }

    public void setSubdivision(String subdivision) {
        this.subdivision = subdivision;
    }

    public Date getCreated_Date() {
        return created_Date;
    }

    public void setCreated_Date(Date created_Date) {
        this.created_Date = created_Date;
    }

    public Integer getCircleid() {
        return circleid;
    }

    public void setCircleid(Integer circleid) {
        this.circleid = circleid;
    }

    public Integer getDivision_id() {
        return division_id;
    }

    public void setDivision_id(Integer division_id) {
        this.division_id = division_id;
    }

    public String getDivision() {
        return division;
    }

    public void setDivision(String division) {
        this.division = division;
    }

    public String getCircle() {
        return circle;
    }

    public void setCircle(String circle) {
        this.circle = circle;
    }
    
}
