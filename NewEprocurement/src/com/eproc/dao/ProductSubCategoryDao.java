

package com.eproc.dao;

import com.eproc.dao.DepartmentMaster;
import com.eproc.domain.ProductSubCategory;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 * This Interface content method to mangeProductCategoryy master at department level
 *
 * @author Vaishali Gupta
 * @param <ProductSubCategory>
 */

public interface ProductSubCategoryDao<ProductSubCategory> extends DepartmentMaster<ProductSubCategory>{
    public abstract boolean insertData(ProductSubCategory productSubCategory);

    public abstract boolean removeData(Integer productSubCategoryId);

    public abstract ProductSubCategory fetchData(Integer productSubCategoryId);

    public abstract boolean updateData(ProductSubCategory productSubCategory);

    public abstract List fetchAll();

    public String checkDuplicateValue(ProductSubCategory productSubCategory);
}
