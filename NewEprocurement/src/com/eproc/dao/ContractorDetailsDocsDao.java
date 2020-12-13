/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

import com.eproc.dao.DepartmentMaster;

/**
 *
 * @author Windows7
 */
public interface ContractorDetailsDocsDao<ContractorOtherDetailsDocs> extends DepartmentMaster<ContractorOtherDetailsDocs> {
public abstract boolean updatedoc(int id, String fileName, String fileConvertedName,Integer fileId);
public abstract boolean deletedoc(int id,String filename,Integer fileId);
}
