package com.eproc.daoImpl;

import com.eproc.dao.CircleDao;
import com.eproc.domain.Circle;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CircleDaoImpl implements CircleDao<Circle>{

    @Autowired
    SessionFactory sessionFactory;
    Circle circle;

    public CircleDaoImpl() {
    }
    
    /*insertData
     * Method used to insert circle
     *@param dc
     */
    @Override
    public boolean insertData(Circle circle) {
        System.out.println("----------------Method call to insert circle in  CircleDaoImpl----------------");
        Session session = null;
        System.out.print("department circle save object is " + circle);
        try {
            session = sessionFactory.openSession();
            Transaction txn = session.beginTransaction();
            session.saveOrUpdate(circle);
            txn.commit();
            System.out.println("Department Circle save status is : ");

        } catch (Exception ex) {
            System.out.println("Class:  CircleDaoImpl\nMethod:  insertData");
            System.out.print("Exception in Save Circle " + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("----------------Method end to insert circle in  CircleDaoImpl----------------");
        return false;
    }

    /*fetchAll
     * Method used to fetch circle
     * @return List
     */
    @Override
    public List<Circle> fetchAll() {
        System.out.println("----------------Method call to fetch all circle in CircleDaoImpl----------------");
        Session session = null;
        List<Circle> circleList = new ArrayList<Circle>();
        try {
            session = sessionFactory.openSession();
            circleList = session.createQuery("FROM Circle").list();
            Iterator it = circleList.iterator();
            while (it.hasNext()) {
                Circle dept = (Circle) it.next();
                System.out.println("Depart ID " + dept.getCircle());
            }
        } catch (Exception ex) {
            System.out.println("Class:  CircleDaoImpl\nMethod:  fetchAll");
            System.out.print("Exception in fetchAll Circle " + ex.getMessage());
        } finally {
            session.close();
        }
        System.out.println("----------------Method end to fetch all circle in  CircleDaoImpl----------------");
        return circleList;
    }

    /*fetchData
     * Method used to fetchData circle by Id
     * @return List
     */
    @Override
    public Circle fetchData(Integer id) {
        System.out.println("----------------Method call to fetch circle by id in  CircleDaoImpl----------------");
        Circle circle = new Circle();
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM Circle WHERE id =:id");
            query.setParameter("id", id);
            circle = (Circle) query.uniqueResult();
        } catch (Exception ex) {
            System.out.println("Class:  CircleDaoImpl\nMethod:  fetchData");
            System.out.print("Exception in fetch Circle " + ex.getMessage());
        } finally {
            session.close();
        }
        System.out.println("----------------Method end to fetch circle by id in  CircleDaoImpl----------------");
        return circle;
    }

    /*updateData
     * Method used to updateData circle 
     */
    @Override
    public boolean updateData(Circle circle) {
        System.out.println("----------------Method call to update circle in  CircleDaoImpl----------------");
        Session session = null;
        Transaction txn = null;
        try {
            session = sessionFactory.openSession();
            txn = session.beginTransaction();
            session.saveOrUpdate(circle);
        } catch (Exception ex) {
            System.out.println("Class:  CircleDaoImpl\nMethod:  updateDataData");
            System.out.print("Exception in updatedata Circle " + ex.getMessage());
        } finally {
            txn.commit();
            session.close();
        }
        System.out.println("----------------Method end to update circle in  CircleDaoImpl----------------");
        return false;
    }

    /*removeData
     * Method used to removeData circle 
     */
    @Override
    public boolean removeData(Integer id) {
        System.out.println("----------------Method call to remove circle in  CircleDaoImpl----------------");
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("DELETE FROM Circle WHERE "
                    + "circleid =:id");
            query.setParameter("id", id);
            query.executeUpdate();
        } catch (Exception ex) {
            System.out.println("Class:  CircleDaoImpl\nMethod:  removeData");
            System.out.print("Exception in updatedata Circle " + ex.getMessage());
        } finally {
            session.close();
        }
        System.out.println("----------------Method end to remove circle in  CircleDaoImpl----------------");
        return false;
    }

    @Override
    public String checkDuplicateValue(Circle circle) {
        System.out.println("-----------------Method called to checkDuplicateValue Circle in Dao----------------------------");
        String message = "";
        List<Circle> circleList = this.fetchAll();
        Iterator<Circle> iterator = circleList.listIterator();
        while (iterator.hasNext()) {
            Circle c = iterator.next();
            if (circle.getCircle().trim().equalsIgnoreCase(c.getCircle().trim())) {
                message = "Duplicate Circle Name";
                System.out.println(message);
            }
            else if (circle.getCircle().isEmpty() || circle.getCircle()== null) {

                message = "Enter Circle Name";

            }
        }
        System.out.println("-----------------Method End to checkDuplicateValue Circle in Dao----------------------------");
        return message;

    }

}
