

package com.eproc.dao;

import com.eproc.dao.DepartmentMaster;
import java.util.List;

/**
 * This Interface content method to mangeProductCategoryy master at department level
 *
 * @author Vaishali Gupta
 * @param <ProductCategory>
 * @since 12 June 2018
 * @version 2.0.0
 */

public interface ProductCategoryDao<ProductCategory> extends DepartmentMaster<ProductCategory>{
    public abstract boolean insertData(ProductCategory productCategory);
    public abstract boolean removeData(Integer id);
    public abstract ProductCategory fetchData(Integer id);
    public abstract boolean updateData(ProductCategory productCategory);
    public abstract List fetchAll();
    public String checkDuplicateValue(ProductCategory productCategory);
}
