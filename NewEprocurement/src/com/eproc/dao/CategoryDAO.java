/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

import com.eproc.dao.DepartmentMaster;
import com.eproc.domain.TenderCategory;
import java.util.List;

/**
 *
 * @author Naina Jain
 */
public interface CategoryDAO extends DepartmentMaster<TenderCategory> {

    List getDuplicateCategory(TenderCategory addcategory);
}
