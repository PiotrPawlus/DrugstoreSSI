package com.ssi.drugstore.repository;

import com.ssi.drugstore.model.Category;
import com.ssi.drugstore.model.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by piotrpawlus on 16/12/2016.
 */
public class CategoryRepository {

    public static boolean isExisting(String id) {

        Integer identifier = Integer.parseInt(id);

        List categories = CategoryRepository.all();
        boolean exist = false;

        for (Object element: categories) {

            Category category = (Category) element;
            if (category.getId() == identifier) exist = true;
        }

        return exist;
    }

    public static Category getForIdentifier(String id) {

        int identifier = Integer.parseInt(id);

        return getForIdentifier(identifier);
    }

    public static Category getForIdentifier(int id) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        Category category;

        try {

            transaction = session.beginTransaction();
            category = (Category) session.get(Category.class, id);
            transaction.commit();

        } catch (HibernateException e) {

            if (transaction != null) transaction.rollback();
            throw e;

        } finally {
            session.close();
        }

        return category;
    }

    public static List<Category> all() {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        List categories = new ArrayList();

        try {

            transaction = session.beginTransaction();
            categories = (List<Category>) session.createQuery("from Category").list();
            transaction.commit();

        } catch (HibernateException e) {

            if (transaction != null) transaction.rollback();
            throw e;

        } finally {
            session.close();
        }

        return categories;
    }

    public static void createOrUpdate(Category category) {
        CategoryRepository.managePersistentStore(false, category);
    }

    public static void delete(Category category) {
        CategoryRepository.managePersistentStore(true, category);
    }

    private static void managePersistentStore(Boolean delete, Category category) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;

        try {

            transaction = session.beginTransaction();

            if (delete) {
                session.delete(category);
            } else {
                session.saveOrUpdate(category);
            }

            transaction.commit();

        } catch (HibernateException e) {

            if (transaction != null) transaction.rollback();
            throw e;

        } finally {
            session.close();
        }
    }
}
