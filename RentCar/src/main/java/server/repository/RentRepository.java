package server.repository;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import server.entity.Rent;
import server.entity.Client;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Component
public class RentRepository {

    @PersistenceContext(name = "entityManagerFactory")
    protected EntityManager entityManager;

//    public List<Rent> findClientsRent(Client client) {
//
//        Query query = entityManager.createQuery(
//                "select a from Rent a where a.client = :client ", Rent.class);
//
//        query.setParameter("client", client);
//        List<Rent> Rents = query.getResultList();
//
//        return Rents;
//    }


    @Transactional
    public Rent save(Rent rent) {
        if (rent != null && rent.getId() != null) {
            rent = entityManager.merge(rent);
        } else {
            entityManager.persist(rent);
        }

        return rent;
    }


    @Transactional
    public void remove(Rent rent) {
        entityManager.remove(rent);
    }
}
