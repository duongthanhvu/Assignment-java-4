/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import hibernate.util.HibernateUtil;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author vudtpk0074
 */
public class NewsService {

    public static boolean InsertNews(News news) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            session.saveOrUpdate(news);
            tx.commit();
            return true;
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
                System.out.println(e.getMessage());
            }
        } finally {
            session.close();
        }
        return false;
    }

    public static News getNewsById(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            News news = (News) session.get(News.class, id);
            if (news != null) {
                tx.commit();
                return news;
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

    public static List<News> getAllNews() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        List<News> arrNews;
        try {
            tx = session.getTransaction();
            tx.begin();
            Criteria cr = session.createCriteria(News.class);
            cr.addOrder(Order.desc("idnews"));
            arrNews = cr.list();
            if (arrNews != null) {
                tx.commit();
                return arrNews;
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

    public static List<News> getLatestNews(int begin, int number) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        List<News> arrNews;
        try {
            tx = session.getTransaction();
            tx.begin();
            Criteria cr = session.createCriteria(News.class);
            cr.addOrder(Order.desc("idnews"));
            cr.setFirstResult(0 + begin);
            cr.setMaxResults(number);
            arrNews = cr.list();
            if (arrNews != null) {
                tx.commit();
                return arrNews;
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

    public static List<News> getNewsByUser(int iduser) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        List<News> arrNews;
        try {
            tx = session.getTransaction();
            tx.begin();
            Criteria cr = session.createCriteria(News.class);
//            Users usr = UsersService.getUserById(iduser);
            Users usr = new Users();
            usr.setIdusers(iduser);
            cr.add(Restrictions.eq("users", usr));
            cr.addOrder(Order.desc("idnews"));
            arrNews = cr.list();
            if (arrNews != null) {
                tx.commit();
                return arrNews;
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

    public static boolean deleteNews(int idnews) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            News news = getNewsById(idnews);
            session.delete(news);
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

    public static Map<Users, Integer> getTopUserByNumOfNews() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        List<Users> users;
        try {
            tx = session.getTransaction();
            tx.begin();
            Criteria cr = session.createCriteria(News.class);
            ProjectionList projectionList = Projections.projectionList();
            projectionList.add(Projections.groupProperty("users"));
            cr.setProjection(projectionList);
            users = cr.list();
            Map map = new HashMap();
            if (users != null) {
                for (Users usr : users) {
                    cr = session.createCriteria(News.class);
                    cr.add(Restrictions.eq("users", usr));
                    cr.setProjection(Projections.rowCount());
                    int num = Integer.parseInt(cr.uniqueResult().toString());
                    map.put(usr, num);
                    System.out.println(usr.getIdusers() + " có " +num+ " tin");
                }
            }
            tx.commit();
            return map;
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
}
