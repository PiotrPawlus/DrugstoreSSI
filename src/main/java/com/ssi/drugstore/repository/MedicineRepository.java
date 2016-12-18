package com.ssi.drugstore.repository;

import com.ssi.drugstore.model.Category;
import com.ssi.drugstore.model.HibernateUtil;
import com.ssi.drugstore.model.Medicine;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by piotrpawlus on 16/12/2016.
 */
public class MedicineRepository {

    public static boolean isExisting(String id) {

        Integer identifier = Integer.parseInt(id);

        List medicines = MedicineRepository.all();
        boolean exist = false;

        for (Object element: medicines) {

            Medicine medicine = (Medicine) element;
            if (medicine.getId() == identifier) exist = true;
        }

        return exist;
    }

    public static Medicine getForIdentifier(String id) {

        int identifier = Integer.parseInt(id);

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        Medicine medicine;

        try {

            transaction = session.beginTransaction();
            medicine = (Medicine) session.get(Medicine.class, identifier);
            transaction.commit();

        } catch (HibernateException e) {

            if (transaction != null) transaction.rollback();
            throw e;

        } finally {
            session.close();
        }

        return medicine;
    }

    public static List all() {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        List<Medicine> medicines = new ArrayList();

        try {

            transaction = session.beginTransaction();
            medicines = session.createQuery("from Medicine").list();
            transaction.commit();

        } catch (HibernateException e) {

            if (transaction != null) transaction.rollback();
            throw e;

        } finally {
            session.close();
        }

        return medicines;
    }

    public static void createOrUpdate(Medicine medicine) {

        Category category = medicine.getCategory();
        Category newCategory = CategoryRepository.getForIdentifier(category.getId());
        medicine.setCategory(newCategory);

        MedicineRepository.managePersistentStore(false, medicine);
    }

    public static void delete(Medicine medicine) {
        MedicineRepository.managePersistentStore(true, medicine);
    }

    private static void managePersistentStore(Boolean delete, Medicine medicine) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;

        try {

            transaction = session.beginTransaction();

            if (delete) {
                session.delete(medicine);
            } else {
                session.saveOrUpdate(medicine);
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
