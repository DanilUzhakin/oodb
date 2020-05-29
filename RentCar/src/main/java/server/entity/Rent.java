package server.entity;

import javax.persistence.*;

@Entity
public class Rent {
    @Id
    @GeneratedValue()
    private Long id;

    @Column(length=20)
    private String rentcar;


    @ManyToOne(cascade = CascadeType.ALL)
    private Client client;

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRentcar() {
        return rentcar;
    }

    public void setRentcar(String rentcar) {
        this.rentcar = rentcar;
    }
}