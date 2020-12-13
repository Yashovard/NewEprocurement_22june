/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

import com.eproc.domain.AreaOfWork;

/**
 *
 * @author Naina Jain
 */
public interface AreaOfWorkDAO extends DepartmentMaster<AreaOfWork> {

    String getDuplicateAreaOfWork(AreaOfWork addareaofwork);
}
