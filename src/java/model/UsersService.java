/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import hibernate.util.HibernateUtil;
import java.time.Instant;
import java.time.LocalDate;
import java.time.YearMonth;
import java.time.ZoneId;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author vudtpk0074
 */
public class UsersService {

    public static boolean insertUser(Users user) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            session.saveOrUpdate(user);
            tx.commit();
            return true;
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
        return false;
    }

    public static Users getUserById(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            String strQuery = "from Users where idusers = " + id;
            Query query = session.createQuery(strQuery);
            Users user = (Users) query.uniqueResult();
            if (user != null) {
                tx.commit();
                return user;
            }
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
        return null;
    }

    public static Users CheckUserExist(String username, String email) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            String strQuery = "from Users where UserName='" + username
                    + "'  or Email='" + email + "'";
            Query query = session.createQuery(strQuery);
            Users user = (Users) query.uniqueResult();
            if (user != null) {
                return user;
            }
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
                System.out.println(e.getMessage());
            }
        } finally {
            session.close();
        }
        return null;
    }

    public static List<Users> getAllUsers() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        List<Users> users;
        try {
            tx = session.getTransaction();
            tx.begin();
            Criteria cr = session.createCriteria(Users.class);
            cr.addOrder(Order.desc("idusers"));
            users = cr.list();
            if (users != null) {
                tx.commit();
                return users;
            }
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
                System.out.println(e.getMessage());
            }
        } finally {
            session.close();
        }
        return null;
    }

    public static int getNumOfUsersPerMonth(int month, int year) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Date beginDate, endDate;
            YearMonth yearMonth = YearMonth.of(year, month);
            LocalDate firstOfMonth = yearMonth.atDay(1);
            LocalDate last = yearMonth.atEndOfMonth();
            beginDate = Date.from(firstOfMonth.atStartOfDay(ZoneId.systemDefault()).toInstant());
            endDate = Date.from(last.atStartOfDay(ZoneId.systemDefault()).toInstant());
            Criteria cr = session.createCriteria(Users.class);
            cr.add(Restrictions.between("createddate", beginDate, endDate));
            cr.setProjection(Projections.rowCount());
            int num = Integer.parseInt(cr.uniqueResult().toString());
            tx.commit();
            return num;
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
                System.out.println(e.getMessage());
            }
        } finally {
            session.close();
        }
        return 0;
    }
}
