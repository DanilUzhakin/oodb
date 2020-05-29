package server.repository;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import server.entity.ClientData;
import server.entity.Rent;
import server.entity.Client;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Component
public class ClientRepository {

    @PersistenceContext(name = "entityManagerFactory")
    protected EntityManager entityManager;

    public List<Client> findAll() {

        Query query = entityManager.createQuery(
                "select c from Client c ", Client.class);

        List<Client> clients = query.getResultList();

        return clients;

    }

    public List<ClientData> findByName(String name) {
        //Query query = entityManager.createQuery(
        //        "select c from Client c where c.name like :name ", Client.class);
        // with view clientdata in db
        Query query = entityManager.createNativeQuery(
                "select * from clientdata where name like :name ", ClientData.class);
        query.setParameter("name", '%'+name+'%');

        List<ClientData> clients = query.getResultList();
        return clients;
    }
//    public Client findByRentId( Long id ) {
//
//        Query query = entityManager.createQuery(
//                "select c from Client c JOIN c.rents a where  a.id = :id ", Client.class);
//        query.setParameter("id", id);
//        try {
//            return (Client) query.getSingleResult();
//        } catch (Exception e) {}
//
//        return null;
//    }

//    public List<Rent> getClientRents(Long clientId ) {
//        Query query = entityManager.createQuery(
//                "select a from Client c JOIN c.rents a where c.id = :id ", Rent.class);
//        query.setParameter("id", clientId);
//
//        return query.getResultList();
//    }

    public List<Rent> getClientRents(Client client ) {
        Query query = entityManager.createQuery(
                "select a from Client c JOIN c.rents a where c = :client ", Rent.class);
        query.setParameter("client", client);

        return query.getResultList();
    }

    public Client findById(Long id) {
        return entityManager.find(Client.class, id);
    }


    @Transactional
    public Client save(Client client) {

        if (client == null ) return null;

        if (client.getId() != null) {
            client = entityManager.merge(client);
        } else {
            entityManager.persist(client);
        }

        return client;
    }

    @Transactional
    public boolean removeClient(Long clientid) {
        Client client = entityManager
                .find(Client.class, clientid);
        if(client == null)
            return false;
        entityManager.remove(client);
        return true;
    }
    @Transactional
    public boolean removeRent(Long id){
        Rent rent = entityManager.find(Rent.class, id);
        if(rent == null)
            return false;
        entityManager.remove(rent);
        return true;
    }
    @Transactional
    public boolean removeClientRents(Long id) {
        Client client = entityManager.find(Client.class, id);
        if(client == null)
            return false;
        List<Rent> rents = client.getRents();
        rents.clear();
        client.setRents(rents);
        entityManager.merge(client);
        return true;
    }
}
