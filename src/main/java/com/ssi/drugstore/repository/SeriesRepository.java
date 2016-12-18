package com.ssi.drugstore.repository;

import com.ssi.drugstore.model.HibernateUtil;
import com.ssi.drugstore.model.Medicine;
import com.ssi.drugstore.model.Series;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by piotrpawlus on 16/12/2016.
 */
public class SeriesRepository {

    public static boolean isExisting(String id) {

        Integer identifier = Integer.parseInt(id);

        List seriesList = SeriesRepository.all();
        boolean exist = false;

        for (Object element: seriesList) {

            Series series = (Series) element;
            if (series.getId() == identifier) exist = true;
        }

        return exist;
    }

    public static Series getForIdentifier(String id) {

        Integer identifier = Integer.parseInt(id);

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        Series series;

        try {

            transaction = session.beginTransaction();
            series = (Series) session.get(Series.class, identifier);
            transaction.commit();

        } catch (HibernateException e) {

            if (transaction != null) transaction.rollback();
            throw e;

        } finally {
            session.close();
        }

        return series;
    }

    public static Boolean isEmpty(int id) {
        return amount(id) < 1;
    }

    public static Boolean isLowAmount(int id) {

        Integer count = amount(id);

        return (count < 15 && count > 0);
    }

    private static Integer amount(int id) {

        List<Series> list = allForMedicineId(id);

        int count = 0;
        for (Series series: list) {
            count += series.getAmount();
        }

        return count;
    }

    public static List<Series> allForMedicineId(String id) {

        Integer identifier = Integer.parseInt(id);

        return allForMedicineId(identifier);
    }

    public static List<Series> allForMedicineId(int id) {
        return fetchForQuery("from Series where medicine=" + id);
    }

    public static List<Series> all() {
        return fetchForQuery("from Series");
    }

    private static List<Series> fetchForQuery(String query) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        List seriesList = new ArrayList();

        try {

            transaction = session.beginTransaction();
            seriesList = (List<Series>) session.createQuery(query).list();
            transaction.commit();

        } catch (HibernateException e) {

            if (transaction != null) transaction.rollback();
            throw e;

        } finally {
            session.close();
        }

        return seriesList;
    }

    public static void createOrUpdate(Series series, String medicineId) {

        series.setMedicine(MedicineRepository.getForIdentifier(medicineId));
        SeriesRepository.managePersistentStore(false, series);
    }

    public static void delete(Series series) {
        SeriesRepository.managePersistentStore(true, series);
    }

    private static void managePersistentStore(Boolean delete, Series series) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;

        try {

            transaction = session.beginTransaction();

            if (delete) {
                session.delete(series);
            } else {
                session.saveOrUpdate(series);
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
