package com.eproc.domain;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author Naina Jain
 */
@Entity
@Table(name = "addkeywords")
public class AddKeywords {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "tenderKeyWordsId")
    private int tenderKeyWordsId;

    @Column(name = "tenderKeyWordsName")
    private String tenderKeyWordsName;

    @Column(name = "dept_id")
    private int dept_id = 2;

    @Column(name = "date")
    private Date date;

    @Column(name = "tender_category_id")
    private int tender_category_id;

    @Column(name = "tender_category_name")
    private String tender_category_name;

    @Column(name = "areaofwork_id")
    private int areaofwork_id;

    @Column(name = "areaofwork_name")
    private String areaofwork_name;

    public int getTenderKeyWordsId() {
        return tenderKeyWordsId;
    }

    public void setTenderKeyWordsId(int tenderKeyWordsId) {
        this.tenderKeyWordsId = tenderKeyWordsId;
    }

    public String getTenderKeyWordsName() {
        return tenderKeyWordsName;
    }

    public void setTenderKeyWordsName(String tenderKeyWordsName) {
        this.tenderKeyWordsName = tenderKeyWordsName;
    }

    public int getTender_category_id() {
        return tender_category_id;
    }

    public void setTender_category_id(int tender_category_id) {
        this.tender_category_id = tender_category_id;
    }

    public int getAreaofwork_id() {
        return areaofwork_id;
    }

    public void setAreaofwork_id(int areaofwork_id) {
        this.areaofwork_id = areaofwork_id;
    }

    public int getDept_id() {
        return dept_id;
    }

    public void setDept_id(int dept_id) {
        this.dept_id = dept_id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getTender_category_name() {
        return tender_category_name;
    }

    public void setTender_category_name(String tender_category_name) {
        this.tender_category_name = tender_category_name;
    }

    public String getAreaofwork_name() {
        return areaofwork_name;
    }

    public void setAreaofwork_name(String areaofwork_name) {
        this.areaofwork_name = areaofwork_name;
    }
    
}
