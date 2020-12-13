package com.eproc.dao;

import java.util.List;

/**
 * This Interface content method to mange country master at department level
 *
 * @author Shashank Shukla
 * @param <Cities>
 */

public interface CitiesDao<Cities> extends DepartmentMaster<Cities> {

    public List fetchCity(int city_id);
    public Cities fetchByIdEdit(int city_id);
    public abstract List fetchCitiesByState(int state_id);
    public List getDuplicateCities(Cities cities);

}
