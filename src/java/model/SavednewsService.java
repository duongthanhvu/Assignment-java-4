/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author vudtpk0074
 */
public class SavednewsService {
    public static boolean insertOrDelLike(int idnews, int iduser){
        Session session = hibernate.util.HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Criteria cr = session.createCriteria(Savednews.class);
            News news = new News();
            news.setIdnews(idnews);
            Users user = new Users();
            user.setIdusers(iduser);
            cr.add(Restrictions.eq("users", user));
            cr.add(Restrictions.eq("news", news));
            Savednews like = (Savednews)cr.uniqueResult();
            if(like != null){
                session.delete(like); //Nếu đã thả tim thì bỏ thả tim
                System.out.println("Đã thích");
            }else{
                like = new Savednews(news, user);
                session.saveOrUpdate(like); //Nếu chưa thả tim thì thả tim
                System.out.println("Đã bỏ thích");
            }
            tx.commit();
            return true;
        } catch (Exception e) {
            if(tx != null){
                tx.rollback();
                System.out.println(e.getMessage());
            }
        }finally{
            session.close();
        }
        return false;
    }
    
    public static List<Savednews> getSavedNewsByUser(int idusers){
        Session session = hibernate.util.HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        List<Savednews> savedNews;
        try {
            tx = session.getTransaction();
            tx.begin();
            Criteria cr = session.createCriteria(Savednews.class);
            Users usr = new Users();
            usr.setIdusers(idusers);
            cr.add(Restrictions.eq("users", usr));
            cr.addOrder(Order.desc("idsavednews"));
            savedNews = cr.list();
            if(savedNews != null){
                tx.commit();
                return savedNews;
            }
        } catch (Exception e) {
            if(tx != null){
                tx.rollback();
                System.out.println(e.getMessage());
            }
        }
        return null;
    }
}
