package com.ssi.drugstore.repository;

import com.ssi.drugstore.model.HibernateUtil;
import com.ssi.drugstore.model.Manufacturer;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by piotrpawlus on 16/12/2016.
 */
public class ManufacturerRepository {

    public static Manufacturer getForIdentifier(String id) {

        int identifier = Integer.parseInt(id);

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        Manufacturer manufacturer;

        try {

            transaction = session.beginTransaction();
            manufacturer = (Manufacturer) session.get(Manufacturer.class, identifier);
            transaction.commit();

        } catch (HibernateException e) {

            if (transaction != null) transaction.rollback();
            throw e;

        } finally {
            session.close();
        }

        return manufacturer;
    }

    public static List all() {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        List<Manufacturer> manufacturers = new ArrayList();

        try {

            transaction = session.beginTransaction();
            manufacturers = session.createQuery("from Manufacturer").list();
            transaction.commit();

        } catch (HibernateException e) {

            if (transaction != null) transaction.rollback();
            throw e;

        } finally {
            session.close();
        }

        return manufacturers;
    }

    public static void delete(Manufacturer manufacturer) {
        ManufacturerRepository.managePersistentStore(true, manufacturer);
    }

    public static void createOrUpdate(Manufacturer manufacturer) {
        ManufacturerRepository.managePersistentStore(false, manufacturer);
    }

    private static void managePersistentStore(Boolean delete, Manufacturer manufacturer) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;

        try {

            transaction = session.beginTransaction();

            if (delete) {
                session.delete(manufacturer);
            } else {
                session.saveOrUpdate(manufacturer);
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
