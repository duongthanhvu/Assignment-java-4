/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import hibernate.util.HibernateUtil;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author vudtpk0074
 */
public class CommentService {

    public static boolean InsertComment(Comments comment) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            session.saveOrUpdate(comment);
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

    public static List<Comments> getCommentByNews(int idnews) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        List<Comments> arrComment;
        try {
            tx = session.getTransaction();
            tx.begin();
            Criteria cr = session.createCriteria(Comments.class);
//            News news = NewsService.getNewsById(idnews);
            News news = new News();
            news.setIdnews(idnews);
            cr.add(Restrictions.eq("news", news));
            cr.addOrder(Order.desc("idcomments"));
            arrComment = cr.list();
            if (arrComment != null) {
                tx.commit();
                return arrComment;
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

    public static int getCommentCount(int idnews) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Criteria cr = session.createCriteria(Comments.class);
//            News news = NewsService.getNewsById(idnews);
            News news = new News();
            news.setIdnews(idnews);
            cr.add(Restrictions.eq("news", news));
            cr.setProjection(Projections.rowCount());
            List result = cr.list();
            if (result != null) {
                int rowCount = Integer.parseInt(result.get(0).toString());
                System.out.println("check thử rowcount = " + rowCount);
                tx.commit();
                return rowCount;
            }
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
