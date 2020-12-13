package com.eproc.dao;

import java.util.List;

/**
 * This Interface content method to mange country master at department level
 *
 * @author Shashank Shukla
 * @param <States>
 */

public interface StatesDao<States> extends DepartmentMaster<States> {

    public abstract List fetchStates(int country_Id);
    public List getDuplicateState(States state);
    public States fetchById(int state_id);
}
