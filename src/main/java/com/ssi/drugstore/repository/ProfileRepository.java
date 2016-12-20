package com.ssi.drugstore.repository;

import com.ssi.drugstore.model.HibernateUtil;
import com.ssi.drugstore.model.Manufacturer;
import com.ssi.drugstore.model.Profile;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Andrzej on 19.12.2016.
 */
public class ProfileRepository {
    public static boolean isExisting(String id) {

        Integer identifier = Integer.parseInt(id);

        List profiles = ProfileRepository.all();
        boolean exist = false;

        for (Object element: profiles) {

            Profile profile = (Profile) element;
            if (profile.getId() == identifier) exist = true;
        }

        return exist;
    }

    public static Profile getForIdentifier(String id) {

        int identifier = Integer.parseInt(id);

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        Profile profile;

        try {

            transaction = session.beginTransaction();
            profile = (Profile) session.get(Profile.class, identifier);
            transaction.commit();

        } catch (HibernateException e) {

            if (transaction != null) transaction.rollback();
            throw e;

        } finally {
            session.close();
        }

        return profile;
    }

    public static List all() {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        List<Profile> profiles = new ArrayList();

        try {

            transaction = session.beginTransaction();
            profiles = session.createQuery("from Profile").list();
            transaction.commit();

        } catch (HibernateException e) {

            if (transaction != null) transaction.rollback();
            throw e;

        } finally {
            session.close();
        }

        return profiles;
    }

    public static void delete(Profile profile) {
        ProfileRepository.managePersistentStore(true, profile);
    }

    public static void createOrUpdate(Profile profile) {
        ProfileRepository.managePersistentStore(false, profile);
    }

    private static void managePersistentStore(Boolean delete, Profile profile) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;

        try {

            transaction = session.beginTransaction();

            if (delete) {
                session.delete(profile);
            } else {
                session.saveOrUpdate(profile);
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
